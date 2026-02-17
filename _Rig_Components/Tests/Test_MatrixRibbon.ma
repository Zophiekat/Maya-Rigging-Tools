//Maya ASCII 2024 scene
//Name: Test_MatrixRibbon.ma
//Last modified: Sun, Oct 19, 2025 04:18:13 PM
//Codeset: UTF-8
requires maya "2024";
requires -nodeType "floatComposite" -nodeType "floatConstant" -nodeType "colorConstant"
		 -nodeType "floatLogic" -nodeType "floatMath" "lookdevKit" "1.0";
requires -nodeType "applyRel3FloatsOverride" "renderSetup.py" "1.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2024";
fileInfo "version" "2024";
fileInfo "cutIdentifier" "202310181224-69282f2959";
fileInfo "osv" "Mac OS X 20.0.1";
fileInfo "UUID" "8C552FFF-684E-56BD-B9F4-24BBD5C4CA1D";
fileInfo "exportedFrom" "/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools/_Rig_Components/Tests/Test_MatrixRibbon.ma";
createNode transform -s -n "persp";
	rename -uid "4DC3FCFB-2D4B-9C13-0399-B590AB518C05";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.688440918298669 2.5536166086262502 4.0150472180074726 ;
	setAttr ".r" -type "double3" -30.938352729550271 -1779.3999999997347 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "0CB3B2E5-3C4E-16F8-5344-0698C832D958";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 4.8691912219617741;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 2 1.5930143285968836 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "1797749A-5F4B-EE05-FF95-2882029C0161";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "84950C79-6F40-6AC3-8116-5DAD7E6D8602";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "4127A524-3B4E-56B4-5905-AFA404BA017C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "BBE3D9C8-A84B-F730-5E1F-F19C257607A5";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "68FEBEA3-884A-D3D9-D4D1-14B8F8CCA765";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "CFA8F6D2-E247-94F6-7102-BCB69D5B8A88";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode dagContainer -n "Ribbon__9CC60B__Asset";
	rename -uid "BE5BF5FF-DD46-403E-636C-3E90E4C4E411";
	addAttr -ci true -sn "Instances" -ln "Instances" -nn "Instances" -min 0 -max 32 
		-at "long";
	addAttr -ci true -sn "Overlay_Axis_Scale" -ln "Overlay_Axis_Scale" -nn "Overlay Axis Scale" 
		-dv 0.01 -min 0.01 -max 10 -at "float";
	addAttr -ci true -sn "Overlay_Axis_Width" -ln "Overlay_Axis_Width" -nn "Overlay Axis Width" 
		-min -1 -max 10 -at "float";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "p-add.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 08:19:51";
	setAttr ".Instances" 9;
	setAttr ".Overlay_Axis_Scale" 0.25;
	setAttr ".Overlay_Axis_Width" 4;
	setAttr ".nts" -type "string" "[Attributes]\n\nInstances\n- Type: Integer\n- Minimum: 0\n- Maximum: 32\n- Description: Number of items to spread along the Surface\n\n\nOverlay Axis Scale\n- Type: Float\n- Minimum: 0.01\n- Maximum: 10.0\n- Description: Distance the end cv of the curve shape is away from the Axis Overlay object's origin.\n\n\nOverlay Axis Width\n- Type: Integer\n- Minimum: -1.0\n- Maximum: 10.0\n- Description: Line Width of the curve shapes making the Axis Overlay object.\n\n\t";
createNode dagContainer -n "NodeGroup__9CC60B__Viewport_Display" -p "Ribbon__9CC60B__Asset";
	rename -uid "3B825DE6-474F-BD1A-6071-8EAB307C8AA8";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "RS_visible.png";
	setAttr ".vwm" 0;
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:52:21";
	setAttr ".rp" -type "double3" 0.12499999999999989 0.125 0.125 ;
	setAttr ".sp" -type "double3" 0.12499999999999989 0.125 0.125 ;
	setAttr ".nts" -type "string" "Contains all nodes related to the Asset's Viewport Display decorations.\n\nThese nodes are cosmetic and should not affect the function of the Asset.";
createNode transform -n "__9CC60B__Overlay_Axis" -p "NodeGroup__9CC60B__Viewport_Display";
	rename -uid "156BD603-944D-F866-7CE3-5ABFA256EB1B";
	setAttr ".v" no;
createNode nurbsCurve -n "__9CC60B__Overlay_Axis_Z_Shape" -p "__9CC60B__Overlay_Axis";
	rename -uid "07D58CED-A044-8183-DD96-E39D24D1C793";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2142 0.35949922 5.1945 ;
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 0
		0 0 0.25
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "__9CC60B__Overlay_Axis_Y_Shape" -p "__9CC60B__Overlay_Axis";
	rename -uid "0C333324-0F4E-13B9-A493-73BF9B4D3A82";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.50160015 1.2218 0.075199991 ;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 0
		0 0.25 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "__9CC60B__Overlay_Axis_X_Shape" -p "__9CC60B__Overlay_Axis";
	rename -uid "51D751FE-CE48-7DA4-4099-91A486CD66BA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1.2859 0.14659999 0.15259972 ;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 0
		0.25 0 0
		;
	setAttr ".adot" yes;
createNode dagContainer -n "NodeGroup__9CC60B__Overlay_Axis" -p "NodeGroup__9CC60B__Viewport_Display";
	rename -uid "B0808151-5B49-771D-74CF-6B8DA1344F7A";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "out_holder.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:50:21";
	setAttr ".rp" -type "double3" 0.12499999999999989 0.125 0.125 ;
	setAttr ".sp" -type "double3" 0.12499999999999989 0.125 0.125 ;
	setAttr ".nts" -type "string" "Contains all Overlay Axis objects.\n\nThe shapes of the objects are instanced from the \"__9CC60B__Overlay_Axis\" node.\n\nThe nodes inside this container were created with the Duplicate Special operator.";
createNode transform -n "__9CC60B__Overlay_Axis_03" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "0B0144C3-D14C-0758-3A3C-EC88D16F4D9B";
createNode transform -n "__9CC60B__Overlay_Axis_05" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "85901027-E447-5527-E3E0-2798444F61B5";
createNode transform -n "__9CC60B__Overlay_Axis_07" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "CAB55064-BC42-0A6E-D6CE-1EB32341718E";
createNode transform -n "__9CC60B__Overlay_Axis_09" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "B19D116C-B14F-A1E8-CB52-2DAC2E2F4735";
createNode transform -n "__9CC60B__Overlay_Axis_11" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "202F3869-DD4C-C04C-02BC-DBA9C9BA0FE8";
createNode transform -n "__9CC60B__Overlay_Axis_13" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "0D02AD96-1C42-583C-DE25-D996349A8A17";
createNode transform -n "__9CC60B__Overlay_Axis_15" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "0DFCBE56-9245-14B2-B216-AABC8EE63EDE";
createNode transform -n "__9CC60B__Overlay_Axis_17" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "4C2D0D0B-A043-C9AB-8E80-268A805104DD";
createNode transform -n "__9CC60B__Overlay_Axis_19" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "F88F938B-CF44-C1F3-2A8C-398FFAF2E1D8";
createNode transform -n "__9CC60B__Overlay_Axis_21" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "FF292D1C-BD4A-7D27-8ECF-CB8BF8465CDF";
createNode transform -n "__9CC60B__Overlay_Axis_23" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "A8FD48CC-3244-D615-2925-2085F13A32AF";
createNode transform -n "__9CC60B__Overlay_Axis_25" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "B303D6FF-204A-E12C-85B8-CB9F0CBAE9A3";
createNode transform -n "__9CC60B__Overlay_Axis_27" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "A6423336-D34B-E367-4C4F-EA9D8BA58DBA";
createNode transform -n "__9CC60B__Overlay_Axis_29" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "17EF44C8-F047-1F47-9DF9-25AA831CF51B";
createNode transform -n "__9CC60B__Overlay_Axis_31" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "4839045A-DE4C-89D1-0367-458904241469";
createNode transform -n "__9CC60B__Overlay_Axis_01" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "B052DC8B-7545-3D39-15EE-6C824856DE9E";
createNode transform -n "__9CC60B__Overlay_Axis_02" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "98F3A67B-AF4B-2FC5-1F28-E5982C9F511E";
createNode transform -n "__9CC60B__Overlay_Axis_04" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "21EB1B6A-CD4B-A319-1B43-C58CBD54D6E6";
	setAttr ".t" -type "double3" 4.4408920985006262e-16 0 0 ;
createNode transform -n "__9CC60B__Overlay_Axis_06" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "EA660C47-4444-94BE-5A1B-D7890C39F2F8";
	setAttr ".t" -type "double3" -8.8817841970012523e-16 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 1 ;
createNode transform -n "__9CC60B__Overlay_Axis_08" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "42089E34-5A42-C2B9-4DDD-409029A727BB";
createNode transform -n "__9CC60B__Overlay_Axis_10" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "5DA068DC-C540-6A6C-79B3-24A03B34360A";
createNode transform -n "__9CC60B__Overlay_Axis_12" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "7CD93779-0D44-5C71-DB3B-108D9D5D28FE";
createNode transform -n "__9CC60B__Overlay_Axis_14" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "4B6E0772-124A-209C-8980-2284B4A20386";
createNode transform -n "__9CC60B__Overlay_Axis_16" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "7DE32814-634B-9532-A560-89A73A6CAFF8";
createNode transform -n "__9CC60B__Overlay_Axis_18" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "2568DCFE-7D49-EB29-AA78-03A8FCDD775D";
createNode transform -n "__9CC60B__Overlay_Axis_20" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "79C27148-2646-576D-E65C-59BAF6CA6128";
createNode transform -n "__9CC60B__Overlay_Axis_22" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "37D2A0A1-D64E-BB99-773B-649E747A9151";
createNode transform -n "__9CC60B__Overlay_Axis_24" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "DEDAAF54-854F-0948-2422-52B7D4B52514";
createNode transform -n "__9CC60B__Overlay_Axis_26" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "A6C5F5F9-2F41-D27D-29F0-B3BA877575FD";
createNode transform -n "__9CC60B__Overlay_Axis_28" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "EE3872BE-E048-F10A-005F-AEA53F353FF5";
createNode transform -n "__9CC60B__Overlay_Axis_30" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "8E539665-7248-C3CD-9CB8-89A7B9E1DBD1";
createNode transform -n "__9CC60B__Overlay_Axis_32" -p "NodeGroup__9CC60B__Overlay_Axis";
	rename -uid "79A86C29-1C4F-9497-CEB0-8C96306B89F7";
createNode dagContainer -n "NodeGroup__9CC60B__View_Overlay" -p "NodeGroup__9CC60B__Viewport_Display";
	rename -uid "57D42E6A-8E41-B265-3F4E-EBA27A9AF125";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "hypergraph.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:49:24";
	setAttr ".nts" -type "string" "Contains all of the View Overlay nodes.\n\nThese nodes control the visibility of the Overlay Axis object of equal or lower index than the \"Instances\" attribute value, This is because Maya can't generate new objects without the help of scripting or Bifrost so the Asset hides the unused ones instead.";
createNode dagContainer -n "NodeGroup__9CC60B__System_Ribbon" -p "Ribbon__9CC60B__Asset";
	rename -uid "B35BEDC4-5247-2A2F-BA16-14A672A2F37E";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "falloff_primitive.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 15:17:24";
	setAttr ".rp" -type "double3" 2 0 0 ;
	setAttr ".sp" -type "double3" 2 0 0 ;
	setAttr ".nts" -type "string" "Contains all nodes responsible for deforming the bezier curve handles that are driving the creation of the lofted surface mesh.\n\nIt uses 2 Bezier Curves so that the UVpin is able to utilize the lofted surface's normal orientation for driving the rotation of the spreaded instances along the surface.\n\n\nUtilizing 1 Bezier Curve would result in not being able to control orientation if the curve was used as the geometry for the UVpin, or if the curve was used to generate a Sweep Mesh to drive the UVpin then we gain rotation on the Y and Z axis instead but lose control over the X axis causing twisting.\n\nThe above is similar to what a SplineIK would behave like";
createNode transform -n "Offset_DRV_Joint_01" -p "NodeGroup__9CC60B__System_Ribbon";
	rename -uid "B79A9B86-B74B-78CF-206F-F8BC538B26E4";
createNode joint -n "DRV_Joint_01" -p "Offset_DRV_Joint_01";
	rename -uid "81A6C9E4-4742-4FA3-DE0C-5D8F292611EB";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 2;
createNode joint -n "RestPosition_Joint_01" -p "Offset_DRV_Joint_01";
	rename -uid "42CC8C77-504A-EAC1-FBAC-75AC39B8B191";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "Offset_DRV_Joint_02" -p "NodeGroup__9CC60B__System_Ribbon";
	rename -uid "B46F30FC-A94C-E249-8824-598662216DBA";
	setAttr ".t" -type "double3" 2 0 0 ;
createNode joint -n "DRV_Joint_02" -p "Offset_DRV_Joint_02";
	rename -uid "CC49A8BB-9340-9183-7635-EC8C041CAFF6";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 2;
createNode joint -n "RestPosition_Joint_02" -p "Offset_DRV_Joint_02";
	rename -uid "AE34E3A9-3B40-E952-183D-C5A063761D28";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "Offset_DRV_Joint_03" -p "NodeGroup__9CC60B__System_Ribbon";
	rename -uid "C76349CE-B44D-6237-3406-1DA1CE835ECA";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode joint -n "DRV_Joint_03" -p "Offset_DRV_Joint_03";
	rename -uid "5D79C99E-644D-10F6-A1D6-D78EBE454362";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 2;
createNode joint -n "RestPosition_Joint_03" -p "Offset_DRV_Joint_03";
	rename -uid "13993C17-5B47-9C0C-281E-7B81672920E2";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "bezier_edge_in" -p "NodeGroup__9CC60B__System_Ribbon";
	rename -uid "4866D6D3-3741-7DE7-B8DF-4384179C7D95";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 2.53684 0.72601002 1.0248548 ;
createNode bezierCurve -n "bezier_edge_inShape" -p "bezier_edge_in";
	rename -uid "B688BFA8-324E-51CB-E1B8-D5AEB1C69721";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr ".ls" 3;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 1 1 2 2 2
		7
		0 0 0.10000000149011612
		0.5 0 0.10000000149011612
		1.5 0 0.10000000149011612
		2 0 0.10000000149011612
		2.5 0 0.10000000149011612
		3.5 0 0.10000000149011612
		4 0 0.10000000149011612
		;
	setAttr ".dcv" yes;
	setAttr ".adot" yes;
createNode transform -n "bezier_edge_out" -p "NodeGroup__9CC60B__System_Ribbon";
	rename -uid "10F15E82-064C-220A-0906-FC8DF4FC2653";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 2.5574555 0.72515637 1.0253992 ;
createNode bezierCurve -n "bezier_edge_outShape" -p "bezier_edge_out";
	rename -uid "410592E9-CD46-0A3D-B11F-6A90CC6577B2";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr ".ls" 3;
	setAttr ".cc" -type "dataBezierCurve" 
		3 4 0 no 3
		9 0 0 0 1 1 1 2 2 2
		7
		0 0 -0.10000000149011612
		0.5 0 -0.10000000149011612
		1.5 0 -0.10000000149011612
		2 0 -0.10000000149011612
		2.5 0 -0.10000000149011612
		3.5 0 -0.10000000149011612
		4 0 -0.10000000149011612
		;
	setAttr ".dcv" yes;
	setAttr ".adot" yes;
createNode transform -n "loftedSurface1" -p "NodeGroup__9CC60B__System_Ribbon";
	rename -uid "C8691BB3-854D-DB7B-49B5-57AE58CAC00F";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 2.5783186 0.72429317 1.0259541 ;
	setAttr ".it" no;
createNode nurbsSurface -n "loftedSurfaceShape1" -p "loftedSurface1";
	rename -uid "B665805C-6A42-C8F5-9C85-E8AC5196A7A0";
	setAttr -k off ".v";
	setAttr ".mb" no;
	setAttr ".csh" no;
	setAttr ".rcsh" no;
	setAttr ".gal" 2;
	setAttr ".ssa" 32;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 15;
	setAttr ".cvto" 0;
createNode transform -n "__9CC60B__ReadMe_Notes" -p "Ribbon__9CC60B__Asset";
	rename -uid "145FA128-7840-FBB3-F315-D98C745CB8DE";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".v" no;
	setAttr ".nts" -type "string" "Hi! Don't forget to read the notes in the Asset Nodes. most of them should have stuff written in them :3";
createNode locator -n "__9CC60B__ReadMe_NotesShape" -p "__9CC60B__ReadMe_Notes";
	rename -uid "8CAFC542-3A4E-645F-7996-7A831F50EA79";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr -k off ".v";
	setAttr ".nts" -type "string" "Hi! Don't forget to read the notes in the Asset Nodes. most of them should have stuff written in them :3";
createNode dagContainer -n "NodeGroup__9CC60B__System_Instance_Positions";
	rename -uid "98DA261D-DF48-23CF-541A-D997A7C9F82A";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "falloff_primitive.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:54:30";
	setAttr ".nts" -type "string" "Contains all nodes related to the way Instance Positions are calculated across the Surface.\n\nIt takes the value of the Asset's Instance attribute and divides it by the total U distance of the UVmap of the lofted surface ranging from 0.0 to 1.0\n\nFormula:\n1 / {Instances} * Index";
createNode dagContainer -n "NodeGroup__9CC60B__Offset_Float" -p "NodeGroup__9CC60B__System_Instance_Positions";
	rename -uid "AFD10B9D-E548-3A83-8474-8795625A41B2";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "hypergraph.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:51:16";
createNode dagContainer -n "NodeGroup__9CC60B__Multiply_Position" -p "NodeGroup__9CC60B__System_Instance_Positions";
	rename -uid "D74A586A-E943-97F3-8F0F-949D0E64E81B";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "hypergraph.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:49:55";
createNode dagContainer -n "NodeGroup__9CC60B__FloatConstant_U" -p "NodeGroup__9CC60B__System_Instance_Positions";
	rename -uid "2EAB04E4-CC49-18CE-7697-0086FEC82AAB";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "hypergraph.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/10/19 14:48:35";
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_01" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_02" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_03" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_04" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_05" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_06" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_07" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_08" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_09" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_10" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_11" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_12" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_13" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_14" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_15" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_16" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_17" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_18" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_19" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_20" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_21" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_22" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_23" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_24" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_25" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_26" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_27" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_28" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_29" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_30" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_31" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape" "__9CC60B__Overlay_Axis_32" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_01" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_02" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_03" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_04" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_05" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_06" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_07" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_08" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_09" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_10" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_11" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_12" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_13" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_14" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_15" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_16" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_17" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_18" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_19" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_20" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_21" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_22" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_23" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_24" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_25" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_26" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_27" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_28" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_29" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_30" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_31" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape" "__9CC60B__Overlay_Axis_32" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_01" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_02" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_03" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_04" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_05" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_06" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_07" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_08" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_09" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_10" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_11" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_12" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_13" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_14" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_15" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_16" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_17" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_18" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_19" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_20" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_21" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_22" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_23" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_24" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_25" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_26" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_27" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_28" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_29" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_30" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_31" ;
parent -s -nc -r -add "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape" "__9CC60B__Overlay_Axis_32" ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "121706C9-AA44-56C1-6486-84B3E8A60EB7";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "9741D398-AA46-731C-B3CE-2B89330BA71E";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "1CEA7CD3-3643-74B7-9C2B-CA9664CB5A00";
createNode displayLayerManager -n "layerManager";
	rename -uid "39699A83-3C4E-B852-AE08-6E80D6C79F4C";
createNode displayLayer -n "defaultLayer";
	rename -uid "761B2303-9D48-7D92-2A17-5BB003AF784A";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "367785BE-8D47-4F37-9293-AEB4B02DED99";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "343E1C1B-6249-6DCE-8D25-C5A32D4A927A";
	setAttr ".g" yes;
createNode applyRel3FloatsOverride -n "applyRel3FloatsOverride1";
	rename -uid "4B6AE460-964C-948A-1041-07B2940891D0";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "20F48857-2742-5A0D-782C-B590CDB23362";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 250 -ast 0 -aet 250 ";
	setAttr ".st" 6;
createNode multiplyPointByMatrix -n "Handle_In_Mid_01";
	rename -uid "EC714A39-3E4B-F2E3-7643-ED8FBB026D89";
createNode multiplyPointByMatrix -n "Handle_In_End_01";
	rename -uid "D95F100C-F94E-0FAF-3D2C-39A4CAE78603";
createNode multiplyPointByMatrix -n "Handle_In_End_02";
	rename -uid "B322E939-A64F-9321-3A89-61BE59AFA31D";
createNode multiplyPointByMatrix -n "Handle_In_Mid_02";
	rename -uid "0CA3519D-D348-1963-2377-5EA373EF327B";
createNode multiplyPointByMatrix -n "Handle_In_Start_02";
	rename -uid "2EF8CBC5-394F-FB2A-1B7D-B0BD01468D79";
createNode distanceBetween -n "distanceBetween1";
	rename -uid "E02F05DF-9046-6FCA-6617-16B85E3FD7AF";
