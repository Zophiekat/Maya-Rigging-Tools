"""
Maya Python Script: Re-enable Disabled Toolshelf Buttons
Author: GitHub Copilot
Date: August 31, 2025

This script helps re-enable disabled toolshelf buttons and UI elements
that may have been disabled when Maya went offline and came back online.
"""

import maya.cmds as cmds
import maya.mel as mel

def enable_all_toolshelf_buttons():
    """
    Re-enable all disabled toolshelf buttons and UI elements.
    """
    try:
        # Get all toolshelf tabs
        shelf_tabs = cmds.tabLayout('ShelfLayout', query=True, childArray=True)
        
        if not shelf_tabs:
            print("No shelf tabs found.")
            return
        
        enabled_count = 0
        
        for tab in shelf_tabs:
            print(f"Processing shelf tab: {tab}")
            
            # Get all shelf buttons in this tab
            shelf_buttons = cmds.shelfLayout(tab, query=True, childArray=True)
            
            if shelf_buttons:
                for button in shelf_buttons:
                    try:
                        # Check if the button exists and is disabled
                        if cmds.control(button, exists=True):
                            # Enable the button
                            cmds.control(button, edit=True, enable=True)
                            enabled_count += 1
                            print(f"  Enabled button: {button}")
                    except Exception as e:
                        print(f"  Could not enable button {button}: {str(e)}")
        
        print(f"\nTotal buttons enabled: {enabled_count}")
        
    except Exception as e:
        print(f"Error enabling toolshelf buttons: {str(e)}")

def enable_menu_items():
    """
    Re-enable disabled menu items that might have been affected.
    """
    try:
        # Get the main Maya window
        main_window = mel.eval('$tempVar = $gMainWindow')
        
        # Get all menu items
        all_menus = cmds.window(main_window, query=True, menuArray=True)
        
        if all_menus:
            enabled_count = 0
            for menu in all_menus:
                try:
                    if cmds.control(menu, exists=True):
                        cmds.control(menu, edit=True, enable=True)
                        enabled_count += 1
                except:
                    pass
            print(f"Enabled {enabled_count} menu items")
        
    except Exception as e:
        print(f"Error enabling menu items: {str(e)}")

def refresh_ui():
    """
    Refresh the Maya UI to ensure changes take effect.
    """
    try:
        # Refresh the shelf
        mel.eval('updateShelfTabsAndContents')
        
        # Refresh the main window
        main_window = mel.eval('$tempVar = $gMainWindow')
        cmds.refresh(main_window)
        
        print("UI refreshed successfully")
        
    except Exception as e:
        print(f"Error refreshing UI: {str(e)}")

def restore_default_shelves():
    """
    Restore default shelves if they're missing or corrupted.
    """
    try:
        # Load default shelves
        mel.eval('loadNewShelf "shelf_General.mel"')
        mel.eval('loadNewShelf "shelf_Curves.mel"')
        mel.eval('loadNewShelf "shelf_Surfaces.mel"')
        mel.eval('loadNewShelf "shelf_Polygons.mel"')
        mel.eval('loadNewShelf "shelf_Subdiv.mel"')
        mel.eval('loadNewShelf "shelf_Deformation.mel"')
        mel.eval('loadNewShelf "shelf_Dynamics.mel"')
        mel.eval('loadNewShelf "shelf_Rendering.mel"')
        mel.eval('loadNewShelf "shelf_Animation.mel"')
        mel.eval('loadNewShelf "shelf_FX.mel"')
        
        print("Default shelves restored")
        
    except Exception as e:
        print(f"Error restoring default shelves: {str(e)}")

def enable_ui_comprehensive():
    """
    Main function to comprehensively re-enable disabled UI elements.
    """
    print("=" * 50)
    print("Maya UI Re-enabler Script")
    print("=" * 50)
    
    print("\n1. Enabling toolshelf buttons...")
    enable_all_toolshelf_buttons()
    
    print("\n2. Enabling menu items...")
    enable_menu_items()
    
    print("\n3. Refreshing UI...")
    refresh_ui()
    
    print("\n4. Restoring default shelves (if needed)...")
    restore_default_shelves()
    
    print("\n" + "=" * 50)
    print("Script completed! Your toolshelf buttons should now be enabled.")
    print("If buttons are still missing, try: Window > Settings/Preferences > Shelves > Restore Default Shelves")
    print("=" * 50)

# Utility function for quick execution
def quick_enable():
    """
    Quick function to just enable buttons without full restore.
    """
    enable_all_toolshelf_buttons()
    refresh_ui()

if __name__ == "__main__":
    # Run the comprehensive enable function
    enable_ui_comprehensive()