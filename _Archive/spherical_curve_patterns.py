"""
Script: Optimal Spherical Coverage Curve
Author: GitHub Copilot
Date: September 19, 2025
Description: Creates a Fibonacci spiral on a sphere for optimal visual coverage with a single curve
"""

import maya.cmds as cmds
import math

def create_spherical_fibonacci_spiral(radius=5.0, points=400, curve_name="fibonacciSpiral", temp_reference_sphere=True):
    """
    Creates a spherical Fibonacci spiral - the pattern that provides the best visual coverage
    of a sphere with a single continuous curve. Uses the golden angle for optimal point distribution.
    
    Args:
        radius (float): Radius of the sphere
        points (int): Total number of points in the spiral (controls resolution)
        curve_name (str): Name of the resulting curve
        temp_reference_sphere (bool): Whether to create a temporary reference sphere that gets deleted after creation
        
    Returns:
        str: Name of the created curve
    """
    curve_points = []
    
    # Golden angle in radians (approximately 137.5 degrees)
    golden_angle = math.pi * (3.0 - math.sqrt(5.0))
    
    for i in range(points):
        # Normalized progress from 0 to 1
        t = float(i) / float(points-1)
        
        # Latitude (from south to north pole)
        inclination = math.acos(2 * t - 1)  # 0 to pi
        
        # Longitude (golden angle increment for optimal distribution)
        azimuth = golden_angle * i
        
        # Convert spherical to Cartesian coordinates
        x = radius * math.sin(inclination) * math.cos(azimuth)
        y = radius * math.sin(inclination) * math.sin(azimuth)
        z = radius * math.cos(inclination)
        
        curve_points.append((x, y, z))
    
    # Create the curve
    curve = cmds.curve(p=curve_points, degree=1, n=curve_name)
    
    # Optionally create a temporary reference sphere and then delete it
    if temp_reference_sphere:
        # Create sphere with very transparent visibility
        sphere = cmds.polySphere(r=radius, subdivisionsX=20, subdivisionsY=20, n=f"TEMP_{curve_name}_reference")[0]
        cmds.setAttr(f"{sphere}.visibility", 0.2)
        
        # Force Maya to refresh the viewport so the sphere is visible during curve creation
        cmds.refresh()
        
        # Delete the reference sphere
        cmds.delete(sphere)
    
    return curve

# Execute the script when run directly
if __name__ == "__main__":
    # Create the spiral with 400 points (50 turns × 8 points per turn)
    spiral = create_spherical_fibonacci_spiral(radius=5.0, points=400, curve_name="optimalSphericalCurve", temp_reference_sphere=True)
    
    # Select the curve
    cmds.select(spiral)
    
    print("""
Spherical Fibonacci Spiral:
--------------------------
Created optimal spherical curve with 400 points.

This pattern provides the best visual coverage of a sphere with a single continuous curve
due to its use of the golden angle (approx. 137.5°) for point distribution.

This mathematical pattern is found throughout nature in phenomena like:
- Sunflower seed arrangements
- Pinecone spirals
- Pineapple fruitlets
""")