createNode distanceBetween -n "distanceBetween2";
	rename -uid "AE03D745-3C46-28AF-1DC6-4F994427FDD0";
createNode floatConstant -n "Tangent_Scale_01_and_02";
	rename -uid "6885DEA3-4047-46AE-9038-9D8A3E18E3D0";
createNode floatMath -n "floatMath1";
	rename -uid "9C0D3C44-6340-0F96-3521-74880FA25B02";
	setAttr "._fb" -1;
	setAttr "._cnd" 2;
createNode floatMath -n "Divide_01_and_02";
	rename -uid "CAA38C97-2544-1CD8-671F-A5860FD1AB35";
	setAttr "._cnd" 3;
createNode floatMath -n "Divide_02_and_03";
	rename -uid "50CF9FDB-0342-6120-59D8-B5A7C3060400";
	setAttr "._cnd" 3;
createNode distanceBetween -n "distanceBetween3";
	rename -uid "6BA1A843-CE4C-102C-9CB6-2387E61677A3";
createNode distanceBetween -n "distanceBetween4";
	rename -uid "56D812CE-5549-E9CA-20BA-81BC446169EE";
createNode floatMath -n "Multiply_End_02";
	rename -uid "8F012CC6-4D4E-6670-21FC-58B5FF120F20";
	setAttr "._cnd" 2;
createNode floatConstant -n "Tangent_Scale_02_and_03";
	rename -uid "79F4A7DE-9547-378B-C3CF-33A5A1885CB3";
createNode multiplyPointByMatrix -n "Handle_In_Start_03";
	rename -uid "9A1249AB-7E4A-4B1B-46C6-6090967560E9";
createNode floatMath -n "Multiply_Start_03";
	rename -uid "2FB87439-9542-A022-2F22-47BE062484F4";
	setAttr "._fb" -1;
	setAttr "._cnd" 2;
createNode multiplyPointByMatrix -n "Handle_In_Mid_03";
	rename -uid "429FC5FD-7C49-A6FC-1B72-EE9CC347DE0F";
createNode floatMath -n "Tangent_Size_Multiplier_01_and_02";
	rename -uid "06C4176A-454C-EDA2-A5B5-3787BDE8EA69";
	setAttr "._fb" 0.5;
	setAttr "._cnd" 2;
createNode floatMath -n "Tangent_Size_Multiplier_02_and_03";
	rename -uid "E7BA3F7F-2645-A286-3B65-C497C5765084";
	setAttr "._fb" 0.5;
	setAttr "._cnd" 2;
createNode clampRange -n "Clamp_Tangent_02_and_03";
	rename -uid "61A1B45A-C642-4E54-178B-C885F45CB823";
createNode clampRange -n "Clamp_Tangent_01_and_02";
	rename -uid "460DCA7A-3C49-7BC9-D333-8E85CDABC95F";
createNode floatComposite -n "AutoScale_Influence_01_and_02";
	rename -uid "30D57C8D-D14A-3FCB-CD81-B292A3A2BBE8";
	setAttr "._fa" 0.5;
	setAttr "._op" 2;
	setAttr "._fx" 0;
createNode floatComposite -n "AutoScale_Influence_01_and_03";
	rename -uid "9298E7B9-B348-AE2B-BDD2-CE945852899F";
	setAttr "._fa" 0.5;
	setAttr "._op" 2;
	setAttr "._fx" 0;
createNode multiplyPointByMatrix -n "Handle_Out_End_01";
	rename -uid "90CD6B7B-6A45-6692-0866-10A3AA7F5F70";
createNode multiplyPointByMatrix -n "Handle_Out_End_02";
	rename -uid "9EC3BF98-CB4E-5082-C00D-BEB5E92A0D15";
createNode multiplyPointByMatrix -n "Handle_Out_Mid_01";
	rename -uid "A002696F-CF4D-CD40-5246-56B221EEDA16";
createNode multiplyPointByMatrix -n "Handle_Out_Mid_02";
	rename -uid "31A31E6E-2342-0AA3-0469-46B7B438012E";
createNode multiplyPointByMatrix -n "Handle_Out_Mid_03";
	rename -uid "D4A8C14E-E341-3FB9-AF94-B8AB0AB372CA";
createNode multiplyPointByMatrix -n "Handle_Out_Start_02";
	rename -uid "FA89F06C-424F-4FCA-F273-F2A2A725186C";
createNode multiplyPointByMatrix -n "Handle_Out_Start_03";
	rename -uid "A933FB0F-1340-D47C-6073-EAB4B4A05222";
createNode holdMatrix -n "holdMatrix1";
	rename -uid "F09BC5B6-A445-247E-E11B-D7B0B66550B8";
	setAttr ".o" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2 0 0 1;
createNode holdMatrix -n "holdMatrix2";
	rename -uid "566C9538-CE46-89EE-6819-E1ACD5C6406A";
	setAttr ".o" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4 0 0 1;
createNode holdMatrix -n "holdMatrix3";
	rename -uid "2D8C00F0-8440-407E-75AB-13A0EF59F0A2";
createNode floatConstant -n "Offset_In";
	rename -uid "3A2345FA-9843-5CA8-ADDF-5D80C135D3D4";
	setAttr "._f" 0.10000000149011612;
createNode floatConstant -n "Offset_Out";
	rename -uid "398E0ACA-BD48-A193-58AB-658856ECD78B";
	setAttr "._f" -0.10000000149011612;
createNode loft -n "loft1";
	rename -uid "B57D7EA8-B246-66D1-E636-FEB0B75B63E8";
	setAttr -s 2 ".ic";
	setAttr ".u" yes;
	setAttr -s 2 ".r[0:1]" no no;
	setAttr ".rsn" yes;
createNode floatConstant -n "__9CC60B__FloatConstant_U_01";
	rename -uid "B4D67431-2047-4EA9-7005-17803BBC1C60";
createNode floatConstant -n "__9CC60B__FloatConstant_U_02";
	rename -uid "DBF2A21C-8243-CBD9-0852-488226006784";
createNode floatConstant -n "__9CC60B__FloatConstant_U_03";
	rename -uid "F10AE4A0-304F-D80E-FBA4-58AD05D1BCB9";
createNode floatConstant -n "__9CC60B__FloatConstant_U_04";
	rename -uid "67A1A91F-D048-CCA9-B669-4DB0FCF2E195";
createNode floatConstant -n "__9CC60B__FloatConstant_U_05";
	rename -uid "20195392-B042-2984-C7F3-D6BDC7D8725C";
createNode hyperLayout -n "hyperLayout1";
	rename -uid "CAC5264F-FA45-3367-4AFF-2C8E4F06A771";
	setAttr ".ihi" 0;
	setAttr -s 200 ".hyp";
createNode floatConstant -n "__9CC60B__FloatConstant_U_06";
	rename -uid "6203A62A-8C49-AAD9-7ACD-6D8364F5D234";
createNode floatConstant -n "__9CC60B__FloatConstant_U_07";
	rename -uid "B1F303E1-4246-A15D-48D1-C681DA045E54";
createNode floatConstant -n "__9CC60B__FloatConstant_U_08";
	rename -uid "5306CBC2-3C4E-AC88-DD2A-7AB6C4EE6761";
createNode floatConstant -n "__9CC60B__FloatConstant_U_09";
	rename -uid "9FCB844F-B743-128E-AD2F-59A9EA78BF9F";
createNode floatConstant -n "__9CC60B__FloatConstant_U_10";
	rename -uid "CE33DEF2-194A-4386-6207-CA832AEFC3DE";
createNode floatConstant -n "__9CC60B__FloatConstant_U_11";
	rename -uid "BDA44050-514C-6CA4-16B3-AF9157F0471F";
createNode floatConstant -n "__9CC60B__FloatConstant_U_12";
	rename -uid "22EB96FA-6646-6BE5-67D5-348D28005A37";
createNode floatConstant -n "__9CC60B__FloatConstant_U_13";
	rename -uid "E668F98B-3942-54DD-3CA2-EA88062E33CD";
createNode floatConstant -n "__9CC60B__FloatConstant_U_14";
	rename -uid "F66FADD8-0549-0EA1-26B5-50AC8F06C30B";
createNode floatConstant -n "__9CC60B__FloatConstant_U_15";
	rename -uid "1639FF95-0046-1958-A96C-5984BD96476E";
createNode floatConstant -n "__9CC60B__FloatConstant_U_16";
	rename -uid "CF494749-844D-98E2-9856-5095613132D5";
createNode floatConstant -n "__9CC60B__FloatConstant_U_17";
	rename -uid "2946C4FB-634F-4DA6-EFF2-0C80A40A08F8";
createNode floatConstant -n "__9CC60B__FloatConstant_U_18";
	rename -uid "26F0CEA9-304A-BA75-5AC0-6CB4148CB8DE";
createNode floatConstant -n "__9CC60B__FloatConstant_U_19";
	rename -uid "EE89AD56-4F4D-E3FE-E278-CAA84E82972C";
createNode floatConstant -n "__9CC60B__FloatConstant_U_20";
	rename -uid "1759D521-7542-F45F-C95E-AB8BE9908F05";
createNode floatConstant -n "__9CC60B__FloatConstant_U_21";
	rename -uid "E28FBAAB-114C-9D5C-889B-CB91BDAC70F2";
createNode floatConstant -n "__9CC60B__FloatConstant_U_22";
	rename -uid "3EE5C161-8B4A-CEEB-9D95-EEB2B855A0A7";
createNode floatConstant -n "__9CC60B__FloatConstant_U_23";
	rename -uid "2E9FB689-4C46-0ABB-44AD-E1AE965631DC";
createNode floatConstant -n "__9CC60B__FloatConstant_U_24";
	rename -uid "25069706-334B-10F2-80D1-0ABB3FBF3868";
createNode floatConstant -n "__9CC60B__FloatConstant_U_25";
	rename -uid "55AB6242-D94B-8A4F-FABD-8BB0CC8AC6A7";
createNode floatConstant -n "__9CC60B__FloatConstant_U_26";
	rename -uid "C7CCD3D6-9A43-52B3-15E2-4B95B4230A3B";
createNode floatConstant -n "__9CC60B__FloatConstant_U_27";
	rename -uid "3EB63DA9-AF41-B6B2-5E3A-BEBD9709D9A7";
createNode floatConstant -n "__9CC60B__FloatConstant_U_28";
	rename -uid "ED165AD5-5D45-12DC-670F-A1A80DC16C22";
createNode floatConstant -n "__9CC60B__FloatConstant_U_29";
	rename -uid "EC6D9F4D-DC48-39CD-D424-1DA77CDB4E19";
createNode floatConstant -n "__9CC60B__FloatConstant_U_30";
	rename -uid "95A314C4-F44C-BEEF-8DA5-6A86623C0669";
createNode floatConstant -n "__9CC60B__FloatConstant_U_31";
	rename -uid "0C7172C7-F744-A0E4-8A84-4E92DE9B7D61";
createNode floatConstant -n "__9CC60B__FloatConstant_U_32";
	rename -uid "79036CA2-E844-5ED0-D136-9DBE380366D9";
createNode floatMath -n "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count";
	rename -uid "2C145D22-7D43-03AF-4FDC-62A10EEDA08B";
	setAttr "._cnd" 3;
createNode floatMath -n "floatMath2";
	rename -uid "424DEE16-1646-C06D-F577-B2850E70E118";
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_01";
	rename -uid "6560A4E2-E148-1ECF-75D5-CDBB0949C8FC";
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_02";
	rename -uid "DA4035D9-D341-A4C3-0134-3D85DD76ADEC";
	setAttr "._fb" 2;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_03";
	rename -uid "5B14D1DF-9B46-5FCB-CE5B-268019D626A7";
	setAttr "._fb" 3;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_04";
	rename -uid "69E4A8E2-5242-C465-45A1-0CBBCE0A6A76";
	setAttr "._fb" 4;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_05";
	rename -uid "2E508F3D-3D40-B928-2004-26956B2CDCAC";
	setAttr "._fb" 5;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_06";
	rename -uid "430671D1-5C49-94F0-55B1-51AB7C702387";
	setAttr "._fb" 6;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_07";
	rename -uid "EC26670F-1147-6D8D-4C22-53AF70609CA1";
	setAttr "._fb" 7;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_08";
	rename -uid "41107403-6340-33B1-1196-15A0874E7DD6";
	setAttr "._fb" 8;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_09";
	rename -uid "8E388EDD-1944-2C49-DD36-F9990FAFC517";
	setAttr "._fb" 9;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_10";
	rename -uid "E0F6FAD1-E14C-0CBD-79F4-3DBE6BA8CEEB";
	setAttr "._fb" 10;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_11";
	rename -uid "4845122A-4B4C-4133-4820-5DB430A7085E";
	setAttr "._fb" 11;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_12";
	rename -uid "F660A016-E64E-B566-CC54-2494C322211C";
	setAttr "._fb" 12;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_13";
	rename -uid "02504945-6244-1B23-4B33-5FA0CB67090E";
	setAttr "._fb" 13;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_14";
	rename -uid "A04E9FA5-5047-9FDD-AB5E-D8B84650BE9C";
	setAttr "._fb" 14;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_15";
	rename -uid "BC75FCE3-D348-3F4D-8D85-2FA999007D98";
	setAttr "._fb" 15;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_16";
	rename -uid "F309B426-DC45-4040-BA81-FFB31E08655C";
	setAttr "._fb" 16;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_17";
	rename -uid "63E23F7A-4344-80D2-C4FB-88B5B976F41D";
	setAttr "._fb" 17;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_18";
	rename -uid "827CF3EA-DB46-C1ED-DA9B-D7BA0BFD7C4F";
	setAttr "._fb" 18;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_19";
	rename -uid "C4DB2E0C-0C46-548E-E9AB-5D8525E2BC7B";
	setAttr "._fb" 19;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_20";
	rename -uid "4A677011-6C40-4862-3DC1-DBBF573422C0";
	setAttr "._fb" 20;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_21";
	rename -uid "6129341E-324E-7299-9E9F-D4B09249490D";
	setAttr "._fb" 21;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_22";
	rename -uid "69F71718-A740-0FE2-99FC-298EE292BFD7";
	setAttr "._fb" 22;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_23";
	rename -uid "AD99B96A-6349-F822-BFEB-6B8FAB286870";
	setAttr "._fb" 23;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_24";
	rename -uid "F70A9CF9-7542-F532-272C-74948268BC11";
	setAttr "._fb" 24;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_25";
	rename -uid "4499F551-7744-6015-29AA-B98E8A545D5A";
	setAttr "._fb" 25;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_26";
	rename -uid "5B616DAA-554E-38AB-4043-F3B16F9CB1A4";
	setAttr "._fb" 26;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_27";
	rename -uid "28698DD7-0C41-CC82-39C7-CA9E0A105890";
	setAttr "._fb" 27;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_28";
	rename -uid "40F95343-E94A-F555-217D-CB871E009864";
	setAttr "._fb" 28;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_29";
	rename -uid "D945FCFC-E541-D812-9BBD-E58C332080F2";
	setAttr "._fb" 29;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_30";
	rename -uid "C9195B07-804A-5EBA-1BDB-3C8D45A40C6B";
	setAttr "._fb" 30;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_31";
	rename -uid "E3784DD2-1D4A-0ADB-9E71-5F9639C96CC2";
	setAttr "._fb" 31;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Multiply_Position_32";
	rename -uid "2776A7DB-AB43-F7FB-A1BF-C594B6079CA5";
	setAttr "._fb" 32;
	setAttr "._cnd" 2;
createNode uvPin -n "__9CC60B__UVpin";
	rename -uid "9E88ABE7-4248-58AE-0D9F-149497A74267";
	setAttr -s 32 ".coord";
	setAttr -s 32 ".coord";
	setAttr ".nrm" 1;
	setAttr ".tng" 0;
	setAttr -s 32 ".omat";
createNode colorConstant -n "__9CC60B__Shape_Axis_Start";
	rename -uid "AD1AA0E8-5249-A13B-B24C-518C11EE0559";
	setAttr "._c" -type "float3" 0 0 0 ;
createNode colorConstant -n "__9CC60B__Shape_Axis_End";
	rename -uid "305DF7B2-2843-DCA6-4097-65BA14541CC3";
	setAttr "._c" -type "float3" 0.25 0 0 ;
createNode floatConstant -n "__9CC60B__FloatConstant_V";
	rename -uid "988E2C8B-F44D-2E47-9835-35BD7A030881";
	setAttr "._f" 0.5;
createNode floatLogic -n "__9CC60B__View_Overlay_01";
	rename -uid "35AE83A4-3A4F-164F-874F-4496C6048E37";
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_02";
	rename -uid "4FEC3901-8740-E24C-4B2B-0FA4C141D04A";
	setAttr "._ab" 2;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_03";
	rename -uid "6D542C9B-134A-7685-0335-C88DCD20F266";
	setAttr "._ab" 3;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_04";
	rename -uid "A1BA87B9-9449-4018-A634-67AF3C39789A";
	setAttr "._ab" 4;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_05";
	rename -uid "DD3824C7-3B45-2159-B2CB-4AACC2B6AA2A";
	setAttr "._ab" 5;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_06";
	rename -uid "80456CDC-D04E-296A-57F4-4C80873A2A5B";
	setAttr "._ab" 6;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_07";
	rename -uid "1442D15B-2B43-C619-7D2F-83A8255DAC5C";
	setAttr "._ab" 7;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_08";
	rename -uid "F35DD1E6-D94B-9AC8-3B98-90B5F44083B1";
	setAttr "._ab" 8;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_09";
	rename -uid "B6D1B768-004D-BA5A-7D93-80BCCD5EC016";
	setAttr "._ab" 9;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_10";
	rename -uid "6FA4DE5D-2842-A53E-DDD0-CBA8566B15FD";
	setAttr "._ab" 10;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_11";
	rename -uid "80CF226B-0145-5C27-EFFE-BCA36411BAC0";
	setAttr "._ab" 11;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_12";
	rename -uid "B1C1AC43-5D4E-8CB4-2CF2-2F89FE3B7B6C";
	setAttr "._ab" 12;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_13";
	rename -uid "B998E13C-3E4C-CD47-DACD-96BAA690EF67";
	setAttr "._ab" 13;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_14";
	rename -uid "FF1AA498-3D43-29A4-8849-78B43496266A";
	setAttr "._ab" 14;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_15";
	rename -uid "43F0ACDB-8248-54DD-1F72-548E6B4F3F8F";
	setAttr "._ab" 15;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_16";
	rename -uid "6861ACE0-8644-9917-90F2-7B9DD57F2BAD";
	setAttr "._ab" 16;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_17";
	rename -uid "F1AB8D57-F443-2970-1DAB-31A49D5DC0D8";
	setAttr "._ab" 17;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_18";
	rename -uid "E13DED2A-DF49-E5AD-D31A-F5979B5FFD3C";
	setAttr "._ab" 18;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_19";
	rename -uid "5979447E-C64F-49F1-18E2-FC90E87178AB";
	setAttr "._ab" 19;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_20";
	rename -uid "2BDF46D6-3A43-D27D-FFCB-5A9757486E5B";
	setAttr "._ab" 20;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_21";
	rename -uid "AF02A647-4042-11EE-FFBA-E39848CDD50F";
	setAttr "._ab" 21;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_22";
	rename -uid "FAFFF385-DB47-739D-4733-B69C3A2A6E43";
	setAttr "._ab" 22;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_23";
	rename -uid "2A8CC511-044B-7349-37B5-2DB1F0934F55";
	setAttr "._ab" 23;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_24";
	rename -uid "F5E3C682-A042-F758-4452-E587420C97C0";
	setAttr "._ab" 24;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_25";
	rename -uid "784E6126-724A-2383-1A68-0D82CB760139";
	setAttr "._ab" 25;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_26";
	rename -uid "64E0F1E5-FC44-304A-4577-AEB286EB21B6";
	setAttr "._ab" 26;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_27";
	rename -uid "8532C5A2-A641-BCC5-FE1B-E7952428BB2E";
	setAttr "._ab" 27;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_28";
	rename -uid "127B2801-2A46-924E-69FF-8BA0CDE94B48";
	setAttr "._ab" 28;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_29";
	rename -uid "7AD61F5C-644C-499E-61A4-D8B0EF8AF58D";
	setAttr "._ab" 29;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_30";
	rename -uid "9C61AAF8-904A-4D06-AE90-198F92177DDB";
	setAttr "._ab" 30;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_31";
	rename -uid "AC70D5AF-4040-6468-561D-64933A8A7F82";
	setAttr "._ab" 31;
	setAttr "._op" 5;
createNode floatLogic -n "__9CC60B__View_Overlay_32";
	rename -uid "B49A4BA7-9D46-21E8-4274-558A02E48F0C";
	setAttr "._ab" 32;
	setAttr "._op" 5;
createNode floatConstant -n "__9CC60B__Float_Reroute_Multiply";
	rename -uid "88AC30D9-9A42-3C80-6FC7-E091F30C85E1";
createNode floatMath -n "__9CC60B__FloatMath_Offset_Index";
	rename -uid "6B2795B0-1747-ABD4-AE3C-0FB7DB7D4C9A";
	setAttr "._fb" -1;
createNode choice -n "__9CC60B__Chose_Single_Index_Offset";
	rename -uid "ED59A658-4842-7CD6-947C-3BB2171C104E";
	setAttr -s 3 ".i";
createNode floatMath -n "__9CC60B__FloatMath_Center_Single_Index";
	rename -uid "F303C62A-A242-CD76-CB34-D2B9898DC25C";
	setAttr "._fb" -0.5;
createNode clamp -n "__9CC60B__Clamp_Chooser_Selector";
	rename -uid "8117C6CE-3B4D-0B33-02EB-B5BF3E1357D9";
	setAttr ".mx" -type "float3" 2 0 0 ;
createNode clamp -n "__9CC60B__Clamp_Result";
	rename -uid "4D8C9270-2F47-EA40-9874-A6944D9F8BC9";
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode floatMath -n "__9CC60B__Offset_Float_01";
	rename -uid "6BB60137-524E-AB6D-51B3-84976C59AB2F";
createNode floatMath -n "__9CC60B__Offset_Float_02";
	rename -uid "7D009236-8840-5299-8791-59B36F9F3180";
createNode floatMath -n "__9CC60B__Offset_Float_03";
	rename -uid "025A2326-1044-728D-A0B3-BE99C0BB3808";
createNode floatMath -n "__9CC60B__Offset_Float_04";
	rename -uid "5381E0EF-6940-8121-467C-CB996647DE47";
createNode floatMath -n "__9CC60B__Offset_Float_05";
	rename -uid "6CDF1DDD-C049-8CF1-A9AB-3BAA6A6C0A67";
createNode floatMath -n "__9CC60B__Offset_Float_06";
	rename -uid "C8D5BF48-FA42-0BFA-8A65-65BCD2098933";
createNode floatMath -n "__9CC60B__Offset_Float_07";
	rename -uid "43DAADA6-FF47-FF11-8F48-61B46E70BD57";
createNode floatMath -n "__9CC60B__Offset_Float_08";
	rename -uid "EDC9DB1B-4445-8E08-1E7D-44A94BB086EA";
createNode floatMath -n "__9CC60B__Offset_Float_09";
	rename -uid "41F5C4F5-1447-1B6D-E32F-56A0118934C8";
createNode floatMath -n "__9CC60B__Offset_Float_10";
	rename -uid "3B23CB91-8541-D69B-2C3C-5B8CECF3C439";
createNode floatMath -n "__9CC60B__Offset_Float_11";
	rename -uid "7A6DFB00-6642-1997-D57B-CB9CEAA952BB";
createNode floatMath -n "__9CC60B__Offset_Float_12";
	rename -uid "9B925FB8-C344-64E4-C1A4-0DA371EF679E";
createNode floatMath -n "__9CC60B__Offset_Float_13";
	rename -uid "7AE8667A-D14D-8FDD-14B4-E3BA44B065A8";
createNode floatMath -n "__9CC60B__Offset_Float_14";
	rename -uid "B0FB5E59-AF48-5D7B-6B8C-71A80E2A8256";
createNode floatMath -n "__9CC60B__Offset_Float_15";
	rename -uid "9DB7D937-9E42-8598-1058-64ACDB9FAC1F";
createNode floatMath -n "__9CC60B__Offset_Float_16";
	rename -uid "627CE374-FA4F-5AA3-722C-358C72ECB1D1";
createNode floatMath -n "__9CC60B__Offset_Float_17";
	rename -uid "C74115C0-2949-F8D2-E728-F4A4402F834A";
createNode floatMath -n "__9CC60B__Offset_Float_18";
	rename -uid "E9D11D65-394D-5B5B-BFA1-0BA89EBC4F92";
createNode floatMath -n "__9CC60B__Offset_Float_19";
	rename -uid "2CB82868-E646-02B0-BD7F-95AFC754C124";
createNode floatMath -n "__9CC60B__Offset_Float_20";
	rename -uid "4E642ECA-264C-B0EC-1541-7E8E9A893CD3";
createNode floatMath -n "__9CC60B__Offset_Float_21";
	rename -uid "9CF1F765-864A-B2F8-BAC2-2A8883A64001";
createNode floatMath -n "__9CC60B__Offset_Float_22";
	rename -uid "E205B045-4C41-67F3-DF66-E9A2309EBFC0";
createNode floatMath -n "__9CC60B__Offset_Float_23";
	rename -uid "F925D851-8944-139E-5112-52ACD0E75108";
createNode floatMath -n "__9CC60B__Offset_Float_24";
	rename -uid "14C4203E-8049-9AA7-16F6-09BF0AA5E7EB";
createNode floatMath -n "__9CC60B__Offset_Float_25";
	rename -uid "AF9DFF92-6E44-6E21-5D8A-17AFE249B1FA";
createNode floatMath -n "__9CC60B__Offset_Float_26";
	rename -uid "100C9BDB-084E-3B36-7841-85BE014E8988";
createNode floatMath -n "__9CC60B__Offset_Float_27";
	rename -uid "63431A39-E944-6D3B-2910-ABAC6C897A69";
createNode floatMath -n "__9CC60B__Offset_Float_28";
	rename -uid "31B10049-964B-A1D3-8321-DFAA98FF62DB";
createNode floatMath -n "__9CC60B__Offset_Float_29";
	rename -uid "AEE2A624-7E4F-B614-62FC-B98ABE0CA4F0";
createNode floatMath -n "__9CC60B__Offset_Float_30";
	rename -uid "B24C7AB4-5341-0A89-8AE7-A99831777610";
createNode floatMath -n "__9CC60B__Offset_Float_31";
	rename -uid "D6015A1C-6B47-5BCC-2095-3A8B15FEE18F";
createNode floatMath -n "__9CC60B__Offset_Float_32";
	rename -uid "7B546E0B-8342-A901-E5F4-1EB5F5F5E5D0";
createNode floatConstant -n "__9CC60B__Float_Reroute_Offset";
	rename -uid "61E2BE44-E34F-7B4D-E200-E6A218777D97";
createNode floatMath -n "__9CC60B__Multiply_Result_Zero";
	rename -uid "840ECE07-4D42-3689-3FB5-C8B8B47FF248";
	setAttr "._fb" 0;
	setAttr "._cnd" 2;
createNode choice -n "__9CC60B__Chose_Substract_or_Disable";
	rename -uid "19AF25B8-8148-54B2-A2A2-5B87C57F37C4";
	setAttr -s 3 ".i";
createNode floatMath -n "__9CC60B__Multiply_Result_Negative";
	rename -uid "14EF0057-0B48-3855-62B1-19BD64C705BB";
	setAttr "._fb" -1;
	setAttr "._cnd" 2;
createNode floatMath -n "__9CC60B__Fix_U_Position_Overflow";
	rename -uid "3C3E017D-FF41-6E58-A486-FF97D24F9B42";
	setAttr "._fb" -0.0010000000474974513;
createNode standardSurface -n "standardSurface2";
	rename -uid "FE4E2F37-EC46-08B0-5DF5-638024DC3E06";
	setAttr ".bc" -type "float3" 0 0 0 ;
	setAttr ".sr" 1;
	setAttr ".t" 1;
	setAttr ".e" 0.33300000429153442;
	setAttr ".ec" -type "float3" 1 0.50999999 0.6947 ;
createNode shadingEngine -n "standardSurface2SG";
	rename -uid "3333E19A-0747-66A2-A151-5C98C611E17E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "05FBBE33-824E-47D5-3A4D-198323FC2196";
createNode nodeGraphEditorBookmarks -n "MayaNodeEditorBookmarks";
	rename -uid "2D3126BC-ED44-286F-4583-D1926D312951";
	setAttr -s 2 ".b";
createNode nodeGraphEditorBookmarkInfo -n "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation";
	rename -uid "290E61A1-4F4E-DD3E-A404-56840D1B3FC4";
	setAttr ".nm" -type "string" "Bezier ControlPoint Matrix Deformation";
	setAttr ".vl" -type "double2" -1606.1688069504808 -2048.9446421343664 ;
	setAttr ".vh" -type "double2" 2609.8025751586706 150.36845728596907 ;
	setAttr -s 46 ".ni";
	setAttr ".ni[0].x" -427.875732421875;
	setAttr ".ni[0].y" -495.14923095703125;
	setAttr ".ni[0].nvs" 18314;
	setAttr ".ni[1].x" 1606.9730224609375;
	setAttr ".ni[1].y" -192.42060852050781;
	setAttr ".ni[1].nvs" 18314;
	setAttr ".ni[2].x" -425.30661010742188;
	setAttr ".ni[2].y" -291.91128540039062;
	setAttr ".ni[2].nvs" 18314;
	setAttr ".ni[3].x" -1409.2298583984375;
	setAttr ".ni[3].y" -1527.0313720703125;
	setAttr ".ni[3].nvs" 1931;
	setAttr ".ni[4].x" -79.179885864257812;
	setAttr ".ni[4].y" -105.00205230712891;
	setAttr ".ni[4].nvs" 18314;
	setAttr ".ni[5].x" -460.56338500976562;
	setAttr ".ni[5].y" -1618.6826171875;
	setAttr ".ni[5].nvs" 18314;
	setAttr ".ni[6].x" -1068.6549072265625;
	setAttr ".ni[6].y" -1818.486083984375;
	setAttr ".ni[6].nvs" 18313;
	setAttr ".ni[7].x" 1238.2119140625;
	setAttr ".ni[7].y" -1998.1392822265625;
	setAttr ".ni[7].nvs" 18314;
	setAttr ".ni[8].x" 656.1978759765625;
	setAttr ".ni[8].y" -339.781005859375;
	setAttr ".ni[8].nvs" 18314;
	setAttr ".ni[9].x" -480.73388671875;
	setAttr ".ni[9].y" -974.51519775390625;
	setAttr ".ni[9].nvs" 18314;
	setAttr ".ni[10].x" 2963.602783203125;
	setAttr ".ni[10].y" -145.99114990234375;
	setAttr ".ni[10].nvs" 18312;
	setAttr ".ni[11].x" -767.90325927734375;
	setAttr ".ni[11].y" -417.77291870117188;
	setAttr ".ni[11].nvs" 18314;
	setAttr ".ni[12].x" 1280.2403564453125;
	setAttr ".ni[12].y" -1001.420166015625;
	setAttr ".ni[12].nvs" 18314;
	setAttr ".ni[13].x" -773.76483154296875;
	setAttr ".ni[13].y" -93.206314086914062;
	setAttr ".ni[13].nvs" 18314;
	setAttr ".ni[14].x" -100.05358123779297;
	setAttr ".ni[14].y" -2090.331787109375;
	setAttr ".ni[14].nvs" 18314;
	setAttr ".ni[15].x" -113.71436309814453;
	setAttr ".ni[15].y" -1849.9580078125;
	setAttr ".ni[15].nvs" 18314;
	setAttr ".ni[16].x" 1185.6590576171875;
	setAttr ".ni[16].y" 157.98196411132812;
	setAttr ".ni[16].nvs" 18314;
	setAttr ".ni[17].x" -1138.1751708984375;
	setAttr ".ni[17].y" -425.95941162109375;
	setAttr ".ni[17].nvs" 18313;
	setAttr ".ni[18].x" 663.057861328125;
	setAttr ".ni[18].y" -1037.3077392578125;
	setAttr ".ni[18].nvs" 18314;
	setAttr ".ni[19].x" -106.89454650878906;
	setAttr ".ni[19].y" -1653.9234619140625;
	setAttr ".ni[19].nvs" 18314;
	setAttr ".ni[20].x" -1405.78662109375;
	setAttr ".ni[20].y" -57.89447021484375;
	setAttr ".ni[20].nvs" 1931;
	setAttr ".ni[21].x" -302.64727783203125;
	setAttr ".ni[21].y" -807.908935546875;
	setAttr ".ni[21].nvs" 18314;
	setAttr ".ni[22].x" 220.490966796875;
	setAttr ".ni[22].y" -1797.0706787109375;
	setAttr ".ni[22].nvs" 18314;
	setAttr ".ni[23].x" -468.597900390625;
	setAttr ".ni[23].y" -1426.830322265625;
	setAttr ".ni[23].nvs" 18314;
	setAttr ".ni[24].x" 221.95570373535156;
	setAttr ".ni[24].y" -920.2808837890625;
	setAttr ".ni[24].nvs" 18314;
	setAttr ".ni[25].x" -86.413955688476562;
	setAttr ".ni[25].y" -505.26953125;
	setAttr ".ni[25].nvs" 18330;
	setAttr ".ni[26].x" -1442.813232421875;
	setAttr ".ni[26].y" -724.6490478515625;
	setAttr ".ni[26].nvs" 1931;
	setAttr ".ni[27].x" 1278.722412109375;
	setAttr ".ni[27].y" -733.89996337890625;
	setAttr ".ni[27].nvs" 18410;
	setAttr ".ni[28].x" 2662.40185546875;
	setAttr ".ni[28].y" -80.836456298828125;
	setAttr ".ni[28].nvs" 18312;
	setAttr ".ni[29].x" -97.122077941894531;
	setAttr ".ni[29].y" -1228.03369140625;
	setAttr ".ni[29].nvs" 18314;
	setAttr ".ni[30].x" 254.29437255859375;
	setAttr ".ni[30].y" -1264.0621337890625;
	setAttr ".ni[30].nvs" 18314;
	setAttr ".ni[31].x" 1236.0208740234375;
	setAttr ".ni[31].y" -1732.8763427734375;
	setAttr ".ni[31].nvs" 18314;
	setAttr ".ni[32].x" 250.69923400878906;
	setAttr ".ni[32].y" -610.74603271484375;
	setAttr ".ni[32].nvs" 18314;
	setAttr ".ni[33].x" 264.29779052734375;
	setAttr ".ni[33].y" 123.0079345703125;
	setAttr ".ni[33].nvs" 18314;
	setAttr ".ni[34].x" -1125.8914794921875;
	setAttr ".ni[34].y" -1039.933837890625;
	setAttr ".ni[34].nvs" 18313;
	setAttr ".ni[35].x" 258.71185302734375;
	setAttr ".ni[35].y" -157.37594604492188;
	setAttr ".ni[35].nvs" 18314;
	setAttr ".ni[36].x" -456.50253295898438;
	setAttr ".ni[36].y" -1224.6356201171875;
	setAttr ".ni[36].nvs" 18314;
	setAttr ".ni[37].x" 249.79222106933594;
	setAttr ".ni[37].y" 298.6728515625;
	setAttr ".ni[37].nvs" 18314;
	setAttr ".ni[38].x" -424.23257446289062;
	setAttr ".ni[38].y" -88.938163757324219;
	setAttr ".ni[38].nvs" 18314;
	setAttr ".ni[39].x" 234.78135681152344;
	setAttr ".ni[39].y" -2074.748779296875;
	setAttr ".ni[39].nvs" 18314;
	setAttr ".ni[40].x" -770.41326904296875;
	setAttr ".ni[40].y" -1510.746337890625;
	setAttr ".ni[40].nvs" 18314;
	setAttr ".ni[41].x" -754.09979248046875;
	setAttr ".ni[41].y" -1192.3392333984375;
	setAttr ".ni[41].nvs" 18314;
	setAttr ".ni[42].x" -81.929977416992188;
	setAttr ".ni[42].y" -314.57492065429688;
	setAttr ".ni[42].nvs" 18314;
	setAttr ".ni[43].x" 1271.21484375;
	setAttr ".ni[43].y" -1300.7578125;
	setAttr ".ni[43].nvs" 18314;
	setAttr ".ni[44].x" 1196.6318359375;
	setAttr ".ni[44].y" -109.17752075195312;
	setAttr ".ni[44].nvs" 18314;
	setAttr ".ni[45].x" -88.977333068847656;
	setAttr ".ni[45].y" -1479.059814453125;
	setAttr ".ni[45].nvs" 18314;
createNode nodeGraphEditorBookmarkInfo -n "NodeView__9CC60B__Ribbon_Instances_Positions";
	rename -uid "92BA9DD0-2143-9AF9-B0A7-41BB476B9A8C";
	setAttr ".nm" -type "string" "Ribbon Instances Positions";
	setAttr ".vl" -type "double2" 545.44333483474509 20709.22771044225 ;
	setAttr ".vh" -type "double2" 4061.6627230020954 22543.506613199752 ;
	setAttr -s 21 ".ni";
	setAttr ".ni[0].x" 2370;
	setAttr ".ni[0].y" 21510.19921875;
	setAttr ".ni[0].nvs" 18306;
	setAttr ".ni[1].x" 1403.61962890625;
	setAttr ".ni[1].y" 21833.65625;
	setAttr ".ni[1].nvs" 18306;
	setAttr ".ni[2].x" 2957.754638671875;
	setAttr ".ni[2].y" 21619.34375;
	setAttr ".ni[2].nvs" 18306;
	setAttr ".ni[3].x" 2370;
	setAttr ".ni[3].y" 21764.28515625;
	setAttr ".ni[3].nvs" 18306;
	setAttr ".ni[4].x" 1086.7652587890625;
	setAttr ".ni[4].y" 21834.142578125;
	setAttr ".ni[4].nvs" 18306;
	setAttr ".ni[5].x" 1282.03955078125;
	setAttr ".ni[5].y" 22289.607421875;
	setAttr ".ni[5].nvs" 18306;
	setAttr ".ni[6].x" 2008.0341796875;
	setAttr ".ni[6].y" 22068.982421875;
	setAttr ".ni[6].nvs" 18306;
	setAttr ".ni[7].x" 1160.7408447265625;
	setAttr ".ni[7].y" 22820.044921875;
	setAttr ".ni[7].nvs" 18304;
	setAttr ".ni[8].x" 1496.455078125;
	setAttr ".ni[8].y" 22820.044921875;
	setAttr ".ni[8].nvs" 18304;
	setAttr ".ni[9].x" 2645.71435546875;
	setAttr ".ni[9].y" 22162.857421875;
	setAttr ".ni[9].nvs" 18304;
	setAttr ".ni[10].x" 728.08087158203125;
	setAttr ".ni[10].y" 22441.171875;
	setAttr ".ni[10].nvs" 18306;
	setAttr ".ni[11].x" 1496.455078125;
	setAttr ".ni[11].y" 22721.47265625;
	setAttr ".ni[11].nvs" 18304;
	setAttr ".ni[12].x" 1160.7408447265625;
	setAttr ".ni[12].y" 22721.47265625;
	setAttr ".ni[12].nvs" 18304;
	setAttr ".ni[13].x" 2979.89453125;
	setAttr ".ni[13].y" 22014.83984375;
	setAttr ".ni[13].nvs" 18306;
	setAttr ".ni[14].x" 1496.455078125;
	setAttr ".ni[14].y" 22622.90234375;
	setAttr ".ni[14].nvs" 18304;
	setAttr ".ni[15].x" 2315.71435546875;
	setAttr ".ni[15].y" 22290;
	setAttr ".ni[15].nvs" 18304;
	setAttr ".ni[16].x" 1125.73779296875;
	setAttr ".ni[16].y" 21565.09375;
	setAttr ".ni[16].nvs" 18306;
	setAttr ".ni[17].x" 1733.7772216796875;
	setAttr ".ni[17].y" 22110;
	setAttr ".ni[17].nvs" 18306;
	setAttr ".ni[18].x" 2645.71435546875;
	setAttr ".ni[18].y" 22290;
	setAttr ".ni[18].nvs" 18304;
	setAttr ".ni[19].x" 2679.0654296875;
	setAttr ".ni[19].y" 21671;
	setAttr ".ni[19].nvs" 18306;
	setAttr ".ni[20].x" 3249.8330078125;
	setAttr ".ni[20].y" 21658.478515625;
	setAttr ".ni[20].nvs" 18306;
createNode hyperLayout -n "hyperLayout2";
	rename -uid "C9142A97-114D-1FE8-878A-F7A4FE3EFC2C";
	setAttr ".ihi" 0;
	setAttr -s 32 ".hyp";
createNode hyperLayout -n "hyperLayout3";
	rename -uid "B507465A-2B4C-2275-95AD-1A9BDE816757";
	setAttr ".ihi" 0;
	setAttr -s 32 ".hyp";
createNode hyperLayout -n "hyperLayout4";
	rename -uid "CB75A10C-1A4F-0118-B195-DF86B125BCFF";
	setAttr ".ihi" 0;
	setAttr -s 67 ".hyp";
createNode hyperLayout -n "hyperLayout5";
	rename -uid "F6040142-674B-9979-9B18-3598828FA6B3";
	setAttr ".ihi" 0;
	setAttr -s 96 ".hyp";
createNode hyperLayout -n "hyperLayout6";
	rename -uid "3DA22827-C749-CAC4-DFD5-ECBDAE9BD428";
	setAttr ".ihi" 0;
	setAttr -s 32 ".hyp";
createNode hyperLayout -n "hyperLayout7";
	rename -uid "8E7A70A4-6D41-2105-B6A9-16929B357666";
	setAttr ".ihi" 0;
	setAttr -s 25 ".hyp";
createNode hyperLayout -n "hyperLayout8";
	rename -uid "6C5EFCE2-4C45-9ED3-0836-67B34D03A522";
	setAttr ".ihi" 0;
	setAttr -s 17 ".hyp";
createNode hyperLayout -n "hyperLayout9";
	rename -uid "CEB007DC-694E-6D0E-8D44-BFB60FF87924";
	setAttr ".ihi" 0;
	setAttr -s 52 ".hyp";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "62D5F398-B940-E4F9-EE6D-3CB00053BD20";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Bezier ControlPoint Matrix Deformation";
	setAttr ".tgi[0].vl" -type "double2" -1569.0474978699624 -2051.1282485508668 ;
	setAttr ".tgi[0].vh" -type "double2" 2646.9238842391887 148.18485086946811 ;
	setAttr -s 46 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -427.875732421875;
	setAttr ".tgi[0].ni[0].y" -495.14923095703125;
	setAttr ".tgi[0].ni[0].nvs" 18314;
	setAttr ".tgi[0].ni[1].x" 1606.9730224609375;
	setAttr ".tgi[0].ni[1].y" -192.42060852050781;
	setAttr ".tgi[0].ni[1].nvs" 18314;
	setAttr ".tgi[0].ni[2].x" -425.30661010742188;
	setAttr ".tgi[0].ni[2].y" -291.91128540039062;
	setAttr ".tgi[0].ni[2].nvs" 18314;
	setAttr ".tgi[0].ni[3].x" -1409.2298583984375;
	setAttr ".tgi[0].ni[3].y" -1527.0313720703125;
	setAttr ".tgi[0].ni[3].nvs" 1931;
	setAttr ".tgi[0].ni[4].x" -79.179885864257812;
	setAttr ".tgi[0].ni[4].y" -105.00205230712891;
	setAttr ".tgi[0].ni[4].nvs" 18314;
	setAttr ".tgi[0].ni[5].x" -460.56338500976562;
	setAttr ".tgi[0].ni[5].y" -1618.6826171875;
	setAttr ".tgi[0].ni[5].nvs" 18314;
	setAttr ".tgi[0].ni[6].x" -1068.6549072265625;
	setAttr ".tgi[0].ni[6].y" -1818.486083984375;
	setAttr ".tgi[0].ni[6].nvs" 18313;
	setAttr ".tgi[0].ni[7].x" 1238.2119140625;
	setAttr ".tgi[0].ni[7].y" -1998.1392822265625;
	setAttr ".tgi[0].ni[7].nvs" 18314;
	setAttr ".tgi[0].ni[8].x" 656.1978759765625;
	setAttr ".tgi[0].ni[8].y" -339.781005859375;
	setAttr ".tgi[0].ni[8].nvs" 18314;
	setAttr ".tgi[0].ni[9].x" -480.73388671875;
	setAttr ".tgi[0].ni[9].y" -974.51519775390625;
	setAttr ".tgi[0].ni[9].nvs" 18314;
	setAttr ".tgi[0].ni[10].x" 2963.602783203125;
	setAttr ".tgi[0].ni[10].y" -145.99114990234375;
	setAttr ".tgi[0].ni[10].nvs" 18312;
	setAttr ".tgi[0].ni[11].x" -767.90325927734375;
	setAttr ".tgi[0].ni[11].y" -417.77291870117188;
	setAttr ".tgi[0].ni[11].nvs" 18314;
	setAttr ".tgi[0].ni[12].x" 1280.2403564453125;
	setAttr ".tgi[0].ni[12].y" -1001.420166015625;
	setAttr ".tgi[0].ni[12].nvs" 18314;
	setAttr ".tgi[0].ni[13].x" -773.76483154296875;
	setAttr ".tgi[0].ni[13].y" -93.206314086914062;
	setAttr ".tgi[0].ni[13].nvs" 18314;
	setAttr ".tgi[0].ni[14].x" -100.05358123779297;
	setAttr ".tgi[0].ni[14].y" -2090.331787109375;
	setAttr ".tgi[0].ni[14].nvs" 18314;
	setAttr ".tgi[0].ni[15].x" -113.71436309814453;
	setAttr ".tgi[0].ni[15].y" -1849.9580078125;
	setAttr ".tgi[0].ni[15].nvs" 18314;
	setAttr ".tgi[0].ni[16].x" 1185.6590576171875;
	setAttr ".tgi[0].ni[16].y" 157.98196411132812;
	setAttr ".tgi[0].ni[16].nvs" 18314;
	setAttr ".tgi[0].ni[17].x" -1138.1751708984375;
	setAttr ".tgi[0].ni[17].y" -425.95941162109375;
	setAttr ".tgi[0].ni[17].nvs" 18313;
	setAttr ".tgi[0].ni[18].x" 663.057861328125;
	setAttr ".tgi[0].ni[18].y" -1037.3077392578125;
	setAttr ".tgi[0].ni[18].nvs" 18314;
	setAttr ".tgi[0].ni[19].x" -106.89454650878906;
	setAttr ".tgi[0].ni[19].y" -1653.9234619140625;
	setAttr ".tgi[0].ni[19].nvs" 18314;
	setAttr ".tgi[0].ni[20].x" -1405.78662109375;
	setAttr ".tgi[0].ni[20].y" -57.89447021484375;
	setAttr ".tgi[0].ni[20].nvs" 1931;
	setAttr ".tgi[0].ni[21].x" -302.64727783203125;
	setAttr ".tgi[0].ni[21].y" -807.908935546875;
	setAttr ".tgi[0].ni[21].nvs" 18314;
	setAttr ".tgi[0].ni[22].x" 220.490966796875;
	setAttr ".tgi[0].ni[22].y" -1797.0706787109375;
	setAttr ".tgi[0].ni[22].nvs" 18314;
	setAttr ".tgi[0].ni[23].x" -468.597900390625;
	setAttr ".tgi[0].ni[23].y" -1426.830322265625;
	setAttr ".tgi[0].ni[23].nvs" 18314;
	setAttr ".tgi[0].ni[24].x" 221.95570373535156;
	setAttr ".tgi[0].ni[24].y" -920.2808837890625;
	setAttr ".tgi[0].ni[24].nvs" 18314;
	setAttr ".tgi[0].ni[25].x" -86.413955688476562;
	setAttr ".tgi[0].ni[25].y" -505.26953125;
	setAttr ".tgi[0].ni[25].nvs" 18330;
	setAttr ".tgi[0].ni[26].x" -1442.813232421875;
	setAttr ".tgi[0].ni[26].y" -724.6490478515625;
	setAttr ".tgi[0].ni[26].nvs" 1931;
	setAttr ".tgi[0].ni[27].x" 1278.722412109375;
	setAttr ".tgi[0].ni[27].y" -733.89996337890625;
	setAttr ".tgi[0].ni[27].nvs" 18410;
	setAttr ".tgi[0].ni[28].x" 2662.40185546875;
	setAttr ".tgi[0].ni[28].y" -80.836456298828125;
	setAttr ".tgi[0].ni[28].nvs" 18312;
	setAttr ".tgi[0].ni[29].x" -97.122077941894531;
	setAttr ".tgi[0].ni[29].y" -1228.03369140625;
	setAttr ".tgi[0].ni[29].nvs" 18314;
	setAttr ".tgi[0].ni[30].x" 254.29437255859375;
	setAttr ".tgi[0].ni[30].y" -1264.0621337890625;
	setAttr ".tgi[0].ni[30].nvs" 18314;
	setAttr ".tgi[0].ni[31].x" 1236.0208740234375;
	setAttr ".tgi[0].ni[31].y" -1732.8763427734375;
	setAttr ".tgi[0].ni[31].nvs" 18314;
	setAttr ".tgi[0].ni[32].x" 250.69923400878906;
	setAttr ".tgi[0].ni[32].y" -610.74603271484375;
	setAttr ".tgi[0].ni[32].nvs" 18314;
	setAttr ".tgi[0].ni[33].x" 264.29779052734375;
	setAttr ".tgi[0].ni[33].y" 123.0079345703125;
	setAttr ".tgi[0].ni[33].nvs" 18314;
	setAttr ".tgi[0].ni[34].x" -1125.8914794921875;
	setAttr ".tgi[0].ni[34].y" -1039.933837890625;
	setAttr ".tgi[0].ni[34].nvs" 18313;
	setAttr ".tgi[0].ni[35].x" 258.71185302734375;
	setAttr ".tgi[0].ni[35].y" -157.37594604492188;
	setAttr ".tgi[0].ni[35].nvs" 18314;
	setAttr ".tgi[0].ni[36].x" -456.50253295898438;
	setAttr ".tgi[0].ni[36].y" -1224.6356201171875;
	setAttr ".tgi[0].ni[36].nvs" 18314;
	setAttr ".tgi[0].ni[37].x" 249.79222106933594;
	setAttr ".tgi[0].ni[37].y" 298.6728515625;
	setAttr ".tgi[0].ni[37].nvs" 18314;
	setAttr ".tgi[0].ni[38].x" -424.23257446289062;
	setAttr ".tgi[0].ni[38].y" -88.938163757324219;
	setAttr ".tgi[0].ni[38].nvs" 18314;
	setAttr ".tgi[0].ni[39].x" 234.78135681152344;
	setAttr ".tgi[0].ni[39].y" -2074.748779296875;
	setAttr ".tgi[0].ni[39].nvs" 18314;
	setAttr ".tgi[0].ni[40].x" -770.41326904296875;
	setAttr ".tgi[0].ni[40].y" -1510.746337890625;
	setAttr ".tgi[0].ni[40].nvs" 18314;
	setAttr ".tgi[0].ni[41].x" -754.09979248046875;
	setAttr ".tgi[0].ni[41].y" -1192.3392333984375;
	setAttr ".tgi[0].ni[41].nvs" 18314;
	setAttr ".tgi[0].ni[42].x" -81.929977416992188;
	setAttr ".tgi[0].ni[42].y" -314.57492065429688;
	setAttr ".tgi[0].ni[42].nvs" 18314;
	setAttr ".tgi[0].ni[43].x" 1271.21484375;
	setAttr ".tgi[0].ni[43].y" -1300.7578125;
	setAttr ".tgi[0].ni[43].nvs" 18314;
	setAttr ".tgi[0].ni[44].x" 1196.6318359375;
	setAttr ".tgi[0].ni[44].y" -109.17752075195312;
	setAttr ".tgi[0].ni[44].nvs" 18314;
	setAttr ".tgi[0].ni[45].x" -88.977333068847656;
	setAttr ".tgi[0].ni[45].y" -1479.059814453125;
	setAttr ".tgi[0].ni[45].nvs" 18314;
	setAttr ".tgi[1].tn" -type "string" "Ribbon Instances Positions";
	setAttr ".tgi[1].vl" -type "double2" 536.11649295631719 21041.885070772849 ;
	setAttr ".tgi[1].vh" -type "double2" 4052.3358811236681 22876.163973530351 ;
	setAttr -s 21 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 2370;
	setAttr ".tgi[1].ni[0].y" 21510.19921875;
	setAttr ".tgi[1].ni[0].nvs" 18314;
	setAttr ".tgi[1].ni[1].x" 1403.61962890625;
	setAttr ".tgi[1].ni[1].y" 21833.65625;
	setAttr ".tgi[1].ni[1].nvs" 18314;
	setAttr ".tgi[1].ni[2].x" 2957.754638671875;
	setAttr ".tgi[1].ni[2].y" 21619.34375;
	setAttr ".tgi[1].ni[2].nvs" 18314;
	setAttr ".tgi[1].ni[3].x" 2370;
	setAttr ".tgi[1].ni[3].y" 21764.28515625;
	setAttr ".tgi[1].ni[3].nvs" 18314;
	setAttr ".tgi[1].ni[4].x" 1086.7652587890625;
	setAttr ".tgi[1].ni[4].y" 21834.142578125;
	setAttr ".tgi[1].ni[4].nvs" 18314;
	setAttr ".tgi[1].ni[5].x" 1282.03955078125;
	setAttr ".tgi[1].ni[5].y" 22289.607421875;
	setAttr ".tgi[1].ni[5].nvs" 18314;
	setAttr ".tgi[1].ni[6].x" 2008.0341796875;
	setAttr ".tgi[1].ni[6].y" 22068.982421875;
	setAttr ".tgi[1].ni[6].nvs" 18314;
	setAttr ".tgi[1].ni[7].x" 1160.7408447265625;
	setAttr ".tgi[1].ni[7].y" 22820.044921875;
	setAttr ".tgi[1].ni[7].nvs" 18312;
	setAttr ".tgi[1].ni[8].x" 1496.455078125;
	setAttr ".tgi[1].ni[8].y" 22820.044921875;
	setAttr ".tgi[1].ni[8].nvs" 18312;
	setAttr ".tgi[1].ni[9].x" 2645.71435546875;
	setAttr ".tgi[1].ni[9].y" 22162.857421875;
	setAttr ".tgi[1].ni[9].nvs" 18312;
	setAttr ".tgi[1].ni[10].x" 728.08087158203125;
	setAttr ".tgi[1].ni[10].y" 22441.171875;
	setAttr ".tgi[1].ni[10].nvs" 18314;
	setAttr ".tgi[1].ni[11].x" 1496.455078125;
	setAttr ".tgi[1].ni[11].y" 22721.47265625;
	setAttr ".tgi[1].ni[11].nvs" 18312;
	setAttr ".tgi[1].ni[12].x" 1160.7408447265625;
	setAttr ".tgi[1].ni[12].y" 22721.47265625;
	setAttr ".tgi[1].ni[12].nvs" 18312;
	setAttr ".tgi[1].ni[13].x" 2979.89453125;
	setAttr ".tgi[1].ni[13].y" 22014.83984375;
	setAttr ".tgi[1].ni[13].nvs" 18314;
	setAttr ".tgi[1].ni[14].x" 1496.455078125;
	setAttr ".tgi[1].ni[14].y" 22622.90234375;
	setAttr ".tgi[1].ni[14].nvs" 18312;
	setAttr ".tgi[1].ni[15].x" 2315.71435546875;
	setAttr ".tgi[1].ni[15].y" 22290;
	setAttr ".tgi[1].ni[15].nvs" 18312;
	setAttr ".tgi[1].ni[16].x" 1125.73779296875;
	setAttr ".tgi[1].ni[16].y" 21565.09375;
	setAttr ".tgi[1].ni[16].nvs" 18314;
	setAttr ".tgi[1].ni[17].x" 1733.7772216796875;
	setAttr ".tgi[1].ni[17].y" 22110;
	setAttr ".tgi[1].ni[17].nvs" 18314;
	setAttr ".tgi[1].ni[18].x" 2645.71435546875;
	setAttr ".tgi[1].ni[18].y" 22290;
	setAttr ".tgi[1].ni[18].nvs" 18312;
	setAttr ".tgi[1].ni[19].x" 2679.0654296875;
	setAttr ".tgi[1].ni[19].y" 21671;
	setAttr ".tgi[1].ni[19].nvs" 18314;
	setAttr ".tgi[1].ni[20].x" 3249.8330078125;
	setAttr ".tgi[1].ni[20].y" 21658.478515625;
	setAttr ".tgi[1].ni[20].nvs" 18314;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -254.90360712853627 1890.9457628450139 ;
	setAttr ".tgi[2].vh" -type "double2" 2950.12156685845 3562.8863929531672 ;
	setAttr -s 13 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 831.4285888671875;
	setAttr ".tgi[2].ni[0].y" 2774.28564453125;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" 831.4285888671875;
	setAttr ".tgi[2].ni[1].y" 2675.71435546875;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 2385.71435546875;
	setAttr ".tgi[2].ni[2].y" 2770;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" 524.28570556640625;
	setAttr ".tgi[2].ni[3].y" 3250;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" -90;
	setAttr ".tgi[2].ni[4].y" 3152.857177734375;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" 1154.2857666015625;
	setAttr ".tgi[2].ni[5].y" 2790;
	setAttr ".tgi[2].ni[5].nvs" 18304;
	setAttr ".tgi[2].ni[6].x" 2078.571533203125;
	setAttr ".tgi[2].ni[6].y" 2770;
	setAttr ".tgi[2].ni[6].nvs" 18304;
	setAttr ".tgi[2].ni[7].x" 217.14285278320312;
	setAttr ".tgi[2].ni[7].y" 3651.428466796875;
	setAttr ".tgi[2].ni[7].nvs" 18306;
	setAttr ".tgi[2].ni[8].x" 1771.4285888671875;
	setAttr ".tgi[2].ni[8].y" 2700;
	setAttr ".tgi[2].ni[8].nvs" 18304;
	setAttr ".tgi[2].ni[9].x" 1771.4285888671875;
	setAttr ".tgi[2].ni[9].y" 2855.71435546875;
	setAttr ".tgi[2].ni[9].nvs" 18304;
	setAttr ".tgi[2].ni[10].x" 2692.857177734375;
	setAttr ".tgi[2].ni[10].y" 2771.428466796875;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" 831.4285888671875;
	setAttr ".tgi[2].ni[11].y" 3018.571533203125;
	setAttr ".tgi[2].ni[11].nvs" 18304;
	setAttr ".tgi[2].ni[12].x" 1461.4285888671875;
	setAttr ".tgi[2].ni[12].y" 2802.857177734375;
	setAttr ".tgi[2].ni[12].nvs" 18304;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "8ABCCE8A-614C-1445-94C4-6AA7D7951487";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -44.047617297323995 -339.2857008037119 ;
	setAttr ".tgi[0].vh" -type "double2" 251.19046620906389 44.047617297323995 ;
	setAttr -s 70 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -142.85714721679688;
	setAttr ".tgi[0].ni[0].y" 15.714285850524902;
	setAttr ".tgi[0].ni[0].nvs" 1922;
	setAttr ".tgi[0].ni[1].x" 171.42857360839844;
	setAttr ".tgi[0].ni[1].y" -324.28570556640625;
	setAttr ".tgi[0].ni[1].nvs" 1922;
	setAttr ".tgi[0].ni[2].x" 171.42857360839844;
	setAttr ".tgi[0].ni[2].y" -178.57142639160156;
	setAttr ".tgi[0].ni[2].nvs" 1922;
	setAttr ".tgi[0].ni[3].x" -150;
	setAttr ".tgi[0].ni[3].y" -267.14285278320312;
	setAttr ".tgi[0].ni[3].nvs" 1922;
	setAttr ".tgi[0].ni[4].x" -142.85714721679688;
	setAttr ".tgi[0].ni[4].y" -198.57142639160156;
	setAttr ".tgi[0].ni[4].nvs" 1922;
	setAttr ".tgi[0].ni[5].x" -150;
	setAttr ".tgi[0].ni[5].y" 114.28571319580078;
	setAttr ".tgi[0].ni[5].nvs" 1922;
	setAttr ".tgi[0].ni[6].x" 171.42857360839844;
	setAttr ".tgi[0].ni[6].y" 202.85714721679688;
	setAttr ".tgi[0].ni[6].nvs" 1922;
	setAttr ".tgi[0].ni[7].x" 171.42857360839844;
	setAttr ".tgi[0].ni[7].y" 57.142856597900391;
	setAttr ".tgi[0].ni[7].nvs" 1922;
	setAttr ".tgi[0].ni[8].x" 307.14285278320312;
	setAttr ".tgi[0].ni[8].y" -88.571426391601562;
	setAttr ".tgi[0].ni[8].nvs" 1922;
	setAttr ".tgi[0].ni[9].x" -507.14285278320312;
	setAttr ".tgi[0].ni[9].y" -101.42857360839844;
	setAttr ".tgi[0].ni[9].nvs" 1922;
	setAttr ".tgi[0].ni[10].x" 614.28570556640625;
	setAttr ".tgi[0].ni[10].y" -551.4285888671875;
	setAttr ".tgi[0].ni[10].nvs" 1922;
	setAttr ".tgi[0].ni[11].x" -777.14288330078125;
	setAttr ".tgi[0].ni[11].y" 747.14288330078125;
	setAttr ".tgi[0].ni[11].nvs" 1923;
	setAttr ".tgi[0].ni[12].x" -442.85714721679688;
	setAttr ".tgi[0].ni[12].y" -35.714286804199219;
	setAttr ".tgi[0].ni[12].nvs" 1922;
	setAttr ".tgi[0].ni[13].x" 414.28570556640625;
	setAttr ".tgi[0].ni[13].y" -107.14286041259766;
	setAttr ".tgi[0].ni[13].nvs" 1923;
	setAttr ".tgi[0].ni[14].x" -200;
	setAttr ".tgi[0].ni[14].y" -127.14286041259766;
	setAttr ".tgi[0].ni[14].nvs" 1923;
	setAttr ".tgi[0].ni[15].x" 614.28570556640625;
	setAttr ".tgi[0].ni[15].y" -260;
	setAttr ".tgi[0].ni[15].nvs" 1923;
	setAttr ".tgi[0].ni[16].x" -135.71427917480469;
	setAttr ".tgi[0].ni[16].y" -41.428569793701172;
	setAttr ".tgi[0].ni[16].nvs" 1923;
	setAttr ".tgi[0].ni[17].x" -777.14288330078125;
	setAttr ".tgi[0].ni[17].y" -910;
	setAttr ".tgi[0].ni[17].nvs" 1923;
	setAttr ".tgi[0].ni[18].x" 37.142856597900391;
	setAttr ".tgi[0].ni[18].y" -55.714286804199219;
	setAttr ".tgi[0].ni[18].nvs" 1922;
	setAttr ".tgi[0].ni[19].x" -442.85714721679688;
	setAttr ".tgi[0].ni[19].y" 110;
	setAttr ".tgi[0].ni[19].nvs" 1922;
	setAttr ".tgi[0].ni[20].x" -135.71427917480469;
	setAttr ".tgi[0].ni[20].y" 64.285713195800781;
	setAttr ".tgi[0].ni[20].nvs" 1923;
	setAttr ".tgi[0].ni[21].x" 10;
	setAttr ".tgi[0].ni[21].y" -178.57142639160156;
	setAttr ".tgi[0].ni[21].nvs" 1923;
	setAttr ".tgi[0].ni[22].x" -777.14288330078125;
	setAttr ".tgi[0].ni[22].y" -247.14285278320312;
	setAttr ".tgi[0].ni[22].nvs" 1923;
	setAttr ".tgi[0].ni[23].x" 614.28570556640625;
	setAttr ".tgi[0].ni[23].y" -114.28571319580078;
	setAttr ".tgi[0].ni[23].nvs" 1923;
	setAttr ".tgi[0].ni[24].x" 307.14285278320312;
	setAttr ".tgi[0].ni[24].y" -234.28572082519531;
	setAttr ".tgi[0].ni[24].nvs" 1922;
	setAttr ".tgi[0].ni[25].x" -777.14288330078125;
	setAttr ".tgi[0].ni[25].y" 1575.7142333984375;
	setAttr ".tgi[0].ni[25].nvs" 1923;
	setAttr ".tgi[0].ni[26].x" -135.71427917480469;
	setAttr ".tgi[0].ni[26].y" -624.28570556640625;
	setAttr ".tgi[0].ni[26].nvs" 1923;
	setAttr ".tgi[0].ni[27].x" -777.14288330078125;
	setAttr ".tgi[0].ni[27].y" -2070;
	setAttr ".tgi[0].ni[27].nvs" 1923;
	setAttr ".tgi[0].ni[28].x" -777.14288330078125;
	setAttr ".tgi[0].ni[28].y" -1738.5714111328125;
	setAttr ".tgi[0].ni[28].nvs" 1923;
	setAttr ".tgi[0].ni[29].x" -777.14288330078125;
	setAttr ".tgi[0].ni[29].y" -2401.428466796875;
	setAttr ".tgi[0].ni[29].nvs" 1923;
	setAttr ".tgi[0].ni[30].x" -321.42855834960938;
	setAttr ".tgi[0].ni[30].y" -38.571430206298828;
	setAttr ".tgi[0].ni[30].nvs" 1923;
	setAttr ".tgi[0].ni[31].x" -777.14288330078125;
	setAttr ".tgi[0].ni[31].y" 1244.2857666015625;
	setAttr ".tgi[0].ni[31].nvs" 1923;
	setAttr ".tgi[0].ni[32].x" -777.14288330078125;
	setAttr ".tgi[0].ni[32].y" -1407.142822265625;
	setAttr ".tgi[0].ni[32].nvs" 1923;
	setAttr ".tgi[0].ni[33].x" -777.14288330078125;
	setAttr ".tgi[0].ni[33].y" 1907.142822265625;
	setAttr ".tgi[0].ni[33].nvs" 1923;
	setAttr ".tgi[0].ni[34].x" 10;
	setAttr ".tgi[0].ni[34].y" 220;
	setAttr ".tgi[0].ni[34].nvs" 1922;
	setAttr ".tgi[0].ni[35].x" -777.14288330078125;
	setAttr ".tgi[0].ni[35].y" 2072.857177734375;
	setAttr ".tgi[0].ni[35].nvs" 1923;
	setAttr ".tgi[0].ni[36].x" -135.71427917480469;
	setAttr ".tgi[0].ni[36].y" -147.14285278320312;
	setAttr ".tgi[0].ni[36].nvs" 1923;
	setAttr ".tgi[0].ni[37].x" -777.14288330078125;
	setAttr ".tgi[0].ni[37].y" 912.85711669921875;
	setAttr ".tgi[0].ni[37].nvs" 1923;
	setAttr ".tgi[0].ni[38].x" 208.57142639160156;
	setAttr ".tgi[0].ni[38].y" -158.57142639160156;
	setAttr ".tgi[0].ni[38].nvs" 2066;
	setAttr ".tgi[0].ni[39].x" -135.71427917480469;
	setAttr ".tgi[0].ni[39].y" -478.57144165039062;
	setAttr ".tgi[0].ni[39].nvs" 1923;
	setAttr ".tgi[0].ni[40].x" -777.14288330078125;
	setAttr ".tgi[0].ni[40].y" 1410;
	setAttr ".tgi[0].ni[40].nvs" 1923;
	setAttr ".tgi[0].ni[41].x" -777.14288330078125;
	setAttr ".tgi[0].ni[41].y" 1741.4285888671875;
	setAttr ".tgi[0].ni[41].nvs" 1923;
	setAttr ".tgi[0].ni[42].x" -777.14288330078125;
	setAttr ".tgi[0].ni[42].y" 84.285713195800781;
	setAttr ".tgi[0].ni[42].nvs" 1923;
	setAttr ".tgi[0].ni[43].x" -777.14288330078125;
	setAttr ".tgi[0].ni[43].y" -1572.857177734375;
	setAttr ".tgi[0].ni[43].nvs" 1923;
	setAttr ".tgi[0].ni[44].x" -111.42857360839844;
	setAttr ".tgi[0].ni[44].y" 65.714286804199219;
	setAttr ".tgi[0].ni[44].nvs" 2066;
	setAttr ".tgi[0].ni[45].x" 528.5714111328125;
	setAttr ".tgi[0].ni[45].y" -391.42855834960938;
	setAttr ".tgi[0].ni[45].nvs" 2066;
	setAttr ".tgi[0].ni[46].x" -777.14288330078125;
	setAttr ".tgi[0].ni[46].y" 415.71429443359375;
	setAttr ".tgi[0].ni[46].nvs" 1923;
	setAttr ".tgi[0].ni[47].x" -777.14288330078125;
	setAttr ".tgi[0].ni[47].y" 2238.571533203125;
	setAttr ".tgi[0].ni[47].nvs" 1923;
	setAttr ".tgi[0].ni[48].x" -135.71427917480469;
	setAttr ".tgi[0].ni[48].y" -811.4285888671875;
	setAttr ".tgi[0].ni[48].nvs" 1923;
	setAttr ".tgi[0].ni[49].x" -111.42857360839844;
	setAttr ".tgi[0].ni[49].y" -100;
	setAttr ".tgi[0].ni[49].nvs" 2066;
	setAttr ".tgi[0].ni[50].x" -518.5714111328125;
	setAttr ".tgi[0].ni[50].y" 208.57142639160156;
	setAttr ".tgi[0].ni[50].nvs" 2066;
	setAttr ".tgi[0].ni[51].x" -777.14288330078125;
	setAttr ".tgi[0].ni[51].y" -412.85714721679688;
	setAttr ".tgi[0].ni[51].nvs" 1923;
	setAttr ".tgi[0].ni[52].x" -135.71427917480469;
	setAttr ".tgi[0].ni[52].y" -937.14288330078125;
	setAttr ".tgi[0].ni[52].nvs" 1923;
	setAttr ".tgi[0].ni[53].x" -777.14288330078125;
	setAttr ".tgi[0].ni[53].y" -81.428573608398438;
	setAttr ".tgi[0].ni[53].nvs" 1923;
	setAttr ".tgi[0].ni[54].x" -777.14288330078125;
	setAttr ".tgi[0].ni[54].y" -2235.71435546875;
	setAttr ".tgi[0].ni[54].nvs" 1923;
	setAttr ".tgi[0].ni[55].x" -777.14288330078125;
	setAttr ".tgi[0].ni[55].y" -1075.7142333984375;
	setAttr ".tgi[0].ni[55].nvs" 1923;
	setAttr ".tgi[0].ni[56].x" -777.14288330078125;
	setAttr ".tgi[0].ni[56].y" -1904.2857666015625;
	setAttr ".tgi[0].ni[56].nvs" 1923;
	setAttr ".tgi[0].ni[57].x" -777.14288330078125;
	setAttr ".tgi[0].ni[57].y" 250;
	setAttr ".tgi[0].ni[57].nvs" 1923;
	setAttr ".tgi[0].ni[58].x" -777.14288330078125;
	setAttr ".tgi[0].ni[58].y" -1241.4285888671875;
	setAttr ".tgi[0].ni[58].nvs" 1923;
	setAttr ".tgi[0].ni[59].x" -777.14288330078125;
	setAttr ".tgi[0].ni[59].y" 581.4285888671875;
	setAttr ".tgi[0].ni[59].nvs" 1923;
	setAttr ".tgi[0].ni[60].x" -777.14288330078125;
	setAttr ".tgi[0].ni[60].y" 1078.5714111328125;
	setAttr ".tgi[0].ni[60].nvs" 1923;
	setAttr ".tgi[0].ni[61].x" -135.71427917480469;
	setAttr ".tgi[0].ni[61].y" -1124.2857666015625;
	setAttr ".tgi[0].ni[61].nvs" 1923;
	setAttr ".tgi[0].ni[62].x" 164.28572082519531;
	setAttr ".tgi[0].ni[62].y" -117.14286041259766;
	setAttr ".tgi[0].ni[62].nvs" 1923;
	setAttr ".tgi[0].ni[63].x" -142.85714721679688;
	setAttr ".tgi[0].ni[63].y" -91.428573608398438;
	setAttr ".tgi[0].ni[63].nvs" 1922;
	setAttr ".tgi[0].ni[64].x" -777.14288330078125;
	setAttr ".tgi[0].ni[64].y" -578.5714111328125;
	setAttr ".tgi[0].ni[64].nvs" 1923;
	setAttr ".tgi[0].ni[65].x" -321.42855834960938;
	setAttr ".tgi[0].ni[65].y" -164.28572082519531;
	setAttr ".tgi[0].ni[65].nvs" 1923;
	setAttr ".tgi[0].ni[66].x" -777.14288330078125;
	setAttr ".tgi[0].ni[66].y" -744.28570556640625;
	setAttr ".tgi[0].ni[66].nvs" 1923;
	setAttr ".tgi[0].ni[67].x" -135.71427917480469;
	setAttr ".tgi[0].ni[67].y" -312.85714721679688;
	setAttr ".tgi[0].ni[67].nvs" 1923;
	setAttr ".tgi[0].ni[68].x" 344.28570556640625;
	setAttr ".tgi[0].ni[68].y" -81.428573608398438;
	setAttr ".tgi[0].ni[68].nvs" 1923;
	setAttr ".tgi[0].ni[69].x" 107.14286041259766;
	setAttr ".tgi[0].ni[69].y" -81.428573608398438;
	setAttr ".tgi[0].ni[69].nvs" 1922;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 250;
	setAttr -av ".unw" 250;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -k on ".lm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -k on ".sslt";
	setAttr -k on ".cbr";
	setAttr -k on ".bbr";
	setAttr -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -av -k on ".hwi" yes;
	setAttr -k on ".csvd";
	setAttr -av -k on ".ta" 3;
	setAttr -av -k on ".tq" 1;
	setAttr -k on ".ts" yes;
	setAttr ".acpp" yes;
	setAttr -av -k on ".etmr";
	setAttr -av -k on ".tmr";
	setAttr -av -k on ".aoon";
	setAttr -av -k on ".aoam";
	setAttr -av -k on ".aora";
	setAttr -k on ".aofr";
	setAttr -av -k on ".aosm";
	setAttr -av -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av -k on ".mbe";
	setAttr -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".mbsc";
	setAttr -k on ".mbc";
	setAttr -k on ".mbfa";
	setAttr -k on ".mbftb";
	setAttr -k on ".mbftg";
	setAttr -k on ".mbftr";
	setAttr -k on ".mbfta";
	setAttr -k on ".mbfe";
	setAttr -k on ".mbme";
	setAttr -k on ".mbcsx";
	setAttr -k on ".mbcsy";
	setAttr -k on ".mbasx";
	setAttr -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av ".msaa" yes;
	setAttr -av -k on ".aasc";
	setAttr -k on ".aasq";
	setAttr ".laa" yes;
	setAttr ".fprt" yes;
	setAttr ".rtfm" 3;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 82 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :standardSurface1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -cb on ".macc";
	setAttr -av -cb on ".macd";
	setAttr -av -cb on ".macq";
	setAttr -av -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -cb on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -cb on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -av -cb on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -k on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -cb on ".ope";
	setAttr -av -cb on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "standardSurface1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -av -cb on ".hwcc";
	setAttr -av -cb on ".hwdp";
	setAttr -av -cb on ".hwql";
	setAttr -av -k on ".hwfr";
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
connectAttr "hyperLayout1.msg" "Ribbon__9CC60B__Asset.hl";
connectAttr "hyperLayout7.msg" "NodeGroup__9CC60B__Viewport_Display.hl";
connectAttr "__9CC60B__Shape_Axis_Start.oc" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.cp[0]"
		;
connectAttr "__9CC60B__Shape_Axis_End.oc" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.cp[1]"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocr" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.cp[1].zv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocg" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.cp[1].yv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocb" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.cp[1].xv"
		;
connectAttr "Ribbon__9CC60B__Asset.Overlay_Axis_Width" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.ls"
		;
connectAttr "__9CC60B__Shape_Axis_Start.oc" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.cp[0]"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocr" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.cp[1].yv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocg" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.cp[1].xv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocb" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.cp[1].zv"
		;
connectAttr "Ribbon__9CC60B__Asset.Overlay_Axis_Width" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.ls"
		;
connectAttr "__9CC60B__Shape_Axis_Start.ocr" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.cp[0].xv"
		;
connectAttr "__9CC60B__Shape_Axis_Start.ocb" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.cp[0].zv"
		;
connectAttr "__9CC60B__Shape_Axis_Start.ocg" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.cp[0].yv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocr" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.cp[1].xv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocg" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.cp[1].yv"
		;
connectAttr "__9CC60B__Shape_Axis_End.ocb" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.cp[1].zv"
		;
connectAttr "Ribbon__9CC60B__Asset.Overlay_Axis_Width" "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.ls"
		;
connectAttr "hyperLayout5.msg" "NodeGroup__9CC60B__Overlay_Axis.hl";
connectAttr "__9CC60B__UVpin.omat[2]" "__9CC60B__Overlay_Axis_03.opm";
connectAttr "__9CC60B__View_Overlay_03.ob" "__9CC60B__Overlay_Axis_03.v";
connectAttr "__9CC60B__UVpin.omat[4]" "__9CC60B__Overlay_Axis_05.opm";
connectAttr "__9CC60B__View_Overlay_05.ob" "__9CC60B__Overlay_Axis_05.v";
connectAttr "__9CC60B__UVpin.omat[6]" "__9CC60B__Overlay_Axis_07.opm";
connectAttr "__9CC60B__View_Overlay_07.ob" "__9CC60B__Overlay_Axis_07.v";
connectAttr "__9CC60B__UVpin.omat[8]" "__9CC60B__Overlay_Axis_09.opm";
connectAttr "__9CC60B__View_Overlay_09.ob" "__9CC60B__Overlay_Axis_09.v";
connectAttr "__9CC60B__UVpin.omat[10]" "__9CC60B__Overlay_Axis_11.opm";
connectAttr "__9CC60B__View_Overlay_11.ob" "__9CC60B__Overlay_Axis_11.v";
connectAttr "__9CC60B__UVpin.omat[12]" "__9CC60B__Overlay_Axis_13.opm";
connectAttr "__9CC60B__View_Overlay_13.ob" "__9CC60B__Overlay_Axis_13.v";
connectAttr "__9CC60B__UVpin.omat[14]" "__9CC60B__Overlay_Axis_15.opm";
connectAttr "__9CC60B__View_Overlay_15.ob" "__9CC60B__Overlay_Axis_15.v";
connectAttr "__9CC60B__UVpin.omat[16]" "__9CC60B__Overlay_Axis_17.opm";
connectAttr "__9CC60B__View_Overlay_17.ob" "__9CC60B__Overlay_Axis_17.v";
connectAttr "__9CC60B__UVpin.omat[18]" "__9CC60B__Overlay_Axis_19.opm";
connectAttr "__9CC60B__View_Overlay_19.ob" "__9CC60B__Overlay_Axis_19.v";
connectAttr "__9CC60B__UVpin.omat[20]" "__9CC60B__Overlay_Axis_21.opm";
connectAttr "__9CC60B__View_Overlay_21.ob" "__9CC60B__Overlay_Axis_21.v";
connectAttr "__9CC60B__UVpin.omat[22]" "__9CC60B__Overlay_Axis_23.opm";
connectAttr "__9CC60B__View_Overlay_23.ob" "__9CC60B__Overlay_Axis_23.v";
connectAttr "__9CC60B__UVpin.omat[24]" "__9CC60B__Overlay_Axis_25.opm";
connectAttr "__9CC60B__View_Overlay_25.ob" "__9CC60B__Overlay_Axis_25.v";
connectAttr "__9CC60B__UVpin.omat[26]" "__9CC60B__Overlay_Axis_27.opm";
connectAttr "__9CC60B__View_Overlay_27.ob" "__9CC60B__Overlay_Axis_27.v";
connectAttr "__9CC60B__UVpin.omat[28]" "__9CC60B__Overlay_Axis_29.opm";
connectAttr "__9CC60B__View_Overlay_29.ob" "__9CC60B__Overlay_Axis_29.v";
connectAttr "__9CC60B__UVpin.omat[30]" "__9CC60B__Overlay_Axis_31.opm";
connectAttr "__9CC60B__View_Overlay_31.ob" "__9CC60B__Overlay_Axis_31.v";
connectAttr "__9CC60B__UVpin.omat[0]" "__9CC60B__Overlay_Axis_01.opm";
connectAttr "__9CC60B__View_Overlay_01.ob" "__9CC60B__Overlay_Axis_01.v";
connectAttr "__9CC60B__UVpin.omat[1]" "__9CC60B__Overlay_Axis_02.opm";
connectAttr "__9CC60B__View_Overlay_02.ob" "__9CC60B__Overlay_Axis_02.v";
connectAttr "__9CC60B__UVpin.omat[3]" "__9CC60B__Overlay_Axis_04.opm";
connectAttr "__9CC60B__View_Overlay_04.ob" "__9CC60B__Overlay_Axis_04.v";
connectAttr "__9CC60B__UVpin.omat[5]" "__9CC60B__Overlay_Axis_06.opm";
connectAttr "__9CC60B__View_Overlay_06.ob" "__9CC60B__Overlay_Axis_06.v";
connectAttr "__9CC60B__UVpin.omat[7]" "__9CC60B__Overlay_Axis_08.opm";
connectAttr "__9CC60B__View_Overlay_08.ob" "__9CC60B__Overlay_Axis_08.v";
connectAttr "__9CC60B__UVpin.omat[9]" "__9CC60B__Overlay_Axis_10.opm";
connectAttr "__9CC60B__View_Overlay_10.ob" "__9CC60B__Overlay_Axis_10.v";
connectAttr "__9CC60B__UVpin.omat[11]" "__9CC60B__Overlay_Axis_12.opm";
connectAttr "__9CC60B__View_Overlay_12.ob" "__9CC60B__Overlay_Axis_12.v";
connectAttr "__9CC60B__UVpin.omat[13]" "__9CC60B__Overlay_Axis_14.opm";
connectAttr "__9CC60B__View_Overlay_14.ob" "__9CC60B__Overlay_Axis_14.v";
connectAttr "__9CC60B__UVpin.omat[15]" "__9CC60B__Overlay_Axis_16.opm";
connectAttr "__9CC60B__View_Overlay_16.ob" "__9CC60B__Overlay_Axis_16.v";
connectAttr "__9CC60B__UVpin.omat[17]" "__9CC60B__Overlay_Axis_18.opm";
connectAttr "__9CC60B__View_Overlay_18.ob" "__9CC60B__Overlay_Axis_18.v";
connectAttr "__9CC60B__UVpin.omat[19]" "__9CC60B__Overlay_Axis_20.opm";
connectAttr "__9CC60B__View_Overlay_20.ob" "__9CC60B__Overlay_Axis_20.v";
connectAttr "__9CC60B__UVpin.omat[21]" "__9CC60B__Overlay_Axis_22.opm";
connectAttr "__9CC60B__View_Overlay_22.ob" "__9CC60B__Overlay_Axis_22.v";
connectAttr "__9CC60B__UVpin.omat[23]" "__9CC60B__Overlay_Axis_24.opm";
connectAttr "__9CC60B__View_Overlay_24.ob" "__9CC60B__Overlay_Axis_24.v";
connectAttr "__9CC60B__UVpin.omat[25]" "__9CC60B__Overlay_Axis_26.opm";
connectAttr "__9CC60B__View_Overlay_26.ob" "__9CC60B__Overlay_Axis_26.v";
connectAttr "__9CC60B__UVpin.omat[27]" "__9CC60B__Overlay_Axis_28.opm";
connectAttr "__9CC60B__View_Overlay_28.ob" "__9CC60B__Overlay_Axis_28.v";
connectAttr "__9CC60B__UVpin.omat[29]" "__9CC60B__Overlay_Axis_30.opm";
connectAttr "__9CC60B__View_Overlay_30.ob" "__9CC60B__Overlay_Axis_30.v";
connectAttr "__9CC60B__UVpin.omat[31]" "__9CC60B__Overlay_Axis_32.opm";
connectAttr "__9CC60B__View_Overlay_32.ob" "__9CC60B__Overlay_Axis_32.v";
connectAttr "hyperLayout3.msg" "NodeGroup__9CC60B__View_Overlay.hl";
connectAttr "hyperLayout9.msg" "NodeGroup__9CC60B__System_Ribbon.hl";
connectAttr "Handle_In_Mid_01.o" "bezier_edge_inShape.cp[0]";
connectAttr "Handle_In_End_01.o" "bezier_edge_inShape.cp[1]";
connectAttr "Handle_In_Start_02.o" "bezier_edge_inShape.cp[2]";
connectAttr "Handle_In_Mid_02.o" "bezier_edge_inShape.cp[3]";
connectAttr "Handle_In_End_02.o" "bezier_edge_inShape.cp[4]";
connectAttr "Handle_In_Start_03.o" "bezier_edge_inShape.cp[5]";
connectAttr "Handle_In_Mid_03.o" "bezier_edge_inShape.cp[6]";
connectAttr "Handle_Out_Mid_01.o" "bezier_edge_outShape.cp[0]";
connectAttr "Handle_Out_End_01.o" "bezier_edge_outShape.cp[1]";
connectAttr "Handle_Out_Start_02.o" "bezier_edge_outShape.cp[2]";
connectAttr "Handle_Out_Mid_02.o" "bezier_edge_outShape.cp[3]";
connectAttr "Handle_Out_End_02.o" "bezier_edge_outShape.cp[4]";
connectAttr "Handle_Out_Start_03.o" "bezier_edge_outShape.cp[5]";
connectAttr "Handle_Out_Mid_03.o" "bezier_edge_outShape.cp[6]";
connectAttr "loft1.os" "loftedSurfaceShape1.cr";
connectAttr "hyperLayout8.msg" "NodeGroup__9CC60B__System_Instance_Positions.hl"
		;
connectAttr "hyperLayout6.msg" "NodeGroup__9CC60B__Offset_Float.hl";
connectAttr "hyperLayout4.msg" "NodeGroup__9CC60B__Multiply_Position.hl";
connectAttr "hyperLayout2.msg" "NodeGroup__9CC60B__FloatConstant_U.hl";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "standardSurface2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "standardSurface2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "holdMatrix3.o" "Handle_In_Mid_01.m";
connectAttr "Offset_In.of" "Handle_In_Mid_01.z";
connectAttr "holdMatrix3.o" "Handle_In_End_01.m";
connectAttr "Tangent_Scale_01_and_02.of" "Handle_In_End_01.x";
connectAttr "Offset_In.of" "Handle_In_End_01.z";
connectAttr "holdMatrix1.o" "Handle_In_End_02.m";
connectAttr "Multiply_End_02.of" "Handle_In_End_02.x";
connectAttr "Offset_In.of" "Handle_In_End_02.z";
connectAttr "holdMatrix1.o" "Handle_In_Mid_02.m";
connectAttr "Offset_In.of" "Handle_In_Mid_02.z";
connectAttr "holdMatrix1.o" "Handle_In_Start_02.m";
connectAttr "floatMath1.of" "Handle_In_Start_02.x";
connectAttr "Offset_In.of" "Handle_In_Start_02.z";
connectAttr "DRV_Joint_01.wm" "distanceBetween1.im1";
connectAttr "DRV_Joint_02.wm" "distanceBetween1.im2";
connectAttr "RestPosition_Joint_01.wm" "distanceBetween2.im1";
connectAttr "RestPosition_Joint_02.wm" "distanceBetween2.im2";
connectAttr "AutoScale_Influence_01_and_02.of" "Tangent_Scale_01_and_02._f";
connectAttr "Tangent_Scale_01_and_02.of" "floatMath1._fa";
connectAttr "distanceBetween1.d" "Divide_01_and_02._fa";
connectAttr "distanceBetween2.d" "Divide_01_and_02._fb";
connectAttr "distanceBetween3.d" "Divide_02_and_03._fa";
connectAttr "distanceBetween4.d" "Divide_02_and_03._fb";
connectAttr "DRV_Joint_02.wm" "distanceBetween3.im1";
connectAttr "DRV_Joint_03.wm" "distanceBetween3.im2";
connectAttr "RestPosition_Joint_02.wm" "distanceBetween4.im1";
connectAttr "RestPosition_Joint_03.wm" "distanceBetween4.im2";
connectAttr "Tangent_Scale_02_and_03.of" "Multiply_End_02._fa";
connectAttr "AutoScale_Influence_01_and_03.of" "Tangent_Scale_02_and_03._f";
connectAttr "holdMatrix2.o" "Handle_In_Start_03.m";
connectAttr "Multiply_Start_03.of" "Handle_In_Start_03.x";
connectAttr "Offset_In.of" "Handle_In_Start_03.z";
connectAttr "Tangent_Scale_02_and_03.of" "Multiply_Start_03._fa";
connectAttr "holdMatrix2.o" "Handle_In_Mid_03.m";
connectAttr "Offset_In.of" "Handle_In_Mid_03.z";
connectAttr "Divide_01_and_02.of" "Tangent_Size_Multiplier_01_and_02._fa";
connectAttr "Divide_02_and_03.of" "Tangent_Size_Multiplier_02_and_03._fa";
connectAttr "Tangent_Size_Multiplier_02_and_03.of" "Clamp_Tangent_02_and_03.i";
connectAttr "Tangent_Size_Multiplier_01_and_02.of" "Clamp_Tangent_01_and_02.i";
connectAttr "Clamp_Tangent_01_and_02.o" "AutoScale_Influence_01_and_02._fb";
connectAttr "Clamp_Tangent_02_and_03.o" "AutoScale_Influence_01_and_03._fb";
connectAttr "holdMatrix3.o" "Handle_Out_End_01.m";
connectAttr "Tangent_Scale_01_and_02.of" "Handle_Out_End_01.x";
connectAttr "Offset_Out.of" "Handle_Out_End_01.z";
connectAttr "holdMatrix1.o" "Handle_Out_End_02.m";
connectAttr "Multiply_End_02.of" "Handle_Out_End_02.x";
connectAttr "Offset_Out.of" "Handle_Out_End_02.z";
connectAttr "holdMatrix3.o" "Handle_Out_Mid_01.m";
connectAttr "Offset_Out.of" "Handle_Out_Mid_01.z";
connectAttr "holdMatrix1.o" "Handle_Out_Mid_02.m";
connectAttr "Offset_Out.of" "Handle_Out_Mid_02.z";
connectAttr "holdMatrix2.o" "Handle_Out_Mid_03.m";
connectAttr "Offset_Out.of" "Handle_Out_Mid_03.z";
connectAttr "holdMatrix1.o" "Handle_Out_Start_02.m";
connectAttr "Multiply_Start_03.of" "Handle_Out_Start_02.x";
connectAttr "Offset_Out.of" "Handle_Out_Start_02.z";
connectAttr "holdMatrix2.o" "Handle_Out_Start_03.m";
connectAttr "Multiply_Start_03.of" "Handle_Out_Start_03.x";
connectAttr "Offset_Out.of" "Handle_Out_Start_03.z";
connectAttr "DRV_Joint_02.wm" "holdMatrix1.i";
connectAttr "DRV_Joint_03.wm" "holdMatrix2.i";
connectAttr "DRV_Joint_01.wm" "holdMatrix3.i";
connectAttr "bezier_edge_inShape.ws" "loft1.ic[0]";
connectAttr "bezier_edge_outShape.ws" "loft1.ic[1]";
connectAttr "__9CC60B__Offset_Float_01.of" "__9CC60B__FloatConstant_U_01._f";
connectAttr "__9CC60B__Offset_Float_02.of" "__9CC60B__FloatConstant_U_02._f";
connectAttr "__9CC60B__Offset_Float_03.of" "__9CC60B__FloatConstant_U_03._f";
connectAttr "__9CC60B__Offset_Float_04.of" "__9CC60B__FloatConstant_U_04._f";
connectAttr "__9CC60B__Offset_Float_05.of" "__9CC60B__FloatConstant_U_05._f";
connectAttr "NodeGroup__9CC60B__Viewport_Display.msg" "hyperLayout1.hyp[180].dn"
		;
connectAttr "NodeGroup__9CC60B__System_Instance_Positions.msg" "hyperLayout1.hyp[188].dn"
		;
connectAttr "NodeGroup__9CC60B__System_Ribbon.msg" "hyperLayout1.hyp[191].dn";
connectAttr "__9CC60B__ReadMe_Notes.msg" "hyperLayout1.hyp[196].dn";
connectAttr "__9CC60B__ReadMe_NotesShape.msg" "hyperLayout1.hyp[197].dn";
connectAttr "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.msg" "hyperLayout1.hyp[198].dn"
		;
connectAttr "NodeView__9CC60B__Ribbon_Instances_Positions.msg" "hyperLayout1.hyp[199].dn"
		;
connectAttr "__9CC60B__Offset_Float_06.of" "__9CC60B__FloatConstant_U_06._f";
connectAttr "__9CC60B__Offset_Float_07.of" "__9CC60B__FloatConstant_U_07._f";
connectAttr "__9CC60B__Offset_Float_08.of" "__9CC60B__FloatConstant_U_08._f";
connectAttr "__9CC60B__Offset_Float_09.of" "__9CC60B__FloatConstant_U_09._f";
connectAttr "__9CC60B__Offset_Float_10.of" "__9CC60B__FloatConstant_U_10._f";
connectAttr "__9CC60B__Offset_Float_11.of" "__9CC60B__FloatConstant_U_11._f";
connectAttr "__9CC60B__Offset_Float_12.of" "__9CC60B__FloatConstant_U_12._f";
connectAttr "__9CC60B__Offset_Float_13.of" "__9CC60B__FloatConstant_U_13._f";
connectAttr "__9CC60B__Offset_Float_14.of" "__9CC60B__FloatConstant_U_14._f";
connectAttr "__9CC60B__Offset_Float_15.of" "__9CC60B__FloatConstant_U_15._f";
connectAttr "__9CC60B__Offset_Float_16.of" "__9CC60B__FloatConstant_U_16._f";
connectAttr "__9CC60B__Offset_Float_17.of" "__9CC60B__FloatConstant_U_17._f";
connectAttr "__9CC60B__Offset_Float_18.of" "__9CC60B__FloatConstant_U_18._f";
connectAttr "__9CC60B__Offset_Float_19.of" "__9CC60B__FloatConstant_U_19._f";
connectAttr "__9CC60B__Offset_Float_20.of" "__9CC60B__FloatConstant_U_20._f";
connectAttr "__9CC60B__Offset_Float_21.of" "__9CC60B__FloatConstant_U_21._f";
connectAttr "__9CC60B__Offset_Float_22.of" "__9CC60B__FloatConstant_U_22._f";
connectAttr "__9CC60B__Offset_Float_23.of" "__9CC60B__FloatConstant_U_23._f";
connectAttr "__9CC60B__Offset_Float_24.of" "__9CC60B__FloatConstant_U_24._f";
connectAttr "__9CC60B__Offset_Float_25.of" "__9CC60B__FloatConstant_U_25._f";
connectAttr "__9CC60B__Offset_Float_26.of" "__9CC60B__FloatConstant_U_26._f";
connectAttr "__9CC60B__Offset_Float_27.of" "__9CC60B__FloatConstant_U_27._f";
connectAttr "__9CC60B__Offset_Float_28.of" "__9CC60B__FloatConstant_U_28._f";
connectAttr "__9CC60B__Offset_Float_29.of" "__9CC60B__FloatConstant_U_29._f";
connectAttr "__9CC60B__Offset_Float_30.of" "__9CC60B__FloatConstant_U_30._f";
connectAttr "__9CC60B__Offset_Float_31.of" "__9CC60B__FloatConstant_U_31._f";
connectAttr "__9CC60B__Offset_Float_32.of" "__9CC60B__FloatConstant_U_32._f";
connectAttr "__9CC60B__FloatMath_Offset_Index.of" "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count._fb"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_01._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_02._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_03._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_04._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_05._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_06._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_07._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_08._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_09._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_10._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_11._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_12._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_13._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_14._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_15._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_16._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_17._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_18._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_19._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_20._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_21._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_22._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_23._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_24._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_25._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_26._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_27._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_28._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_29._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_30._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_31._fa"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.of" "__9CC60B__Multiply_Position_32._fa"
		;
connectAttr "loftedSurfaceShape1.ws" "__9CC60B__UVpin.curgeom";
connectAttr "__9CC60B__FloatConstant_U_01.of" "__9CC60B__UVpin.coord[0].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[0].cv";
connectAttr "__9CC60B__FloatConstant_U_02.of" "__9CC60B__UVpin.coord[1].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[1].cv";
connectAttr "__9CC60B__FloatConstant_U_03.of" "__9CC60B__UVpin.coord[2].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[2].cv";
connectAttr "__9CC60B__FloatConstant_U_04.of" "__9CC60B__UVpin.coord[3].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[3].cv";
connectAttr "__9CC60B__FloatConstant_U_05.of" "__9CC60B__UVpin.coord[4].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[4].cv";
connectAttr "__9CC60B__FloatConstant_U_06.of" "__9CC60B__UVpin.coord[5].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[5].cv";
connectAttr "__9CC60B__FloatConstant_U_07.of" "__9CC60B__UVpin.coord[6].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[6].cv";
connectAttr "__9CC60B__FloatConstant_U_08.of" "__9CC60B__UVpin.coord[7].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[7].cv";
connectAttr "__9CC60B__FloatConstant_U_09.of" "__9CC60B__UVpin.coord[8].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[8].cv";
connectAttr "__9CC60B__FloatConstant_U_10.of" "__9CC60B__UVpin.coord[9].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[9].cv";
connectAttr "__9CC60B__FloatConstant_U_11.of" "__9CC60B__UVpin.coord[10].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[10].cv";
connectAttr "__9CC60B__FloatConstant_U_12.of" "__9CC60B__UVpin.coord[11].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[11].cv";
connectAttr "__9CC60B__FloatConstant_U_13.of" "__9CC60B__UVpin.coord[12].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[12].cv";
connectAttr "__9CC60B__FloatConstant_U_14.of" "__9CC60B__UVpin.coord[13].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[13].cv";
connectAttr "__9CC60B__FloatConstant_U_15.of" "__9CC60B__UVpin.coord[14].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[14].cv";
connectAttr "__9CC60B__FloatConstant_U_16.of" "__9CC60B__UVpin.coord[15].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[15].cv";
connectAttr "__9CC60B__FloatConstant_U_17.of" "__9CC60B__UVpin.coord[16].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[16].cv";
connectAttr "__9CC60B__FloatConstant_U_18.of" "__9CC60B__UVpin.coord[17].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[17].cv";
connectAttr "__9CC60B__FloatConstant_U_19.of" "__9CC60B__UVpin.coord[18].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[18].cv";
connectAttr "__9CC60B__FloatConstant_U_20.of" "__9CC60B__UVpin.coord[19].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[19].cv";
connectAttr "__9CC60B__FloatConstant_U_21.of" "__9CC60B__UVpin.coord[20].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[20].cv";
connectAttr "__9CC60B__FloatConstant_U_22.of" "__9CC60B__UVpin.coord[21].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[21].cv";
connectAttr "__9CC60B__FloatConstant_U_23.of" "__9CC60B__UVpin.coord[22].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[22].cv";
connectAttr "__9CC60B__FloatConstant_U_24.of" "__9CC60B__UVpin.coord[23].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[23].cv";
connectAttr "__9CC60B__FloatConstant_U_25.of" "__9CC60B__UVpin.coord[24].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[24].cv";
connectAttr "__9CC60B__FloatConstant_U_26.of" "__9CC60B__UVpin.coord[25].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[25].cv";
connectAttr "__9CC60B__FloatConstant_U_27.of" "__9CC60B__UVpin.coord[26].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[26].cv";
connectAttr "__9CC60B__FloatConstant_U_28.of" "__9CC60B__UVpin.coord[27].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[27].cv";
connectAttr "__9CC60B__FloatConstant_U_29.of" "__9CC60B__UVpin.coord[28].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[28].cv";
connectAttr "__9CC60B__FloatConstant_U_30.of" "__9CC60B__UVpin.coord[29].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[29].cv";
connectAttr "__9CC60B__FloatConstant_U_31.of" "__9CC60B__UVpin.coord[30].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[30].cv";
connectAttr "__9CC60B__FloatConstant_U_32.of" "__9CC60B__UVpin.coord[31].cu";
connectAttr "__9CC60B__FloatConstant_V.of" "__9CC60B__UVpin.coord[31].cv";
connectAttr "Ribbon__9CC60B__Asset.Overlay_Axis_Scale" "__9CC60B__Shape_Axis_End._cr"
		;
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_01._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_02._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_03._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_04._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_05._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_06._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_07._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_08._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_09._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_10._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_11._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_12._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_13._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_14._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_15._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_16._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_17._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_18._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_19._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_20._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_21._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_22._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_23._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_24._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_25._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_26._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_27._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_28._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_29._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_30._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_31._aa";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__View_Overlay_32._aa";
connectAttr "__9CC60B__Clamp_Result.opr" "__9CC60B__Float_Reroute_Multiply._f";
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__FloatMath_Offset_Index._fa"
		;
connectAttr "__9CC60B__Clamp_Chooser_Selector.opr" "__9CC60B__Chose_Single_Index_Offset.s"
		;
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__Chose_Single_Index_Offset.i[0]"
		;
connectAttr "__9CC60B__FloatMath_Center_Single_Index.of" "__9CC60B__Chose_Single_Index_Offset.i[1]"
		;
connectAttr "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count.of" "__9CC60B__Chose_Single_Index_Offset.i[2]"
		;
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__FloatMath_Center_Single_Index._fa"
		;
connectAttr "Ribbon__9CC60B__Asset.Instances" "__9CC60B__Clamp_Chooser_Selector.ipr"
		;
connectAttr "__9CC60B__Chose_Single_Index_Offset.o" "__9CC60B__Clamp_Result.ipr"
		;
connectAttr "__9CC60B__Multiply_Position_01.of" "__9CC60B__Offset_Float_01._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_01._fa";
connectAttr "__9CC60B__Multiply_Position_02.of" "__9CC60B__Offset_Float_02._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_02._fa";
connectAttr "__9CC60B__Multiply_Position_03.of" "__9CC60B__Offset_Float_03._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_03._fa";
connectAttr "__9CC60B__Multiply_Position_04.of" "__9CC60B__Offset_Float_04._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_04._fa";
connectAttr "__9CC60B__Multiply_Position_05.of" "__9CC60B__Offset_Float_05._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_05._fa";
connectAttr "__9CC60B__Multiply_Position_06.of" "__9CC60B__Offset_Float_06._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_06._fa";
connectAttr "__9CC60B__Multiply_Position_07.of" "__9CC60B__Offset_Float_07._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_07._fa";
connectAttr "__9CC60B__Multiply_Position_08.of" "__9CC60B__Offset_Float_08._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_08._fa";
connectAttr "__9CC60B__Multiply_Position_09.of" "__9CC60B__Offset_Float_09._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_09._fa";
connectAttr "__9CC60B__Multiply_Position_10.of" "__9CC60B__Offset_Float_10._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_10._fa";
connectAttr "__9CC60B__Multiply_Position_11.of" "__9CC60B__Offset_Float_11._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_11._fa";
connectAttr "__9CC60B__Multiply_Position_12.of" "__9CC60B__Offset_Float_12._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_12._fa";
connectAttr "__9CC60B__Multiply_Position_13.of" "__9CC60B__Offset_Float_13._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_13._fa";
connectAttr "__9CC60B__Multiply_Position_14.of" "__9CC60B__Offset_Float_14._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_14._fa";
connectAttr "__9CC60B__Multiply_Position_15.of" "__9CC60B__Offset_Float_15._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_15._fa";
connectAttr "__9CC60B__Multiply_Position_16.of" "__9CC60B__Offset_Float_16._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_16._fa";
connectAttr "__9CC60B__Multiply_Position_17.of" "__9CC60B__Offset_Float_17._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_17._fa";
connectAttr "__9CC60B__Multiply_Position_18.of" "__9CC60B__Offset_Float_18._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_18._fa";
connectAttr "__9CC60B__Multiply_Position_19.of" "__9CC60B__Offset_Float_19._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_19._fa";
connectAttr "__9CC60B__Multiply_Position_20.of" "__9CC60B__Offset_Float_20._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_20._fa";
connectAttr "__9CC60B__Multiply_Position_21.of" "__9CC60B__Offset_Float_21._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_21._fa";
connectAttr "__9CC60B__Multiply_Position_22.of" "__9CC60B__Offset_Float_22._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_22._fa";
connectAttr "__9CC60B__Multiply_Position_23.of" "__9CC60B__Offset_Float_23._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_23._fa";
connectAttr "__9CC60B__Multiply_Position_24.of" "__9CC60B__Offset_Float_24._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_24._fa";
connectAttr "__9CC60B__Multiply_Position_25.of" "__9CC60B__Offset_Float_25._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_25._fa";
connectAttr "__9CC60B__Multiply_Position_26.of" "__9CC60B__Offset_Float_26._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_26._fa";
connectAttr "__9CC60B__Multiply_Position_27.of" "__9CC60B__Offset_Float_27._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_27._fa";
connectAttr "__9CC60B__Multiply_Position_28.of" "__9CC60B__Offset_Float_28._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_28._fa";
connectAttr "__9CC60B__Multiply_Position_29.of" "__9CC60B__Offset_Float_29._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_29._fa";
connectAttr "__9CC60B__Multiply_Position_30.of" "__9CC60B__Offset_Float_30._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_30._fa";
connectAttr "__9CC60B__Multiply_Position_31.of" "__9CC60B__Offset_Float_31._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_31._fa";
connectAttr "__9CC60B__Multiply_Position_32.of" "__9CC60B__Offset_Float_32._fb";
connectAttr "__9CC60B__Float_Reroute_Offset.of" "__9CC60B__Offset_Float_32._fa";
connectAttr "__9CC60B__Fix_U_Position_Overflow.of" "__9CC60B__Float_Reroute_Offset._f"
		;
connectAttr "__9CC60B__Clamp_Result.opr" "__9CC60B__Multiply_Result_Zero._fa";
connectAttr "__9CC60B__Clamp_Chooser_Selector.opr" "__9CC60B__Chose_Substract_or_Disable.s"
		;
connectAttr "__9CC60B__Multiply_Result_Zero.of" "__9CC60B__Chose_Substract_or_Disable.i[0]"
		;
connectAttr "__9CC60B__Multiply_Result_Zero.of" "__9CC60B__Chose_Substract_or_Disable.i[1]"
		;
connectAttr "__9CC60B__Multiply_Result_Negative.of" "__9CC60B__Chose_Substract_or_Disable.i[2]"
		;
connectAttr "__9CC60B__Clamp_Result.opr" "__9CC60B__Multiply_Result_Negative._fa"
		;
connectAttr "__9CC60B__Chose_Substract_or_Disable.o" "__9CC60B__Fix_U_Position_Overflow._fa"
		;
connectAttr "standardSurface2.oc" "standardSurface2SG.ss";
connectAttr "loftedSurfaceShape1.iog" "standardSurface2SG.dsm" -na;
connectAttr "standardSurface2SG.msg" "materialInfo1.sg";
connectAttr "standardSurface2.msg" "materialInfo1.m";
connectAttr "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.msg" "MayaNodeEditorBookmarks.b[0]"
		;
connectAttr "NodeView__9CC60B__Ribbon_Instances_Positions.msg" "MayaNodeEditorBookmarks.b[1]"
		;
connectAttr "Clamp_Tangent_01_and_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[0].dn"
		;
connectAttr "bezier_edge_outShape.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[1].dn"
		;
connectAttr "Tangent_Size_Multiplier_01_and_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[2].dn"
		;
connectAttr "DRV_Joint_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[3].dn"
		;
connectAttr "AutoScale_Influence_01_and_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[4].dn"
		;
connectAttr "Clamp_Tangent_02_and_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[5].dn"
		;
connectAttr "RestPosition_Joint_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[6].dn"
		;
connectAttr "Handle_Out_Mid_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[7].dn"
		;
connectAttr "bezier_edge_inShape.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[8].dn"
		;
connectAttr "Offset_In.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[9].dn"
		;
connectAttr "bezier_edge_in.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[10].dn"
		;
connectAttr "distanceBetween2.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[11].dn"
		;
connectAttr "Handle_Out_Mid_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[12].dn"
		;
connectAttr "distanceBetween1.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[13].dn"
		;
connectAttr "holdMatrix2.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[14].dn"
		;
connectAttr "Multiply_End_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[15].dn"
		;
connectAttr "Handle_Out_Mid_01.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[16].dn"
		;
connectAttr "RestPosition_Joint_01.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[17].dn"
		;
connectAttr "Offset_Out.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[18].dn"
		;
connectAttr "Multiply_Start_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[19].dn"
		;
connectAttr "DRV_Joint_01.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[20].dn"
		;
connectAttr "holdMatrix1.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[21].dn"
		;
connectAttr "Handle_In_Start_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[22].dn"
		;
connectAttr "Tangent_Size_Multiplier_02_and_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[23].dn"
		;
connectAttr "Handle_In_Mid_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[24].dn"
		;
connectAttr "floatMath1.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[25].dn"
		;
connectAttr "DRV_Joint_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[26].dn"
		;
connectAttr "Handle_Out_Start_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[27].dn"
		;
connectAttr "bezier_edge_out.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[28].dn"
		;
connectAttr "AutoScale_Influence_01_and_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[29].dn"
		;
connectAttr "Handle_In_End_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[30].dn"
		;
connectAttr "Handle_Out_Start_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[31].dn"
		;
connectAttr "Handle_In_Start_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[32].dn"
		;
connectAttr "Handle_In_Mid_01.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[33].dn"
		;
connectAttr "RestPosition_Joint_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[34].dn"
		;
connectAttr "Handle_In_End_01.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[35].dn"
		;
connectAttr "Divide_02_and_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[36].dn"
		;
connectAttr "holdMatrix3.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[37].dn"
		;
connectAttr "Divide_01_and_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[38].dn"
		;
connectAttr "Handle_In_Mid_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[39].dn"
		;
connectAttr "distanceBetween4.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[40].dn"
		;
connectAttr "distanceBetween3.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[41].dn"
		;
connectAttr "Tangent_Scale_01_and_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[42].dn"
		;
connectAttr "Handle_Out_End_02.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[43].dn"
		;
connectAttr "Handle_Out_End_01.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[44].dn"
		;
connectAttr "Tangent_Scale_02_and_03.msg" "NodeView__9CC60B__Bezier_ControlPoint_Matrix_Deformation.ni[45].dn"
		;
connectAttr "__9CC60B__Multiply_Result_Zero.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[0].dn"
		;
connectAttr "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[1].dn"
		;
connectAttr "__9CC60B__Fix_U_Position_Overflow.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[2].dn"
		;
connectAttr "__9CC60B__Multiply_Result_Negative.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[3].dn"
		;
connectAttr "__9CC60B__FloatMath_Offset_Index.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[4].dn"
		;
connectAttr "__9CC60B__FloatMath_Center_Single_Index.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[5].dn"
		;
connectAttr "__9CC60B__Clamp_Result.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[6].dn"
		;
connectAttr "__9CC60B__Shape_Axis_Start.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[7].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[8].dn"
		;
connectAttr "__9CC60B__Overlay_Axis.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[9].dn"
		;
connectAttr "Ribbon__9CC60B__Asset.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[10].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[11].dn"
		;
connectAttr "__9CC60B__Shape_Axis_End.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[12].dn"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[13].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[14].dn"
		;
connectAttr "__9CC60B__FloatConstant_V.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[15].dn"
		;
connectAttr "__9CC60B__Clamp_Chooser_Selector.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[16].dn"
		;
connectAttr "__9CC60B__Chose_Single_Index_Offset.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[17].dn"
		;
connectAttr "__9CC60B__UVpin.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[18].dn"
		;
connectAttr "__9CC60B__Chose_Substract_or_Disable.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[19].dn"
		;
connectAttr "__9CC60B__Float_Reroute_Offset.msg" "NodeView__9CC60B__Ribbon_Instances_Positions.ni[20].dn"
		;
connectAttr "__9CC60B__FloatConstant_U_01.msg" "hyperLayout2.hyp[0].dn";
connectAttr "__9CC60B__FloatConstant_U_02.msg" "hyperLayout2.hyp[1].dn";
connectAttr "__9CC60B__FloatConstant_U_03.msg" "hyperLayout2.hyp[2].dn";
connectAttr "__9CC60B__FloatConstant_U_04.msg" "hyperLayout2.hyp[3].dn";
connectAttr "__9CC60B__FloatConstant_U_05.msg" "hyperLayout2.hyp[4].dn";
connectAttr "__9CC60B__FloatConstant_U_06.msg" "hyperLayout2.hyp[5].dn";
connectAttr "__9CC60B__FloatConstant_U_07.msg" "hyperLayout2.hyp[6].dn";
connectAttr "__9CC60B__FloatConstant_U_08.msg" "hyperLayout2.hyp[7].dn";
connectAttr "__9CC60B__FloatConstant_U_09.msg" "hyperLayout2.hyp[8].dn";
connectAttr "__9CC60B__FloatConstant_U_10.msg" "hyperLayout2.hyp[9].dn";
connectAttr "__9CC60B__FloatConstant_U_11.msg" "hyperLayout2.hyp[10].dn";
connectAttr "__9CC60B__FloatConstant_U_12.msg" "hyperLayout2.hyp[11].dn";
connectAttr "__9CC60B__FloatConstant_U_13.msg" "hyperLayout2.hyp[12].dn";
connectAttr "__9CC60B__FloatConstant_U_14.msg" "hyperLayout2.hyp[13].dn";
connectAttr "__9CC60B__FloatConstant_U_15.msg" "hyperLayout2.hyp[14].dn";
connectAttr "__9CC60B__FloatConstant_U_16.msg" "hyperLayout2.hyp[15].dn";
connectAttr "__9CC60B__FloatConstant_U_17.msg" "hyperLayout2.hyp[16].dn";
connectAttr "__9CC60B__FloatConstant_U_18.msg" "hyperLayout2.hyp[17].dn";
connectAttr "__9CC60B__FloatConstant_U_19.msg" "hyperLayout2.hyp[18].dn";
connectAttr "__9CC60B__FloatConstant_U_20.msg" "hyperLayout2.hyp[19].dn";
connectAttr "__9CC60B__FloatConstant_U_21.msg" "hyperLayout2.hyp[20].dn";
connectAttr "__9CC60B__FloatConstant_U_22.msg" "hyperLayout2.hyp[21].dn";
connectAttr "__9CC60B__FloatConstant_U_23.msg" "hyperLayout2.hyp[22].dn";
connectAttr "__9CC60B__FloatConstant_U_24.msg" "hyperLayout2.hyp[23].dn";
connectAttr "__9CC60B__FloatConstant_U_25.msg" "hyperLayout2.hyp[24].dn";
connectAttr "__9CC60B__FloatConstant_U_26.msg" "hyperLayout2.hyp[25].dn";
connectAttr "__9CC60B__FloatConstant_U_27.msg" "hyperLayout2.hyp[26].dn";
connectAttr "__9CC60B__FloatConstant_U_28.msg" "hyperLayout2.hyp[27].dn";
connectAttr "__9CC60B__FloatConstant_U_29.msg" "hyperLayout2.hyp[28].dn";
connectAttr "__9CC60B__FloatConstant_U_30.msg" "hyperLayout2.hyp[29].dn";
connectAttr "__9CC60B__FloatConstant_U_31.msg" "hyperLayout2.hyp[30].dn";
connectAttr "__9CC60B__FloatConstant_U_32.msg" "hyperLayout2.hyp[31].dn";
connectAttr "__9CC60B__View_Overlay_01.msg" "hyperLayout3.hyp[0].dn";
connectAttr "__9CC60B__View_Overlay_02.msg" "hyperLayout3.hyp[1].dn";
connectAttr "__9CC60B__View_Overlay_03.msg" "hyperLayout3.hyp[2].dn";
connectAttr "__9CC60B__View_Overlay_04.msg" "hyperLayout3.hyp[3].dn";
connectAttr "__9CC60B__View_Overlay_05.msg" "hyperLayout3.hyp[4].dn";
connectAttr "__9CC60B__View_Overlay_06.msg" "hyperLayout3.hyp[5].dn";
connectAttr "__9CC60B__View_Overlay_07.msg" "hyperLayout3.hyp[6].dn";
connectAttr "__9CC60B__View_Overlay_08.msg" "hyperLayout3.hyp[7].dn";
connectAttr "__9CC60B__View_Overlay_09.msg" "hyperLayout3.hyp[8].dn";
connectAttr "__9CC60B__View_Overlay_10.msg" "hyperLayout3.hyp[9].dn";
connectAttr "__9CC60B__View_Overlay_11.msg" "hyperLayout3.hyp[10].dn";
connectAttr "__9CC60B__View_Overlay_12.msg" "hyperLayout3.hyp[11].dn";
connectAttr "__9CC60B__View_Overlay_13.msg" "hyperLayout3.hyp[12].dn";
connectAttr "__9CC60B__View_Overlay_14.msg" "hyperLayout3.hyp[13].dn";
connectAttr "__9CC60B__View_Overlay_15.msg" "hyperLayout3.hyp[14].dn";
connectAttr "__9CC60B__View_Overlay_16.msg" "hyperLayout3.hyp[15].dn";
connectAttr "__9CC60B__View_Overlay_17.msg" "hyperLayout3.hyp[16].dn";
connectAttr "__9CC60B__View_Overlay_18.msg" "hyperLayout3.hyp[17].dn";
connectAttr "__9CC60B__View_Overlay_19.msg" "hyperLayout3.hyp[18].dn";
connectAttr "__9CC60B__View_Overlay_20.msg" "hyperLayout3.hyp[19].dn";
connectAttr "__9CC60B__View_Overlay_21.msg" "hyperLayout3.hyp[20].dn";
connectAttr "__9CC60B__View_Overlay_22.msg" "hyperLayout3.hyp[21].dn";
connectAttr "__9CC60B__View_Overlay_23.msg" "hyperLayout3.hyp[22].dn";
connectAttr "__9CC60B__View_Overlay_24.msg" "hyperLayout3.hyp[23].dn";
connectAttr "__9CC60B__View_Overlay_25.msg" "hyperLayout3.hyp[24].dn";
connectAttr "__9CC60B__View_Overlay_26.msg" "hyperLayout3.hyp[25].dn";
connectAttr "__9CC60B__View_Overlay_27.msg" "hyperLayout3.hyp[26].dn";
connectAttr "__9CC60B__View_Overlay_28.msg" "hyperLayout3.hyp[27].dn";
connectAttr "__9CC60B__View_Overlay_29.msg" "hyperLayout3.hyp[28].dn";
connectAttr "__9CC60B__View_Overlay_30.msg" "hyperLayout3.hyp[29].dn";
connectAttr "__9CC60B__View_Overlay_31.msg" "hyperLayout3.hyp[30].dn";
connectAttr "__9CC60B__View_Overlay_32.msg" "hyperLayout3.hyp[31].dn";
connectAttr "__9CC60B__Multiply_Position_01.msg" "hyperLayout4.hyp[0].dn";
connectAttr "__9CC60B__Multiply_Position_02.msg" "hyperLayout4.hyp[1].dn";
connectAttr "__9CC60B__Multiply_Position_03.msg" "hyperLayout4.hyp[2].dn";
connectAttr "__9CC60B__Multiply_Position_04.msg" "hyperLayout4.hyp[3].dn";
connectAttr "__9CC60B__Multiply_Position_05.msg" "hyperLayout4.hyp[4].dn";
connectAttr "__9CC60B__Multiply_Position_06.msg" "hyperLayout4.hyp[5].dn";
connectAttr "__9CC60B__Multiply_Position_07.msg" "hyperLayout4.hyp[6].dn";
connectAttr "__9CC60B__Multiply_Position_08.msg" "hyperLayout4.hyp[7].dn";
connectAttr "__9CC60B__Multiply_Position_09.msg" "hyperLayout4.hyp[8].dn";
connectAttr "__9CC60B__Multiply_Position_10.msg" "hyperLayout4.hyp[9].dn";
connectAttr "__9CC60B__Multiply_Position_11.msg" "hyperLayout4.hyp[10].dn";
connectAttr "__9CC60B__Multiply_Position_12.msg" "hyperLayout4.hyp[11].dn";
connectAttr "__9CC60B__Multiply_Position_13.msg" "hyperLayout4.hyp[12].dn";
connectAttr "__9CC60B__Multiply_Position_14.msg" "hyperLayout4.hyp[13].dn";
connectAttr "__9CC60B__Multiply_Position_15.msg" "hyperLayout4.hyp[14].dn";
connectAttr "__9CC60B__Multiply_Position_16.msg" "hyperLayout4.hyp[15].dn";
connectAttr "__9CC60B__Multiply_Position_17.msg" "hyperLayout4.hyp[16].dn";
connectAttr "__9CC60B__Multiply_Position_18.msg" "hyperLayout4.hyp[17].dn";
connectAttr "__9CC60B__Multiply_Position_19.msg" "hyperLayout4.hyp[18].dn";
connectAttr "__9CC60B__Multiply_Position_20.msg" "hyperLayout4.hyp[19].dn";
connectAttr "__9CC60B__Multiply_Position_21.msg" "hyperLayout4.hyp[20].dn";
connectAttr "__9CC60B__Multiply_Position_22.msg" "hyperLayout4.hyp[21].dn";
connectAttr "__9CC60B__Multiply_Position_23.msg" "hyperLayout4.hyp[22].dn";
connectAttr "__9CC60B__Multiply_Position_24.msg" "hyperLayout4.hyp[23].dn";
connectAttr "__9CC60B__Multiply_Position_25.msg" "hyperLayout4.hyp[24].dn";
connectAttr "__9CC60B__Multiply_Position_26.msg" "hyperLayout4.hyp[25].dn";
connectAttr "__9CC60B__Multiply_Position_27.msg" "hyperLayout4.hyp[26].dn";
connectAttr "__9CC60B__Multiply_Position_28.msg" "hyperLayout4.hyp[27].dn";
connectAttr "__9CC60B__Multiply_Position_29.msg" "hyperLayout4.hyp[28].dn";
connectAttr "__9CC60B__Multiply_Position_30.msg" "hyperLayout4.hyp[29].dn";
connectAttr "__9CC60B__Multiply_Position_31.msg" "hyperLayout4.hyp[30].dn";
connectAttr "__9CC60B__Multiply_Position_32.msg" "hyperLayout4.hyp[31].dn";
connectAttr "__9CC60B__Overlay_Axis_01.msg" "hyperLayout5.hyp[64].dn";
connectAttr "__9CC60B__Overlay_Axis_02.msg" "hyperLayout5.hyp[65].dn";
connectAttr "__9CC60B__Overlay_Axis_03.msg" "hyperLayout5.hyp[66].dn";
connectAttr "__9CC60B__Overlay_Axis_04.msg" "hyperLayout5.hyp[67].dn";
connectAttr "__9CC60B__Overlay_Axis_05.msg" "hyperLayout5.hyp[68].dn";
connectAttr "__9CC60B__Overlay_Axis_06.msg" "hyperLayout5.hyp[69].dn";
connectAttr "__9CC60B__Overlay_Axis_07.msg" "hyperLayout5.hyp[70].dn";
connectAttr "__9CC60B__Overlay_Axis_08.msg" "hyperLayout5.hyp[71].dn";
connectAttr "__9CC60B__Overlay_Axis_09.msg" "hyperLayout5.hyp[72].dn";
connectAttr "__9CC60B__Overlay_Axis_10.msg" "hyperLayout5.hyp[73].dn";
connectAttr "__9CC60B__Overlay_Axis_11.msg" "hyperLayout5.hyp[74].dn";
connectAttr "__9CC60B__Overlay_Axis_12.msg" "hyperLayout5.hyp[75].dn";
connectAttr "__9CC60B__Overlay_Axis_13.msg" "hyperLayout5.hyp[76].dn";
connectAttr "__9CC60B__Overlay_Axis_14.msg" "hyperLayout5.hyp[77].dn";
connectAttr "__9CC60B__Overlay_Axis_15.msg" "hyperLayout5.hyp[78].dn";
connectAttr "__9CC60B__Overlay_Axis_16.msg" "hyperLayout5.hyp[79].dn";
connectAttr "__9CC60B__Overlay_Axis_17.msg" "hyperLayout5.hyp[80].dn";
connectAttr "__9CC60B__Overlay_Axis_18.msg" "hyperLayout5.hyp[81].dn";
connectAttr "__9CC60B__Overlay_Axis_19.msg" "hyperLayout5.hyp[82].dn";
connectAttr "__9CC60B__Overlay_Axis_20.msg" "hyperLayout5.hyp[83].dn";
connectAttr "__9CC60B__Overlay_Axis_21.msg" "hyperLayout5.hyp[84].dn";
connectAttr "__9CC60B__Overlay_Axis_22.msg" "hyperLayout5.hyp[85].dn";
connectAttr "__9CC60B__Overlay_Axis_23.msg" "hyperLayout5.hyp[86].dn";
connectAttr "__9CC60B__Overlay_Axis_24.msg" "hyperLayout5.hyp[87].dn";
connectAttr "__9CC60B__Overlay_Axis_25.msg" "hyperLayout5.hyp[88].dn";
connectAttr "__9CC60B__Overlay_Axis_26.msg" "hyperLayout5.hyp[89].dn";
connectAttr "__9CC60B__Overlay_Axis_27.msg" "hyperLayout5.hyp[90].dn";
connectAttr "__9CC60B__Overlay_Axis_28.msg" "hyperLayout5.hyp[91].dn";
connectAttr "__9CC60B__Overlay_Axis_29.msg" "hyperLayout5.hyp[92].dn";
connectAttr "__9CC60B__Overlay_Axis_30.msg" "hyperLayout5.hyp[93].dn";
connectAttr "__9CC60B__Overlay_Axis_31.msg" "hyperLayout5.hyp[94].dn";
connectAttr "__9CC60B__Overlay_Axis_32.msg" "hyperLayout5.hyp[95].dn";
connectAttr "__9CC60B__Offset_Float_01.msg" "hyperLayout6.hyp[0].dn";
connectAttr "__9CC60B__Offset_Float_02.msg" "hyperLayout6.hyp[1].dn";
connectAttr "__9CC60B__Offset_Float_03.msg" "hyperLayout6.hyp[2].dn";
connectAttr "__9CC60B__Offset_Float_04.msg" "hyperLayout6.hyp[3].dn";
connectAttr "__9CC60B__Offset_Float_05.msg" "hyperLayout6.hyp[4].dn";
connectAttr "__9CC60B__Offset_Float_06.msg" "hyperLayout6.hyp[5].dn";
connectAttr "__9CC60B__Offset_Float_07.msg" "hyperLayout6.hyp[6].dn";
connectAttr "__9CC60B__Offset_Float_08.msg" "hyperLayout6.hyp[7].dn";
connectAttr "__9CC60B__Offset_Float_09.msg" "hyperLayout6.hyp[8].dn";
connectAttr "__9CC60B__Offset_Float_10.msg" "hyperLayout6.hyp[9].dn";
connectAttr "__9CC60B__Offset_Float_11.msg" "hyperLayout6.hyp[10].dn";
connectAttr "__9CC60B__Offset_Float_12.msg" "hyperLayout6.hyp[11].dn";
connectAttr "__9CC60B__Offset_Float_13.msg" "hyperLayout6.hyp[12].dn";
connectAttr "__9CC60B__Offset_Float_14.msg" "hyperLayout6.hyp[13].dn";
connectAttr "__9CC60B__Offset_Float_15.msg" "hyperLayout6.hyp[14].dn";
connectAttr "__9CC60B__Offset_Float_16.msg" "hyperLayout6.hyp[15].dn";
connectAttr "__9CC60B__Offset_Float_17.msg" "hyperLayout6.hyp[16].dn";
connectAttr "__9CC60B__Offset_Float_18.msg" "hyperLayout6.hyp[17].dn";
connectAttr "__9CC60B__Offset_Float_19.msg" "hyperLayout6.hyp[18].dn";
connectAttr "__9CC60B__Offset_Float_20.msg" "hyperLayout6.hyp[19].dn";
connectAttr "__9CC60B__Offset_Float_21.msg" "hyperLayout6.hyp[20].dn";
connectAttr "__9CC60B__Offset_Float_22.msg" "hyperLayout6.hyp[21].dn";
connectAttr "__9CC60B__Offset_Float_23.msg" "hyperLayout6.hyp[22].dn";
connectAttr "__9CC60B__Offset_Float_24.msg" "hyperLayout6.hyp[23].dn";
connectAttr "__9CC60B__Offset_Float_25.msg" "hyperLayout6.hyp[24].dn";
connectAttr "__9CC60B__Offset_Float_26.msg" "hyperLayout6.hyp[25].dn";
connectAttr "__9CC60B__Offset_Float_27.msg" "hyperLayout6.hyp[26].dn";
connectAttr "__9CC60B__Offset_Float_28.msg" "hyperLayout6.hyp[27].dn";
connectAttr "__9CC60B__Offset_Float_29.msg" "hyperLayout6.hyp[28].dn";
connectAttr "__9CC60B__Offset_Float_30.msg" "hyperLayout6.hyp[29].dn";
connectAttr "__9CC60B__Offset_Float_31.msg" "hyperLayout6.hyp[30].dn";
connectAttr "__9CC60B__Offset_Float_32.msg" "hyperLayout6.hyp[31].dn";
connectAttr "__9CC60B__Overlay_Axis.msg" "hyperLayout7.hyp[1].dn";
connectAttr "NodeGroup__9CC60B__Overlay_Axis.msg" "hyperLayout7.hyp[2].dn";
connectAttr "NodeGroup__9CC60B__View_Overlay.msg" "hyperLayout7.hyp[3].dn";
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.msg" "hyperLayout7.hyp[20].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.msg" "hyperLayout7.hyp[21].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.msg" "hyperLayout7.hyp[22].dn"
		;
connectAttr "__9CC60B__Shape_Axis_Start.msg" "hyperLayout7.hyp[23].dn";
connectAttr "__9CC60B__Shape_Axis_End.msg" "hyperLayout7.hyp[24].dn";
connectAttr "__9CC60B__Chose_Single_Index_Offset.msg" "hyperLayout8.hyp[0].dn";
connectAttr "__9CC60B__Chose_Substract_or_Disable.msg" "hyperLayout8.hyp[1].dn";
connectAttr "__9CC60B__Clamp_Chooser_Selector.msg" "hyperLayout8.hyp[2].dn";
connectAttr "__9CC60B__Clamp_Result.msg" "hyperLayout8.hyp[3].dn";
connectAttr "__9CC60B__Float_Reroute_Multiply.msg" "hyperLayout8.hyp[4].dn";
connectAttr "__9CC60B__Float_Reroute_Offset.msg" "hyperLayout8.hyp[5].dn";
connectAttr "__9CC60B__FloatConstant_V.msg" "hyperLayout8.hyp[6].dn";
connectAttr "__9CC60B__Fix_U_Position_Overflow.msg" "hyperLayout8.hyp[7].dn";
connectAttr "__9CC60B__FloatMath_Center_Single_Index.msg" "hyperLayout8.hyp[8].dn"
		;
connectAttr "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count.msg" "hyperLayout8.hyp[9].dn"
		;
connectAttr "__9CC60B__FloatMath_Offset_Index.msg" "hyperLayout8.hyp[10].dn";
connectAttr "__9CC60B__Multiply_Result_Negative.msg" "hyperLayout8.hyp[11].dn";
connectAttr "__9CC60B__Multiply_Result_Zero.msg" "hyperLayout8.hyp[12].dn";
connectAttr "__9CC60B__UVpin.msg" "hyperLayout8.hyp[13].dn";
connectAttr "NodeGroup__9CC60B__Offset_Float.msg" "hyperLayout8.hyp[14].dn";
connectAttr "NodeGroup__9CC60B__Multiply_Position.msg" "hyperLayout8.hyp[15].dn"
		;
connectAttr "NodeGroup__9CC60B__FloatConstant_U.msg" "hyperLayout8.hyp[16].dn";
connectAttr "Offset_DRV_Joint_01.msg" "hyperLayout9.hyp[0].dn";
connectAttr "DRV_Joint_01.msg" "hyperLayout9.hyp[1].dn";
connectAttr "RestPosition_Joint_01.msg" "hyperLayout9.hyp[2].dn";
connectAttr "Offset_DRV_Joint_02.msg" "hyperLayout9.hyp[3].dn";
connectAttr "DRV_Joint_02.msg" "hyperLayout9.hyp[4].dn";
connectAttr "RestPosition_Joint_02.msg" "hyperLayout9.hyp[5].dn";
connectAttr "Offset_DRV_Joint_03.msg" "hyperLayout9.hyp[6].dn";
connectAttr "DRV_Joint_03.msg" "hyperLayout9.hyp[7].dn";
connectAttr "RestPosition_Joint_03.msg" "hyperLayout9.hyp[8].dn";
connectAttr "bezier_edge_in.msg" "hyperLayout9.hyp[9].dn";
connectAttr "bezier_edge_inShape.msg" "hyperLayout9.hyp[10].dn";
connectAttr "bezier_edge_out.msg" "hyperLayout9.hyp[11].dn";
connectAttr "bezier_edge_outShape.msg" "hyperLayout9.hyp[12].dn";
connectAttr "loftedSurface1.msg" "hyperLayout9.hyp[13].dn";
connectAttr "loftedSurfaceShape1.msg" "hyperLayout9.hyp[14].dn";
connectAttr "distanceBetween1.msg" "hyperLayout9.hyp[15].dn";
connectAttr "distanceBetween2.msg" "hyperLayout9.hyp[16].dn";
connectAttr "distanceBetween3.msg" "hyperLayout9.hyp[17].dn";
connectAttr "distanceBetween4.msg" "hyperLayout9.hyp[18].dn";
connectAttr "Clamp_Tangent_01_and_02.msg" "hyperLayout9.hyp[19].dn";
connectAttr "Clamp_Tangent_02_and_03.msg" "hyperLayout9.hyp[20].dn";
connectAttr "AutoScale_Influence_01_and_02.msg" "hyperLayout9.hyp[21].dn";
connectAttr "AutoScale_Influence_01_and_03.msg" "hyperLayout9.hyp[22].dn";
connectAttr "Offset_In.msg" "hyperLayout9.hyp[23].dn";
connectAttr "Offset_Out.msg" "hyperLayout9.hyp[24].dn";
connectAttr "Tangent_Scale_01_and_02.msg" "hyperLayout9.hyp[25].dn";
connectAttr "Tangent_Scale_02_and_03.msg" "hyperLayout9.hyp[26].dn";
connectAttr "Divide_01_and_02.msg" "hyperLayout9.hyp[27].dn";
connectAttr "Divide_02_and_03.msg" "hyperLayout9.hyp[28].dn";
connectAttr "floatMath1.msg" "hyperLayout9.hyp[29].dn";
connectAttr "floatMath2.msg" "hyperLayout9.hyp[30].dn";
connectAttr "Multiply_End_02.msg" "hyperLayout9.hyp[31].dn";
connectAttr "Multiply_Start_03.msg" "hyperLayout9.hyp[32].dn";
connectAttr "Tangent_Size_Multiplier_01_and_02.msg" "hyperLayout9.hyp[33].dn";
connectAttr "Tangent_Size_Multiplier_02_and_03.msg" "hyperLayout9.hyp[34].dn";
connectAttr "holdMatrix1.msg" "hyperLayout9.hyp[35].dn";
connectAttr "holdMatrix2.msg" "hyperLayout9.hyp[36].dn";
connectAttr "holdMatrix3.msg" "hyperLayout9.hyp[37].dn";
connectAttr "Handle_In_End_01.msg" "hyperLayout9.hyp[38].dn";
connectAttr "Handle_In_End_02.msg" "hyperLayout9.hyp[39].dn";
connectAttr "Handle_In_Mid_01.msg" "hyperLayout9.hyp[40].dn";
connectAttr "Handle_In_Mid_02.msg" "hyperLayout9.hyp[41].dn";
connectAttr "Handle_In_Mid_03.msg" "hyperLayout9.hyp[42].dn";
connectAttr "Handle_In_Start_02.msg" "hyperLayout9.hyp[43].dn";
connectAttr "Handle_In_Start_03.msg" "hyperLayout9.hyp[44].dn";
connectAttr "Handle_Out_End_01.msg" "hyperLayout9.hyp[45].dn";
connectAttr "Handle_Out_End_02.msg" "hyperLayout9.hyp[46].dn";
connectAttr "Handle_Out_Mid_01.msg" "hyperLayout9.hyp[47].dn";
connectAttr "Handle_Out_Mid_02.msg" "hyperLayout9.hyp[48].dn";
connectAttr "Handle_Out_Mid_03.msg" "hyperLayout9.hyp[49].dn";
connectAttr "Handle_Out_Start_02.msg" "hyperLayout9.hyp[50].dn";
connectAttr "Handle_Out_Start_03.msg" "hyperLayout9.hyp[51].dn";
connectAttr "Clamp_Tangent_01_and_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "bezier_edge_outShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "Tangent_Size_Multiplier_01_and_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "DRV_Joint_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "AutoScale_Influence_01_and_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "Clamp_Tangent_02_and_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "RestPosition_Joint_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "Handle_Out_Mid_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "bezier_edge_inShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "Offset_In.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "bezier_edge_in.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "distanceBetween2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "Handle_Out_Mid_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "distanceBetween1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "holdMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn";
connectAttr "Multiply_End_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "Handle_Out_Mid_01.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "RestPosition_Joint_01.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "Offset_Out.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn";
connectAttr "Multiply_Start_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "DRV_Joint_01.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "holdMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn";
connectAttr "Handle_In_Start_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "Tangent_Size_Multiplier_02_and_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "Handle_In_Mid_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "floatMath1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn";
connectAttr "DRV_Joint_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn";
connectAttr "Handle_Out_Start_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "bezier_edge_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "AutoScale_Influence_01_and_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "Handle_In_End_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "Handle_Out_Start_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn"
		;
connectAttr "Handle_In_Start_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn"
		;
connectAttr "Handle_In_Mid_01.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "RestPosition_Joint_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "Handle_In_End_01.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "Divide_02_and_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn"
		;
connectAttr "holdMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn";
connectAttr "Divide_01_and_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn"
		;
connectAttr "Handle_In_Mid_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "distanceBetween4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "distanceBetween3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "Tangent_Scale_01_and_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "Handle_Out_End_02.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn"
		;
connectAttr "Handle_Out_End_01.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[44].dn"
		;
connectAttr "Tangent_Scale_02_and_03.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[45].dn"
		;
connectAttr "__9CC60B__Multiply_Result_Zero.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "__9CC60B__Fix_U_Position_Overflow.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "__9CC60B__Multiply_Result_Negative.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "__9CC60B__FloatMath_Offset_Index.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "__9CC60B__FloatMath_Center_Single_Index.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "__9CC60B__Clamp_Result.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "__9CC60B__Shape_Axis_Start.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_X_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "__9CC60B__Overlay_Axis.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "Ribbon__9CC60B__Asset.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Z_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "__9CC60B__Shape_Axis_End.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn"
		;
connectAttr "|Ribbon__9CC60B__Asset|NodeGroup__9CC60B__Viewport_Display|__9CC60B__Overlay_Axis|__9CC60B__Overlay_Axis_Y_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn"
		;
connectAttr "__9CC60B__FloatConstant_V.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn"
		;
connectAttr "__9CC60B__Clamp_Chooser_Selector.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "__9CC60B__Chose_Single_Index_Offset.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn"
		;
connectAttr "__9CC60B__UVpin.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn"
		;
connectAttr "__9CC60B__Chose_Substract_or_Disable.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn"
		;
connectAttr "__9CC60B__Float_Reroute_Offset.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "__9CC60B__FloatMath_Center_Single_Index.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "__9CC60B__Clamp_Chooser_Selector.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "__9CC60B__Fix_U_Position_Overflow.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "__9CC60B__FloatMath_Offset_Index.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "hyperLayout1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn";
connectAttr "__9CC60B__Chose_Single_Index_Offset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "__9CC60B__Chose_Substract_or_Disable.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn"
		;
connectAttr "Ribbon__9CC60B__Asset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn"
		;
connectAttr "__9CC60B__Multiply_Result_Zero.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "__9CC60B__Multiply_Result_Negative.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn"
		;
connectAttr "__9CC60B__Float_Reroute_Offset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn"
		;
connectAttr "__9CC60B__Clamp_Result.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn"
		;
connectAttr "hyperLayout7.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "hyperLayout6.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "NodeView__9CC60B__Ribbon_Instances_Positions.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "__9CC60B__View_Overlay_10.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "hyperLayout3.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "NodeGroup__9CC60B__Multiply_Position.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "NodeGroup__9CC60B__Offset_Float.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "NodeGroup__9CC60B__System_Instance_Positions.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "NodeGroup__9CC60B__View_Overlay.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "__9CC60B__View_Overlay_20.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "hyperLayout2.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "hyperLayout5.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "NodeGroup__9CC60B__Overlay_Axis.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "__9CC60B__ReadMe_Notes.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "__9CC60B__View_Overlay_16.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "NodeGroup__9CC60B__Viewport_Display.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "hyperLayout8.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "__9CC60B__View_Overlay_05.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "__9CC60B__Clamp_Result.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[26].dn"
		;
connectAttr "__9CC60B__View_Overlay_27.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "__9CC60B__View_Overlay_25.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "__9CC60B__View_Overlay_30.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "__9CC60B__FloatConstant_U_01.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "__9CC60B__View_Overlay_07.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[31].dn"
		;
connectAttr "__9CC60B__View_Overlay_23.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[32].dn"
		;
connectAttr "__9CC60B__View_Overlay_03.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "__9CC60B__ReadMe_NotesShape.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "__9CC60B__View_Overlay_02.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "__9CC60B__FloatMath_Offset_Index.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[36].dn"
		;
connectAttr "__9CC60B__View_Overlay_09.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[37].dn"
		;
connectAttr "__9CC60B__Shape_Axis_Start.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "__9CC60B__View_Overlay_06.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "__9CC60B__View_Overlay_04.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "__9CC60B__View_Overlay_14.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "__9CC60B__View_Overlay_24.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[43].dn"
		;
connectAttr "__9CC60B__View_Overlay_12.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[46].dn"
		;
connectAttr "__9CC60B__View_Overlay_01.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[47].dn"
		;
connectAttr "__9CC60B__Float_Reroute_Multiply.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[48].dn"
		;
connectAttr "__9CC60B__View_Overlay_17.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[51].dn"
		;
connectAttr "__9CC60B__Clamp_Chooser_Selector.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[52].dn"
		;
connectAttr "__9CC60B__View_Overlay_15.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[53].dn"
		;
connectAttr "__9CC60B__View_Overlay_28.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[54].dn"
		;
connectAttr "__9CC60B__View_Overlay_21.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[55].dn"
		;
connectAttr "__9CC60B__View_Overlay_26.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[56].dn"
		;
connectAttr "__9CC60B__View_Overlay_13.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[57].dn"
		;
connectAttr "__9CC60B__View_Overlay_22.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[58].dn"
		;
connectAttr "__9CC60B__View_Overlay_11.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[59].dn"
		;
connectAttr "__9CC60B__View_Overlay_08.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[60].dn"
		;
connectAttr "__9CC60B__Chose_Single_Index_Offset.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[61].dn"
		;
connectAttr "NodeGroup__9CC60B__System_Ribbon.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[62].dn"
		;
connectAttr "hyperLayout9.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[63].dn"
		;
connectAttr "__9CC60B__View_Overlay_18.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[64].dn"
		;
connectAttr "__9CC60B__FloatConstant_U_03.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[65].dn"
		;
connectAttr "__9CC60B__View_Overlay_19.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[66].dn"
		;
connectAttr "__9CC60B__FloatMath_Center_Single_Index.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[67].dn"
		;
connectAttr "NodeGroup__9CC60B__FloatConstant_U.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[68].dn"
		;
connectAttr "hyperLayout4.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[69].dn"
		;
connectAttr "standardSurface2SG.pa" ":renderPartition.st" -na;
connectAttr "standardSurface2.msg" ":defaultShaderList1.s" -na;
connectAttr "Handle_In_Mid_01.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_In_End_01.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_In_End_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_In_Mid_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_In_Start_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Tangent_Scale_01_and_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "floatMath1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Divide_01_and_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Divide_02_and_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Multiply_End_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Tangent_Scale_02_and_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_In_Start_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Multiply_Start_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_In_Mid_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Tangent_Size_Multiplier_01_and_02.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Tangent_Size_Multiplier_02_and_03.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Clamp_Tangent_02_and_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Clamp_Tangent_01_and_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "AutoScale_Influence_01_and_02.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "AutoScale_Influence_01_and_03.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "Handle_Out_End_01.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_Out_End_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_Out_Mid_01.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_Out_Mid_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_Out_Mid_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_Out_Start_02.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Handle_Out_Start_03.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "holdMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "holdMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "holdMatrix3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Offset_In.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Offset_Out.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "__9CC60B__FloatConstant_U_01.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_02.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_03.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_04.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_05.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_06.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_07.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_08.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_09.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_10.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_11.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_12.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_13.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_14.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_15.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_16.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_17.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_18.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_19.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_20.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_21.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_22.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_23.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_24.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_25.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_26.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_27.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_28.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_29.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_30.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_31.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatConstant_U_32.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "__9CC60B__FloatMath_Divide_Total_U_Length_by_Count.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "floatMath2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "__9CC60B__Shape_Axis_Start.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "__9CC60B__Shape_Axis_End.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "__9CC60B__FloatConstant_V.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "__9CC60B__FloatMath_Offset_Index.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "__9CC60B__Chose_Single_Index_Offset.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "__9CC60B__FloatMath_Center_Single_Index.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "__9CC60B__Clamp_Chooser_Selector.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "__9CC60B__Clamp_Result.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "__9CC60B__Multiply_Result_Zero.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "__9CC60B__Chose_Substract_or_Disable.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "__9CC60B__Multiply_Result_Negative.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "__9CC60B__Fix_U_Position_Overflow.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "__9CC60B__Shape_Axis_End.oc" ":internal_standInShader.ic";
// End of Test_MatrixRibbon.ma
