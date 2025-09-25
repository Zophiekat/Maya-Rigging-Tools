//Maya ASCII 2024 scene
//Name: Component__FK_IK__002.ma
//Last modified: Fri, Sep 19, 2025 01:57:51 AM
//Codeset: UTF-8
requires maya "2024";
requires -nodeType "floatLogic" "lookdevKit" "1.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2024";
fileInfo "version" "2024";
fileInfo "cutIdentifier" "202310181224-69282f2959";
fileInfo "osv" "Mac OS X 15.6.1";
fileInfo "UUID" "7226D56A-714C-E898-6053-7792422EDADB";
fileInfo "exportedFrom" "/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools/_Rig_Components/Component__FK_IK.ma";
createNode transform -s -n "persp";
	rename -uid "791AB2CA-5B47-9357-402D-B7B3A2065FB9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 23.31850242557034 16.298672839706352 22.207048893231743 ;
	setAttr ".r" -type "double3" -13.538352730291228 408.1999999999731 -1.1929481395975773e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "1B2153B1-5448-00E4-6908-75BC7A86B79C";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 1000;
	setAttr ".coi" 32.781881972309961;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 2.1283051407916531e-06 8 3.1427242674908484e-07 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "E0BC6601-CC44-77A7-FBBE-FB837A3BC68A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "8500D3B4-134E-FFE4-35B6-338F282C8565";
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
	rename -uid "93E6CAE2-6049-5CC6-5803-7183BFC3DD62";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "4584B9F7-8945-10EA-ADFE-A99B40677C18";
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
	rename -uid "6F4F76E9-B44F-2985-A18F-0396D08A0132";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "78AD7532-BE45-4E01-69EF-5BAEA3A25555";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "Component__name__FK_IK__side__grp";
	rename -uid "E52DD3D8-794B-EB59-CA7E-3FA64BD74C33";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "DAG_Nodes__name__FK_IK__side__grp" -p "Component__name__FK_IK__side__grp";
	rename -uid "15E46A17-5C4F-4953-FB3F-C1942BA276AA";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "Setup_Positions__name__FK_IK__side__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "6B1F5C23-9C4C-03B1-5C56-97A2D07D4EFA";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".rp" -type "double3" 0 16 0 ;
	setAttr ".sp" -type "double3" 0 16 0 ;
createNode transform -n "Offset_Position__name__FK_IK_Upper__trs" -p "Setup_Positions__name__FK_IK__side__grp";
	rename -uid "DBC1F55D-0D42-AC3D-C0FB-19BE69F4079C";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 0 16 0 ;
	setAttr ".r" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
createNode transform -n "Position__name__FK_IK_Upper__side__pos" -p "Offset_Position__name__FK_IK_Upper__trs";
	rename -uid "DA5E3F88-8648-BF2C-4DAE-1BAC1C983755";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73710018 0 ;
	setAttr -cb on ".Line_Width_Circle" 2;
	setAttr -cb on ".Line_Width_Outline" 24;
	setAttr -cb on ".Line_Width_Axes" 12;
createNode nurbsCurve -n "Position__name__FK_Upper__side__outline1_Shape" -p "Position__name__FK_IK_Upper__side__pos";
	rename -uid "BC34E563-FA43-6AB6-F9C2-A294364F2F90";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1.125 1.25
		11
		0.14504563000000001 0 -0.14504563000000001
		0 0 -0.20512549999999999
		-0.14504563000000001 0 -0.14504563000000001
		-0.20512549999999999 0 0
		-0.14504563000000001 0 0.14504563000000001
		0 0 0.20512549999999996
		0.14504563000000001 0 0.14504562999999998
		0.20512549999999999 0 0
		0.14504563000000001 0 -0.14504563000000001
		0 0 -0.20512549999999999
		-0.14504563000000001 0 -0.14504563000000001
		;
createNode nurbsCurve -n "Position__name__FK_Upper__side__Axis_Y_Shape" -p "Position__name__FK_IK_Upper__side__pos";
	rename -uid "F290B989-1A46-623B-2825-CBAF62FA1AB6";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 1 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.7715611723760958e-16 1 0
		1.5543122344752192e-15 2 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_Upper__side__Axis_Z_Shape" -p "Position__name__FK_IK_Upper__side__pos";
	rename -uid "58DB36DB-864F-1AC6-B4FB-C088C48428A6";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4.4408920985006262e-16 0 1
		8.8817841970012523e-16 0 2
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_Upper__side__Axis_X_Shape" -p "Position__name__FK_IK_Upper__side__pos";
	rename -uid "7D5E98B4-F24E-3B07-CF16-DF898E8BED31";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1 0 0
		2 0 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_Upper__side__outline2_Shape" -p "Position__name__FK_IK_Upper__side__pos";
	rename -uid "0837578A-3C40-BD45-B8BC-2ABB90A51162";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		0.14504566999999999 -0.14504559 4.0000000000000001e-08
		0.20512549999999999 5.0000000001437783e-08 4.9999999999999998e-08
		0.14504559 0.14504566999999999 2.9999999999999997e-08
		-5.0000000001437783e-08 0.20512549999999999 -1e-08
		-0.14504566999999999 0.14504559 -4.0000000000000001e-08
		-0.20512549999999999 -5.0000000001437783e-08 -4.9999999999999998e-08
		-0.14504559 -0.14504566999999999 -3.0000000000000004e-08
		4.9999999999999998e-08 -0.20512549999999999 1e-08
		0.14504566999999999 -0.14504559 4.0000000000000001e-08
		0.20512549999999999 5.0000000001437783e-08 4.9999999999999998e-08
		0.14504559 0.14504566999999999 2.9999999999999997e-08
		;
createNode nurbsCurve -n "Position__name__FK_Upper__side__outline3_Shape" -p "Position__name__FK_IK_Upper__side__pos";
	rename -uid "B8D4EF23-954A-CE31-A68B-39A10ECF8B27";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		-4.0000000000000001e-08 0.14504566999999999 -0.1450456
		-4.9999999999999998e-08 0.20512549999999999 5.0000000001437783e-08
		-4.0000000000000001e-08 0.1450456 0.14504566999999999
		0 -5.0000000001437783e-08 0.20512549999999999
		4.0000000000000001e-08 -0.14504566999999999 0.1450456
		4.9999999999999998e-08 -0.20512550000000002 -5.0000000001437783e-08
		4.0000000000000001e-08 -0.1450456 -0.14504566999999999
		0 4.9999999999999998e-08 -0.20512549999999999
		-4.0000000000000001e-08 0.14504566999999999 -0.1450456
		-4.9999999999999998e-08 0.20512549999999999 5.0000000001437783e-08
		-4.0000000000000001e-08 0.1450456 0.14504566999999999
		;
createNode transform -n "Offset_Position__name__FK_IK_Lower__side__trs" -p "Setup_Positions__name__FK_IK__side__grp";
	rename -uid "87B9A9E9-5A45-FF37-AE2A-0CA008EBDDCB";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 2.1222508621576708e-06 8 3.1427299518327345e-07 ;
	setAttr ".r" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
createNode transform -n "Position__name__FK_IK_Lower__side__pos" -p "Offset_Position__name__FK_IK_Lower__side__trs";
	rename -uid "F3E26C9A-014C-A290-0733-52999C320EF6";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73710018 0 ;
	setAttr -cb on ".Line_Width_Circle" 2;
	setAttr -cb on ".Line_Width_Outline" 24;
	setAttr -cb on ".Line_Width_Axes" 12;
createNode nurbsCurve -n "Position__name__FK_Lower__side__outline1_Shape" -p "Position__name__FK_IK_Lower__side__pos";
	rename -uid "761C40A3-E44F-3E88-CCFC-8A834B8C86F3";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1.125 1.25
		11
		0.14504563000000001 0 -0.14504563000000001
		0 0 -0.20512549999999999
		-0.14504563000000001 0 -0.14504563000000001
		-0.20512549999999999 0 0
		-0.14504563000000001 0 0.14504563000000001
		0 0 0.20512549999999996
		0.14504563000000001 0 0.14504562999999998
		0.20512549999999999 0 0
		0.14504563000000001 0 -0.14504563000000001
		0 0 -0.20512549999999999
		-0.14504563000000001 0 -0.14504563000000001
		;
createNode nurbsCurve -n "Position__name__FK_Lower__side__Axis_Y_Shape" -p "Position__name__FK_IK_Lower__side__pos";
	rename -uid "A5B91373-5642-3421-3242-15A447E0713A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 1 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.7715611723760958e-16 1 0
		1.5543122344752192e-15 2 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_Lower__side__Axis_Z_Shape" -p "Position__name__FK_IK_Lower__side__pos";
	rename -uid "D0C9AD51-4A43-2544-1109-2D96F12E5C98";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4.4408920985006262e-16 0 1
		8.8817841970012523e-16 0 2
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_Lower__side__Axis_X_Shape" -p "Position__name__FK_IK_Lower__side__pos";
	rename -uid "2313478D-F049-0BBB-673C-69B922F82394";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1 0 0
		2 0 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_Lower__side__outline2_Shape" -p "Position__name__FK_IK_Lower__side__pos";
	rename -uid "7FF8365F-4A40-739D-3C36-059DED1D7450";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		0.14504566999999999 -0.14504559 4.0000000000000001e-08
		0.20512549999999999 5.0000000001437783e-08 4.9999999999999998e-08
		0.14504559 0.14504566999999999 2.9999999999999997e-08
		-5.0000000001437783e-08 0.20512549999999999 -1e-08
		-0.14504566999999999 0.14504559 -4.0000000000000001e-08
		-0.20512549999999999 -5.0000000001437783e-08 -4.9999999999999998e-08
		-0.14504559 -0.14504566999999999 -3.0000000000000004e-08
		4.9999999999999998e-08 -0.20512549999999999 1e-08
		0.14504566999999999 -0.14504559 4.0000000000000001e-08
		0.20512549999999999 5.0000000001437783e-08 4.9999999999999998e-08
		0.14504559 0.14504566999999999 2.9999999999999997e-08
		;
createNode nurbsCurve -n "Position__name__FK_Lower__side__outline3_Shape" -p "Position__name__FK_IK_Lower__side__pos";
	rename -uid "B2BD53B6-7E40-F28D-7EE7-988FA7C1F98B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		-4.0000000000000001e-08 0.14504566999999999 -0.1450456
		-4.9999999999999998e-08 0.20512549999999999 5.0000000001437783e-08
		-4.0000000000000001e-08 0.1450456 0.14504566999999999
		0 -5.0000000001437783e-08 0.20512549999999999
		4.0000000000000001e-08 -0.14504566999999999 0.1450456
		4.9999999999999998e-08 -0.20512550000000002 -5.0000000001437783e-08
		4.0000000000000001e-08 -0.1450456 -0.14504566999999999
		0 4.9999999999999998e-08 -0.20512549999999999
		-4.0000000000000001e-08 0.14504566999999999 -0.1450456
		-4.9999999999999998e-08 0.20512549999999999 5.0000000001437783e-08
		-4.0000000000000001e-08 0.1450456 0.14504566999999999
		;
createNode transform -n "Offset_Position__name__FK_IK_End__trs" -p "Setup_Positions__name__FK_IK__side__grp";
	rename -uid "630151FF-424E-FB2C-2626-1BA63EB7F73B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" -5.2802215932956642e-09 5.8175686490358203e-13 -5.9806076535551256e-08 ;
	setAttr ".r" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
createNode transform -n "Position__name__FK_IK_End__side__pos" -p "Offset_Position__name__FK_IK_End__trs";
	rename -uid "43ADF733-FB45-0957-6516-48870F674824";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73710018 0 ;
	setAttr -cb on ".Line_Width_Circle" -1;
	setAttr -cb on ".Line_Width_Outline" 24;
	setAttr -cb on ".Line_Width_Axes" 12;
createNode nurbsCurve -n "Position__name__FK_End__side__outline1_Shape" -p "Position__name__FK_IK_End__side__pos";
	rename -uid "5F674B50-DD43-2AA1-58CE-5CAFF1FC7EDD";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1.125 1.25
		11
		0.14504563000000001 0 -0.14504563000000001
		0 0 -0.20512549999999999
		-0.14504563000000001 0 -0.14504563000000001
		-0.20512549999999999 0 0
		-0.14504563000000001 0 0.14504563000000001
		0 0 0.20512549999999996
		0.14504563000000001 0 0.14504562999999998
		0.20512549999999999 0 0
		0.14504563000000001 0 -0.14504563000000001
		0 0 -0.20512549999999999
		-0.14504563000000001 0 -0.14504563000000001
		;
createNode nurbsCurve -n "Position__name__FK_End__side__Axis_Y_Shape" -p "Position__name__FK_IK_End__side__pos";
	rename -uid "31703AA8-F749-98B0-87BA-D49B9FA973F1";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 1 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.7715611723760958e-16 1 0
		1.5543122344752192e-15 2 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_End__side__Axis_Z_Shape" -p "Position__name__FK_IK_End__side__pos";
	rename -uid "03BC2711-AC47-2282-E494-6BAAEB99E2C5";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4.4408920985006262e-16 0 1
		8.8817841970012523e-16 0 2
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_End__side__Axis_X_Shape" -p "Position__name__FK_IK_End__side__pos";
	rename -uid "3D92DD88-404F-10CA-E7F2-55B3F157637B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1 0 0
		2 0 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__FK_End__side__outline2_Shape" -p "Position__name__FK_IK_End__side__pos";
	rename -uid "CD788BB2-E740-6F21-7571-8EB45C830F5A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		0.14504566999999999 -0.14504559 4.0000000000000001e-08
		0.20512549999999999 5.0000000001437783e-08 4.9999999999999998e-08
		0.14504559 0.14504566999999999 2.9999999999999997e-08
		-5.0000000001437783e-08 0.20512549999999999 -1e-08
		-0.14504566999999999 0.14504559 -4.0000000000000001e-08
		-0.20512549999999999 -5.0000000001437783e-08 -4.9999999999999998e-08
		-0.14504559 -0.14504566999999999 -3.0000000000000004e-08
		4.9999999999999998e-08 -0.20512549999999999 1e-08
		0.14504566999999999 -0.14504559 4.0000000000000001e-08
		0.20512549999999999 5.0000000001437783e-08 4.9999999999999998e-08
		0.14504559 0.14504566999999999 2.9999999999999997e-08
		;
createNode nurbsCurve -n "Position__name__FK_End__side__outline3_Shape" -p "Position__name__FK_IK_End__side__pos";
	rename -uid "8851528B-024B-3F88-F593-60B9D941AC39";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		-4.0000000000000001e-08 0.14504566999999999 -0.1450456
		-4.9999999999999998e-08 0.20512549999999999 5.0000000001437783e-08
		-4.0000000000000001e-08 0.1450456 0.14504566999999999
		0 -5.0000000001437783e-08 0.20512549999999999
		4.0000000000000001e-08 -0.14504566999999999 0.1450456
		4.9999999999999998e-08 -0.20512550000000002 -5.0000000001437783e-08
		4.0000000000000001e-08 -0.1450456 -0.14504566999999999
		0 4.9999999999999998e-08 -0.20512549999999999
		-4.0000000000000001e-08 0.14504566999999999 -0.1450456
		-4.9999999999999998e-08 0.20512549999999999 5.0000000001437783e-08
		-4.0000000000000001e-08 0.1450456 0.14504566999999999
		;
createNode transform -n "Offset_Position__name__IK_Pole__Side__trs" -p "Setup_Positions__name__FK_IK__side__grp";
	rename -uid "EF2B8EC4-5D42-E9A0-979F-778873531226";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 3.1427308044840174e-07 7.9999999999999991 11 ;
	setAttr ".r" -type "double3" 0 0 -89.999999999999957 ;
createNode transform -n "Position__name__IK_Pole__Side__trs" -p "Offset_Position__name__IK_Pole__Side__trs";
	rename -uid "28EB605C-EB4B-FEA1-FAD0-7486C8D92B6F";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73700005 0 ;
	setAttr -cb on ".Line_Width_Circle" -1;
	setAttr -cb on ".Line_Width_Outline" 24;
	setAttr -cb on ".Line_Width_Axes" 12;
createNode nurbsCurve -n "Position__name__IK_Pole__Side__outline1_Shape" -p "Position__name__IK_Pole__Side__trs";
	rename -uid "1D3992E4-DB46-F27B-EF8B-C8B595356B9D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.14504563315678379 7.9498986767122566e-16 -0.14504563315678312
		4.1666522582395718e-16 7.9866869859870087e-16 -0.20512550157331585
		-0.14504563315678295 7.9498986767122566e-16 -0.14504563315678332
		-0.20512550157331558 7.8610838415243795e-16 -5.8768299999062231e-17
		-0.14504563315678295 7.7722690063365023e-16 0.1450456331567832
		3.7825927598214538e-16 7.7354806970617532e-16 0.20512550157331585
		0.14504563315678348 7.7722690063365023e-16 0.14504563315678332
		0.2051255015733161 7.8610838415243795e-16 1.1084524556243675e-16
		0.14504563315678379 7.9498986767122566e-16 -0.14504563315678312
		4.1666522582395718e-16 7.9866869859870087e-16 -0.20512550157331585
		-0.14504563315678295 7.9498986767122566e-16 -0.14504563315678332
		;
createNode nurbsCurve -n "Position__name__IK_Pole__Side__Axis_Y_Shape" -p "Position__name__IK_Pole__Side__trs";
	rename -uid "C591BE5B-8C40-3E3D-27F4-6792EE009F5B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 1 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.7715611723760958e-16 1 0
		1.5543122344752192e-15 2 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__IK_Pole__Side__Axis_Z_Shape" -p "Position__name__IK_Pole__Side__trs";
	rename -uid "1E2741A4-3147-D3F2-F8D6-5A843C0E7035";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4.4408920985006262e-16 0 1
		8.8817841970012523e-16 0 2
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__IK_Pole__Side__Axis_X_Shape" -p "Position__name__IK_Pole__Side__trs";
	rename -uid "69161B05-FA47-5607-A392-6DAD17CCC777";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0 0 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1 0 0
		2 0 0
		;
	setAttr ".adot" yes;
createNode nurbsCurve -n "Position__name__IK_Pole__Side__outline2_Shape" -p "Position__name__IK_Pole__Side__trs";
	rename -uid "E737D951-7A46-6CF0-5BC9-798CD2954E07";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.14504567163467694 -0.1450455946788741 3.854236067231489e-08
		0.20512550157330364 5.441597382851239e-08 4.6448953604314534e-08
		0.14504559467887287 0.14504567163468235 2.7146379472945345e-08
		-5.4415970616255862e-08 0.2051255015733095 -8.0581755843486127e-09
		-0.14504567163467635 0.14504559467887534 -3.8542360672314903e-08
		-0.20512550157330314 -5.4415972256295613e-08 -4.644895360431456e-08
		-0.14504559467887218 -0.14504567163468071 -2.7146379472945348e-08
		5.4415971444314027e-08 -0.20512550157330756 8.058175584348611e-09
		0.14504567163467694 -0.1450455946788741 3.854236067231489e-08
		0.20512550157330364 5.441597382851239e-08 4.6448953604314534e-08
		0.14504559467887287 0.14504567163468235 2.7146379472945345e-08
		;
createNode nurbsCurve -n "Position__name__IK_Pole__Side__outline3_Shape" -p "Position__name__IK_Pole__Side__trs";
	rename -uid "18B13EF9-8E46-70BF-222C-2182F4B4D544";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-3.8477903761955305e-08 0.14504566649173789 -0.14504559982181686
		-5.4415973395675695e-08 0.20512550157330406 4.7142756384737441e-08
		-3.8477903761955305e-08 0.14504559982181275 0.14504566649174225
		4.4006759285974977e-16 -4.7142755516458367e-08 0.20512550157331036
		3.8477904642090438e-08 -0.14504566649173617 0.14504559982181686
		5.4415974672480474e-08 -0.20512550157330253 -4.7142756299526728e-08
		3.8477904642090438e-08 -0.14504559982181095 -0.14504566649174208
		4.4006759285974977e-16 4.7142757036598175e-08 -0.20512550157331036
		-3.8477903761955305e-08 0.14504566649173789 -0.14504559982181686
		-5.4415973395675695e-08 0.20512550157330406 4.7142756384737441e-08
		-3.8477903761955305e-08 0.14504559982181275 0.14504566649174225
		;
createNode transform -n "Viewer_Curves__name_FK_IK__side__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "E102804C-2B4D-3262-C9AF-A19AC29353A5";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
createNode transform -n "Viewer__name__FK_Upper__side__crv" -p "Viewer_Curves__name_FK_IK__side__grp";
	rename -uid "A59C512B-134F-1CDD-075E-94944660FF8B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.55199999 0.28979999 0.1904 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name__FK_Upper__side__crvShape" -p "Viewer__name__FK_Upper__side__crv";
	rename -uid "EE7E19E9-AD4A-56D5-07FB-08B0695602F4";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 1 2 3 4 5 6 7 8 9 10 11 12 13
		14
		-0.49999999999999983 -1.4901161179969868e-08 0
		6.3329935087730327e-08 -0.49999999999999994 0.5
		3.9999999999999996 2.2351741790771484e-08 -2.384185791015625e-07
		6.3329935087730327e-08 -0.49999999999999994 -0.5
		-0.49999999999999983 -1.4901161179969868e-08 0
		6.3329935046096963e-08 0.49999999999999989 -0.5
		3.9999999999999996 2.2351741790771484e-08 -2.384185791015625e-07
		6.3329935046096963e-08 0.49999999999999989 0.5
		-0.49999999999999983 -1.4901161179969868e-08 0
		6.3329935087730327e-08 -0.49999999999999994 0.5
		6.3329935087730327e-08 -0.49999999999999994 -0.5
		6.3329935046096963e-08 0.49999999999999989 -0.5
		6.3329935046096963e-08 0.49999999999999989 0.5
		6.3329935087730327e-08 -0.49999999999999994 0.5
		;
createNode transform -n "Viewer__name__FK_Lower__side__crv" -p "Viewer_Curves__name_FK_IK__side__grp";
	rename -uid "12EE772E-7C49-F28A-41EE-F789F29411E0";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.55199999 0.28979999 0.1904 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name__FK_Lower__side__crvShape" -p "Viewer__name__FK_Lower__side__crv";
	rename -uid "8D79753C-3149-DD0A-9937-E1ABD1B96F17";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 0.076923076923076927 0.15384615384615385 0.23076923076923078 0.30769230769230771
		 0.38461538461538464 0.46153846153846156 0.53846153846153844 0.61538461538461542 0.69230769230769229
		 0.76923076923076927 0.84615384615384615 0.92307692307692313 1
		14
		-0.5 -9.9999999947364415e-09 0
		6.00000000239298e-08 -0.5 0.5
		4 1.9999999989472883e-08 -2.399999999846969e-07
		5.9999999968418649e-08 -0.5 -0.5
		-0.5 -9.9999999392252903e-09 0
		5.9999999968418649e-08 0.5 -0.5
		4 2.0000000100495186e-08 -2.4000000001245247e-07
		5.9999999996174225e-08 0.5 0.5
		-0.5 -9.9999999392252903e-09 0
		6.0000000003113119e-08 -0.5 0.5
		5.9999999996174225e-08 -0.5 -0.5
		5.9999999996174225e-08 0.5 -0.5
		6.0000000003113119e-08 0.5 0.5
		6.00000000239298e-08 -0.5 0.5
		;
createNode transform -n "Viewer__name__FK_End__side__crv" -p "Viewer_Curves__name_FK_IK__side__grp";
	rename -uid "97722DB1-7B4B-F3E8-C54D-E0BEAD16CA6A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.55199999 0.28979999 0.1904 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name__FK_End__side__crvShape" -p "Viewer__name__FK_End__side__crv";
	rename -uid "8DA40F92-BA46-1C46-751A-1CA27353F61D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 0.076923076923076927 0.15384615384615385 0.23076923076923078 0.30769230769230771
		 0.38461538461538464 0.46153846153846156 0.53846153846153844 0.61538461538461542 0.69230769230769229
		 0.76923076923076927 0.84615384615384615 0.92307692307692313 1
		14
		-0.5 -9.9999999947364415e-09 0
		6.00000000239298e-08 -0.5 0.5
		4 1.9999999989472883e-08 -2.399999999846969e-07
		5.9999999968418649e-08 -0.5 -0.5
		-0.5 -9.9999999392252903e-09 0
		5.9999999968418649e-08 0.5 -0.5
		4 2.0000000100495186e-08 -2.4000000001245247e-07
		5.9999999996174225e-08 0.5 0.5
		-0.5 -9.9999999392252903e-09 0
		6.0000000003113119e-08 -0.5 0.5
		5.9999999996174225e-08 -0.5 -0.5
		5.9999999996174225e-08 0.5 -0.5
		6.0000000003113119e-08 0.5 0.5
		6.00000000239298e-08 -0.5 0.5
		;
createNode transform -n "Viewer__name__IK_Upper__side__crv" -p "Viewer_Curves__name_FK_IK__side__grp";
	rename -uid "58A63B1A-6048-D164-C00E-009D62A45F09";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.95498258 0.26899999 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name__IK_Upper__side__crvShape" -p "Viewer__name__IK_Upper__side__crv";
	rename -uid "EEA10420-3F41-43A5-D998-3DA8246925C5";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 0.076923076923076927 0.15384615384615385 0.23076923076923078 0.30769230769230771
		 0.38461538461538464 0.46153846153846156 0.53846153846153844 0.61538461538461542 0.69230769230769229
		 0.76923076923076927 0.84615384615384615 0.92307692307692313 1
		14
		-0.5 -9.9999999947364415e-09 0
		6.00000000239298e-08 -0.5 0.5
		4 1.9999999989472883e-08 -2.399999999846969e-07
		5.9999999968418649e-08 -0.5 -0.5
		-0.5 -9.9999999392252903e-09 0
		5.9999999968418649e-08 0.5 -0.5
		4 2.0000000100495186e-08 -2.4000000001245247e-07
		5.9999999996174225e-08 0.5 0.5
		-0.5 -9.9999999392252903e-09 0
		6.0000000003113119e-08 -0.5 0.5
		5.9999999996174225e-08 -0.5 -0.5
		5.9999999996174225e-08 0.5 -0.5
		6.0000000003113119e-08 0.5 0.5
		6.00000000239298e-08 -0.5 0.5
		;
createNode transform -n "Viewer__name__IK_Lower__side__crv" -p "Viewer_Curves__name_FK_IK__side__grp";
	rename -uid "22B913F3-5D49-7A56-CB6F-6C9AA0D6C48F";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.95498258 0.26899999 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name__IK_Lower__side__crvShape" -p "Viewer__name__IK_Lower__side__crv";
	rename -uid "D072BF08-4C4A-9AEA-0084-F6BE618E1FAC";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 0.076923076923076927 0.15384615384615385 0.23076923076923078 0.30769230769230771
		 0.38461538461538464 0.46153846153846156 0.53846153846153844 0.61538461538461542 0.69230769230769229
		 0.76923076923076927 0.84615384615384615 0.92307692307692313 1
		14
		-0.5 -9.9999999947364415e-09 0
		6.00000000239298e-08 -0.5 0.5
		4 1.9999999989472883e-08 -2.399999999846969e-07
		5.9999999968418649e-08 -0.5 -0.5
		-0.5 -9.9999999392252903e-09 0
		5.9999999968418649e-08 0.5 -0.5
		4 2.0000000100495186e-08 -2.4000000001245247e-07
		5.9999999996174225e-08 0.5 0.5
		-0.5 -9.9999999392252903e-09 0
		6.0000000003113119e-08 -0.5 0.5
		5.9999999996174225e-08 -0.5 -0.5
		5.9999999996174225e-08 0.5 -0.5
		6.0000000003113119e-08 0.5 0.5
		6.00000000239298e-08 -0.5 0.5
		;
createNode transform -n "Viewer__name__IK_End__side__crv" -p "Viewer_Curves__name_FK_IK__side__grp";
	rename -uid "0F97F34B-EF47-8AF5-96A3-388FF9A395D7";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.95498258 0.26899999 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name__IK_End__side__crvShape" -p "Viewer__name__IK_End__side__crv";
	rename -uid "92B9E2E8-724A-DE5D-E266-A19C37CE7522";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 0.076923076923076927 0.15384615384615385 0.23076923076923078 0.30769230769230771
		 0.38461538461538464 0.46153846153846156 0.53846153846153844 0.61538461538461542 0.69230769230769229
		 0.76923076923076927 0.84615384615384615 0.92307692307692313 1
		14
		-0.5 -9.9999999947364415e-09 0
		6.00000000239298e-08 -0.5 0.5
		4 1.9999999989472883e-08 -2.399999999846969e-07
		5.9999999968418649e-08 -0.5 -0.5
		-0.5 -9.9999999392252903e-09 0
		5.9999999968418649e-08 0.5 -0.5
		4 2.0000000100495186e-08 -2.4000000001245247e-07
		5.9999999996174225e-08 0.5 0.5
		-0.5 -9.9999999392252903e-09 0
		6.0000000003113119e-08 -0.5 0.5
		5.9999999996174225e-08 -0.5 -0.5
		5.9999999996174225e-08 0.5 -0.5
		6.0000000003113119e-08 0.5 0.5
		6.00000000239298e-08 -0.5 0.5
		;
createNode transform -n "Controls__name__FK__side__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "77E01D92-E94F-90AD-8370-DB9AA724CB9D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "Offset__CTR__name__FK_Upper__side__trs" -p "Controls__name__FK__side__grp";
	rename -uid "CBB62E44-084A-C06B-AE9A-8E85C6AA4DF7";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "CTR__name__FK_Upper__side__crv" -p "Offset__CTR__name__FK_Upper__side__trs";
	rename -uid "5FE8B595-754A-F6D4-5B47-A6A32F297948";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
	setAttr ".opm" -type "matrix" 1 -2.9353096186994082e-23 0 0 -2.9353100920159513e-23 1 0 0
		 0 0 1 0 4.6964961472255222e-22 0 0 1;
createNode nurbsCurve -n "CTR__name__FK_Upper__side__crvShape" -p "CTR__name__FK_Upper__side__crv";
	rename -uid "55DDE38F-574E-AD03-0E56-0CA845D64A58";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0 1.9997069425898424 -1.9997069425898457
		-2.9394479369392778e-32 2.8280126789821938 3.2264243201258943e-16
		-1.3238096633474705e-16 1.9997069425898428 1.9997069425898428
		-3.9714289900424114e-16 1.0131426935024738e-15 2.8280126789821942
		6.6190483167373524e-17 -1.9997069425898426 1.9997069425898435
		5.8788958738785556e-32 -2.8280126789821942 8.5213541200746228e-16
		3.3095241583686757e-16 -1.9997069425898431 -1.9997069425898422
		3.9714289900424114e-16 -1.3252757561586967e-15 -2.8280126789821942
		0 1.9997069425898424 -1.9997069425898457
		-2.9394479369392778e-32 2.8280126789821938 3.2264243201258943e-16
		-1.3238096633474705e-16 1.9997069425898428 1.9997069425898428
		;
createNode joint -n "CTR__name__FK_Upper__side__jnt" -p "CTR__name__FK_Upper__side__crv";
	rename -uid "098BC71B-E045-E03A-E02E-6ABEFC73D52E";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Offset_CTR__name__FK_Lower__side__trs" -p "Controls__name__FK__side__grp";
	rename -uid "DE257BB2-0943-C50F-5FAC-DA8C994A6128";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 2.1283051410136977e-06 8 3.1427242674908484e-07 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000028 ;
createNode transform -n "CTR__name__FK_Lower__side__crv" -p "Offset_CTR__name__FK_Lower__side__trs";
	rename -uid "EF62E445-2841-74AB-491B-5C9D148B851D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
createNode nurbsCurve -n "CTR__name__FK_Lower__side__crvShape" -p "CTR__name__FK_Lower__side__crv";
	rename -uid "22C9521E-704A-080C-ACE1-5AA9E1E9F6E2";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		0 1.9997069400000003 -1.9997069400000003
		0 2.8280126800000001 0
		0 1.99970694 1.99970694
		0 0 2.8280126800000001
		0 -1.99970694 1.99970694
		0 -2.8280126800000005 0
		0 -1.9997069400000003 -1.99970694
		0 0 -2.8280126800000001
		0 1.9997069400000003 -1.9997069400000003
		0 2.8280126800000001 0
		0 1.99970694 1.99970694
		;
createNode joint -n "CTR__name__FK_Lower__side__jnt" -p "CTR__name__FK_Lower__side__crv";
	rename -uid "2B7E2416-1A4A-7867-FA2C-028C33DAFB2A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Offset_CTR__name__FK_End__side__trs" -p "Controls__name__FK__side__grp";
	rename -uid "5ADE2F01-7D4A-F1FC-0BFF-F19A2E99886A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".r" -type "double3" 0 0 -90.000000000000057 ;
createNode transform -n "CTR__name__FK_End__side__crv" -p "Offset_CTR__name__FK_End__side__trs";
	rename -uid "B5992740-614C-09BC-24D8-309D4F4B3360";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
createNode nurbsCurve -n "CTR__name__FK_End__side__crvShape" -p "CTR__name__FK_End__side__crv";
	rename -uid "3C362635-2847-3C0E-2B92-678DF1872079";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -0.25 -0.125 0 0.125 0.25 0.37500000000000006 0.5 0.625 0.75000000000000011
		 0.875 1 1.125 1.25
		11
		0 1.9997069400000003 -1.9997069400000003
		0 2.8280126800000001 0
		0 1.99970694 1.99970694
		0 0 2.8280126800000001
		0 -1.99970694 1.99970694
		0 -2.8280126800000005 0
		0 -1.9997069400000003 -1.99970694
		0 0 -2.8280126800000001
		0 1.9997069400000003 -1.9997069400000003
		0 2.8280126800000001 0
		0 1.99970694 1.99970694
		;
createNode joint -n "CTR__name__FK_End__side__jnt" -p "CTR__name__FK_End__side__crv";
	rename -uid "5743C472-E645-F499-6010-15A3120DDC66";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Controls__name__IK__side__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "5BB1C89F-0947-0123-5BE3-0C811BE32048";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "Offset_CTR__name__IK__side__crv_trs" -p "Controls__name__IK__side__grp";
	rename -uid "EFDA4A0E-7C4F-5671-9467-B0B54121D8B9";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 5.8550703857038747e-13 5.2802351357266218e-09 5.9806075339864777e-08 ;
createNode transform -n "CTR__name__IK__side__crv" -p "Offset_CTR__name__IK__side__crv_trs";
	rename -uid "97A43F1B-7A41-A336-0267-AC95B58BC57B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
	setAttr ".rp" -type "double3" 5.8556254972161893e-13 5.2802351357266086e-09 5.9806075339864791e-08 ;
	setAttr ".sp" -type "double3" 5.8556254972161893e-13 5.2802351357266086e-09 5.9806075339864791e-08 ;
createNode nurbsCurve -n "CTR__name__IK__side__crvShape" -p "CTR__name__IK__side__crv";
	rename -uid "3F08E607-C24D-EE7E-0CE9-04A14679D6B7";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 2 no 3
		5 0 0.25 0.5 0.75 1
		5
		5.8530957858238253e-13 2.6432479847349506 -2.6432479196486405
		5.8575366779223259e-13 -2.6432479741744808 -2.6432479196486405
		5.8575366779223259e-13 -2.6432479741744808 2.6432480392607909
		5.8530957858238253e-13 2.6432479847349506 2.6432480392607887
		5.8530957858238253e-13 2.6432479847349506 -2.6432479196486405
		;
createNode joint -n "CTR__name__IK__side__jnt" -p "CTR__name__IK__side__crv";
	rename -uid "508CAAAA-2448-BC76-7EE3-F6A2CE9B7E5F";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".t" -type "double3" 5.8556254972161893e-13 5.2802351357266086e-09 5.9806075339864791e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Offset_CTR__name__IK_Pole__side__crv_trs" -p "Controls__name__IK__side__grp";
	rename -uid "1AFE0480-D64A-A363-9FC7-F4A14EB96CB0";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "CTR__name__IK_Pole__side__crv" -p "Offset_CTR__name__IK_Pole__side__crv_trs";
	rename -uid "D6482A24-3C44-112E-4279-B7AA04EA41AF";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.38600004 0.82299018 2 ;
	setAttr ".rp" -type "double3" 8.8817841970012523e-16 0 0 ;
	setAttr ".sp" -type "double3" 8.8817841970012523e-16 0 0 ;
createNode nurbsCurve -n "CTR__name__K_Pole__side__crvShape" -p "CTR__name__IK_Pole__side__crv";
	rename -uid "CB5A9673-534B-0B4F-ED50-11A0CB90F221";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode joint -n "CTR__name__IK_Pole__side__jnt" -p "CTR__name__IK_Pole__side__crv";
	rename -uid "8EBB4945-7B46-7DC3-CA22-2D9E52B55E20";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.1805546814635168e-15 ;
	setAttr ".bps" -type "matrix" 7.7715611723760958e-16 -1 0 0 1 7.7715611723760958e-16 0 0
		 0 0 1 0 3.1427308044840174e-07 8 11 1;
	setAttr ".radi" 0.7;
createNode nurbsCurve -n "CTR__name__IK_Pole__side__crvShapeOrig" -p "CTR__name__IK_Pole__side__crv";
	rename -uid "FE4B47F8-EF4B-81AF-F024-279CFA19DB9F";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "Relationship_Line";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 1 "cv[0]";
	setAttr ".gtag[1].gtagnm" -type "string" "Relationship_Diamond";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 1 "cv[1:13]";
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 1 2 3 4 5 6 7 8 9 10 11 12 13
		14
		-3.142730786720449e-07 0 -11
		-2.5466843389665428e-07 0 -0.96729946136474609
		-0.96729894117279791 0 0
		-3.7387772344743553e-07 0 0.96729946136474609
		0.96729831262664145 -8.8817841970012523e-16 0
		-2.5466843389665428e-07 0 -0.96729946136474609
		-3.1427307689568806e-07 1.0259760618209839 0
		0.96729831262664145 -8.8817841970012523e-16 0
		-3.142730786720449e-07 -1.025976300239563 0
		-0.96729894117279791 0 0
		-3.1427307689568806e-07 1.0259760618209839 0
		-3.7387772344743553e-07 0 0.96729946136474609
		-3.142730786720449e-07 -1.025976300239563 0
		-2.5466843389665428e-07 0 -0.96729946136474609
		

		"gtag" 2
		"Relationship_Diamond" 1 "cv[1:13]"
		"Relationship_Line" 1 "cv[0]";
createNode transform -n "Properties__name__FK_IK__side__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "072A531C-2444-B2AF-6FD8-C39AA470B5FD";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 0 20 0 ;
	setAttr ".r" -type "double3" 90.000000000000057 0 0 ;
createNode transform -n "CTR__name__FK_IK__side__Properties__crv" -p "Properties__name__FK_IK__side__grp";
	rename -uid "033C4B11-B04E-31B8-58F8-1490960445A0";
	addAttr -ci true -sn "FK_IK_Switch" -ln "FK_IK_Switch" -nn "FK <> IK" -min 0 -max 
		10 -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.44200003 0.88940561 2 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".FK_IK_Switch";
createNode nurbsCurve -n "CTR__name__FK_IK__side__Properties__crvShape" -p "CTR__name__FK_IK__side__Properties__crv";
	rename -uid "A6239A07-644B-7B97-84D7-FD8CDC213006";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 36 2 no 3
		37 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36
		37
		7.7715611723760958e-16 0 1.75
		1.0915527343750009 0 1.75
		1.1890878677368173 0 1.7403936088085175
		1.2828750610351571 0 1.7119435667991638
		1.3693103790283212 0 1.6657432317733765
		1.4450712203979501 0 1.60356804728508
		1.5072460174560556 0 1.5278073251247406
		1.5534467697143559 0 1.4413725882768631
		1.5818967819213872 0 1.3475854098796844
		1.5915031433105473 0 1.25
		1.5818967819213872 0 1.1524145901203156
		1.5534467697143559 0 1.0586274117231369
		1.5072460174560551 0 0.9721926748752594
		1.4450712203979497 0 0.89643195271492004
		1.3693103790283208 0 0.83425676822662354
		1.2828750610351567 0 0.78805643320083618
		1.1890878677368169 0 0.75960639119148254
		1.0915527343750004 0 0.75
		3.3306690738754696e-16 0 0.75
		-1.0915532112121578 0 0.75
		-1.1890888214111324 0 0.75960639119148254
		-1.282875537872314 0 0.78805643320083618
		-1.3693103790283199 0 0.83425676822662354
		-1.4450712203979488 0 0.89643195271492004
		-1.5072464942932124 0 0.9721926748752594
		-1.553446769714355 0 1.0586274117231369
		-1.5818967819213863 0 1.1524145901203156
		-1.5915031433105464 0 1.25
		-1.5818967819213863 0 1.3475854098796844
		-1.553446769714355 0 1.4413725882768631
		-1.507246494293212 0 1.5278073251247406
		-1.4450712203979483 0 1.60356804728508
		-1.3693103790283194 0 1.6657432317733765
		-1.2828755378723136 0 1.7119435667991638
		-1.1890888214111319 0 1.7403936088085175
		-1.0915532112121573 0 1.75
		7.7715611723760958e-16 0 1.75
		;
createNode nurbsCurve -n "CTR__name__FK_IK__side__Properties__crvShape1" -p "CTR__name__FK_IK__side__Properties__crv";
	rename -uid "4C1F12C2-8B4C-F4F0-646C-A59CCF5BA530";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 36 2 no 3
		37 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36
		37
		-3.3306690738754696e-16 0 -0.75
		1.0915527343749996 0 -0.75
		1.189087867736816 0 -0.75960639119148254
		1.2828750610351558 0 -0.78805643320083618
		1.3693103790283199 0 -0.83425676822662354
		1.4450712203979488 0 -0.89643195271492004
		1.5072460174560542 0 -0.9721926748752594
		1.553446769714355 0 -1.0586274117231369
		1.5818967819213863 0 -1.1524145901203156
		1.5915031433105464 0 -1.25
		1.5818967819213863 0 -1.3475854098796844
		1.553446769714355 0 -1.4413725882768631
		1.5072460174560538 0 -1.5278073251247406
		1.4450712203979483 0 -1.60356804728508
		1.3693103790283194 0 -1.6657432317733765
		1.2828750610351554 0 -1.7119435667991638
		1.1890878677368155 0 -1.7403936088085175
		1.0915527343749991 0 -1.75
		-7.7715611723760958e-16 0 -1.75
		-1.0915532112121591 0 -1.75
		-1.1890888214111337 0 -1.7403936088085175
		-1.2828755378723153 0 -1.7119435667991638
		-1.3693103790283212 0 -1.6657432317733765
		-1.4450712203979501 0 -1.60356804728508
		-1.5072464942932138 0 -1.5278073251247406
		-1.5534467697143559 0 -1.4413725882768631
		-1.5818967819213872 0 -1.3475854098796844
		-1.5915031433105473 0 -1.25
		-1.5818967819213872 0 -1.1524145901203156
		-1.5534467697143559 0 -1.0586274117231369
		-1.5072464942932133 0 -0.9721926748752594
		-1.4450712203979497 0 -0.89643195271492004
		-1.3693103790283208 0 -0.83425676822662354
		-1.2828755378723149 0 -0.78805643320083618
		-1.1890888214111333 0 -0.75960639119148254
		-1.0915532112121586 0 -0.75
		-3.3306690738754696e-16 0 -0.75
		;
createNode nurbsCurve -n "CTR__name__FK_IK__side__Properties__crvShfape2" -p "CTR__name__FK_IK__side__Properties__crv";
	rename -uid "8D821F56-9C46-D2F2-9231-1680A0B1D6C6";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 36 2 no 3
		37 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36
		37
		2.2204460492503131e-16 0 0.5
		1.091552734375 0 0.5
		1.1890878677368164 0 0.49039360880851746
		1.2828750610351562 0 0.46194356679916382
		1.3693103790283203 0 0.41574323177337646
		1.4450712203979492 0 0.35356804728507996
		1.5072460174560547 0 0.2778073251247406
		1.5534467697143555 0 0.1913725882768631
		1.5818967819213867 0 0.097585409879684448
		1.5915031433105469 0 0
		1.5818967819213867 0 -0.097585409879684448
		1.5534467697143555 0 -0.1913725882768631
		1.5072460174560547 0 -0.2778073251247406
		1.4450712203979492 0 -0.35356804728507996
		1.3693103790283203 0 -0.41574323177337646
		1.2828750610351562 0 -0.46194356679916382
		1.1890878677368164 0 -0.49039360880851746
		1.0915527343749996 0 -0.5
		-2.2204460492503131e-16 0 -0.5
		-1.0915532112121586 0 -0.5
		-1.1890888214111328 0 -0.49039360880851746
		-1.2828755378723145 0 -0.46194356679916382
		-1.3693103790283203 0 -0.41574323177337646
		-1.4450712203979492 0 -0.35356804728507996
		-1.5072464942932129 0 -0.2778073251247406
		-1.5534467697143555 0 -0.1913725882768631
		-1.5818967819213867 0 -0.097585409879684448
		-1.5915031433105469 0 0
		-1.5818967819213867 0 0.097585409879684448
		-1.5534467697143555 0 0.1913725882768631
		-1.5072464942932129 0 0.2778073251247406
		-1.4450712203979492 0 0.35356804728507996
		-1.3693103790283203 0 0.41574323177337646
		-1.2828755378723145 0 0.46194356679916382
		-1.1890888214111328 0 0.49039360880851746
		-1.0915532112121582 0 0.5
		2.2204460492503131e-16 0 0.5
		;
createNode transform -n "System__name__FK_IK__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "C9A955FD-454D-DA3D-9262-6B85D40A7663";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode joint -n "DRV__name__FK_Upper__side__jnt" -p "System__name__FK_IK__grp";
	rename -uid "4960B015-9041-5EA5-139F-B78594909370";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "DRV__name__FK_Lower__side__jnt" -p "DRV__name__FK_Upper__side__jnt";
	rename -uid "61E3665B-584A-06E7-F6E2-8BBB8D8ABAAC";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "DRV__name__FK_End__side__jnt" -p "DRV__name__FK_Lower__side__jnt";
	rename -uid "64104A69-D249-8A24-F3D0-4FBCFDFE0537";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".opm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -1.2575833298502675e-15 0 0 1;
	setAttr ".jo" -type "double3" 0 0 89.999999999999986 ;
	setAttr ".radi" 0.5;
createNode parentConstraint -n "DRV__name__FK_End__side__jnt_parentConstraint1" -p
		 "DRV__name__FK_End__side__jnt";
	rename -uid "C76F02C7-AC43-2493-8191-4C862D809845";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "CTR_name_FK_End_L_jntW0" -dv 1 -min 
		0 -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0 0 -89.999999999999986 ;
	setAttr ".rst" -type "double3" 8.0000000000000018 4.0714871883504847e-15 0 ;
	setAttr ".rsrr" -type "double3" 0 0 -89.999999999999986 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "DRV__name__FK_Lower__side__jnt_parentConstraint1" 
		-p "DRV__name__FK_Lower__side__jnt";
	rename -uid "263C3261-7C4B-C9B5-09CE-3DACB71520F5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "CTR_name_FK_Lower_L_jntW0" -dv 1 
		-min 0 -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.2974150449139815e-05 2.2508110660328033e-06 -1.5199502566160084e-05 ;
	setAttr ".rst" -type "double3" 0 5.3290705182007514e-15 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "DRV__name__FK_Upper__side__jnt_parentConstraint1" 
		-p "DRV__name__FK_Upper__side__jnt";
	rename -uid "E3DDD92C-E246-C9ED-8805-E3BA9BBC50F1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "CTR_name_FK_Upper_L_jntW0" -dv 1 
		-min 0 -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
	setAttr ".rst" -type "double3" 0 16 0 ;
	setAttr ".rsrr" -type "double3" 0 0 -90.000000000000057 ;
	setAttr -k on ".w0";
createNode joint -n "PRN__name__FK_IK_Upper__side__jnt" -p "System__name__FK_IK__grp";
	rename -uid "EE59108D-0B44-D2C9-EB35-29ACB1F65076";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.30000001 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 2.6528135510517364e-07 -0.99999999999996425 3.9284124013341526e-08 0
		 0.99999999999993916 2.6528136398695779e-07 2.2644163256525081e-07 0 -2.2644164298658865e-07 3.9284063942595965e-08 0.99999999999997335 0
		 0 16 0 1;
	setAttr ".radi" 2.5;
createNode joint -n "PRN__name__FK_IK_Lower__side__jnt" -p "PRN__name__FK_IK_Upper__side__jnt";
	rename -uid "C63A3831-AF48-1352-3C1A-50B8D9717F26";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.30000001 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" -2.6594138355849631e-07 -0.99999999999996358 -4.6759883833253987e-08 0
		 0.99999999999993894 -2.6594139416064577e-07 2.2644165343383958e-07 0 -2.2644166586921998e-07 -4.6759823613044585e-08 0.99999999999997291 0
		 2.1222508438439274e-06 8.0000000000002878 3.1427299210673306e-07 1;
	setAttr ".radi" 2.5;
createNode joint -n "PRN__name__FK_IK_End__side__jnt" -p "PRN__name__FK_IK_Lower__side__jnt";
	rename -uid "8EC2C636-3246-4E7A-9B5E-2B86682EB660";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.30000001 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".radi" 2.5;
createNode transform -n "Offset__DRV__name__IK_Handle__side__trs" -p "System__name__FK_IK__grp";
	rename -uid "5ECE6494-A145-3629-5633-119435A477A8";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode joint -n "DRV__name__IK_Handle__side__jnt" -p "Offset__DRV__name__IK_Handle__side__trs";
	rename -uid "0A6F56FF-9243-5866-936D-C8998DE75C97";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode transform -n "Offset__name__side__ikHandle_trs" -p "DRV__name__IK_Handle__side__jnt";
	rename -uid "7722AC8F-C84F-F1F1-22A0-5E96AB9F0DD3";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" -2.4428937844856154e-32 0 0 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
createNode ikHandle -n "__name__side__ikHandle" -p "Offset__name__side__ikHandle_trs";
	rename -uid "A0177170-2B43-D40A-BF3F-0D9E49FCF155";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".hpr" 4;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "__name__side__ikHandle_poleVectorConstraint1" 
		-p "__name__side__ikHandle";
	rename -uid "62AC8B83-8941-DADD-6FDC-5ABD45896A3B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "DRV_IK_Pole_L_jntW0" -dv 1 -min 0 
		-at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 3.1427308044840174e-07 -8 8 ;
	setAttr -k on ".w0";
createNode transform -n "Offset_DRV__name__IK_Pole__side__trs" -p "System__name__FK_IK__grp";
	rename -uid "9DEC4283-CD45-9C83-3546-B5A0A027146F";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".t" -type "double3" 3.1427308044840174e-07 8 11 ;
	setAttr ".r" -type "double3" 0 0 -89.999999999999957 ;
createNode joint -n "DRV__name__IK_Pole__side__jnt" -p "Offset_DRV__name__IK_Pole__side__trs";
	rename -uid "EF13DFB5-AA4D-8D84-FFD4-898514152E60";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".it" no;
	setAttr ".bps" -type "matrix" 7.7715611723760958e-16 -1 0 0 1 7.7715611723760958e-16 0 0
		 0 0 1 0 3.1427308044840174e-07 8 11 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "DRV__name__IK_Pole__side__jnt_aimConstraint1" -p "DRV__name__IK_Pole__side__jnt";
	rename -uid "F90679DA-3C40-6BBD-B356-1384A654C670";
	addAttr -dcb 0 -ci true -sn "w0" -ln "DRV_name_IK_Shape_Line_Start_L_jntW0" -dv 
		1 -at "double";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr ".u" -type "double3" -1 0 0 ;
	setAttr ".wut" 0;
	setAttr ".rsrr" -type "double3" -89.999990582772099 1.4896559539811967e-12 1.4896561988235026e-12 ;
	setAttr -k on ".w0";
createNode joint -n "DRV__name__IK_Shape_Line_Start__side__jnt" -p "System__name__FK_IK__grp";
	rename -uid "34CF8B51-8147-6CDE-1871-C786F6383BAC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".t" -type "double3" 1.7763568394002505e-15 3.077111878697263e-22 9.2644228605939111e-23 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.5166066558187088e-21 7.5830332790935439e-22 -1.4060661932905559e-21 ;
	setAttr ".bps" -type "matrix" -2.659413831144071e-07 -0.99999999999996358 -4.6759883833254046e-08 0
		 0.99999999999993905 -2.6594139371655634e-07 2.2644165343383955e-07 0 -2.2644166586921998e-07 -4.6759823613044704e-08 0.99999999999997324 0
		 2.1222508473966402e-06 8.0000000000002878 3.1427299210673279e-07 1;
	setAttr ".radi" 0.5;
createNode transform -n "Offset_DRV__name__IK_Upper__side__trs" -p "System__name__FK_IK__grp";
	rename -uid "3B6BDE16-5447-AE92-B4B2-C89C1FE03838";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode joint -n "DRV__name__IK_Upper__side__jnt" -p "Offset_DRV__name__IK_Upper__side__trs";
	rename -uid "21E40772-4F4D-FBE5-A7EA-3EAD4DBCD656";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".r" -type "double3" 1.5224965562523523e-05 -4.2848936364230642e-07 1.5242862966455869e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.522496564628085e-05 -4.0388995122398677e-12 -1.5199501996051271e-05 ;
	setAttr ".bps" -type "matrix" 2.6488882464794045e-07 -0.99999999999996414 3.9284053536667161e-08 0
		 0.99999999999993927 2.6488883352970872e-07 2.2644163405054286e-07 0 -2.2644164445644188e-07 3.9283993554806459e-08 0.99999999999997358 0
		 0 16 0 1;
	setAttr ".radi" 0.2;
createNode joint -n "DRV__name__IK_Lower__side__jnt" -p "DRV__name__IK_Upper__side__jnt";
	rename -uid "4A800FF3-5C49-1CB4-853F-52A23C26F37B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".t" -type "double3" 8 3.0025376703741241e-15 1.0587911840678754e-22 ;
	setAttr ".r" -type "double3" 3.2009701831389208e-14 4.9299516098366046e-06 -3.4938452221529697e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.5016301983727808e-06 ;
	setAttr ".pa" -type "double3" 0 90 0 ;
	setAttr ".bps" -type "matrix" -2.6633391401572907e-07 -0.99999999999996336 -4.6759954658716005e-08 0
		 0.99999999999993883 -2.6633392461789446e-07 2.2644165491909417e-07 0 -2.264416673728482e-07 -4.6759894349620925e-08 0.99999999999997324 0
		 2.1191106001860615e-06 8.0000000000002878 3.1427242829333809e-07 1;
	setAttr ".radi" 0.2;
createNode joint -n "DRV__name__IK_End__side__jnt" -p "DRV__name__IK_Lower__side__jnt";
	rename -uid "5FD355A4-8D4D-C439-2D79-E794C3D1BCAE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".t" -type "double3" 7.9999999999999982 2.8453065954836651e-15 -4.2351647362715017e-22 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -2.6633391401572907e-07 -0.99999999999996336 -4.6759954658716005e-08 0
		 0.99999999999993883 -2.6633392461789446e-07 2.2644165491909417e-07 0 -2.264416673728482e-07 -4.6759894349620925e-08 0.99999999999997324 0
		 -1.1560709094464195e-08 5.8264504332328215e-13 -5.9807208976389636e-08 1;
	setAttr ".radi" 0.2;
createNode ikEffector -n "__name__side__effector" -p "DRV__name__IK_Lower__side__jnt";
	rename -uid "72390087-6442-A760-D492-FBA2FCDCFF64";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "WIP__name__FK_IK__grp" -p "DAG_Nodes__name__FK_IK__side__grp";
	rename -uid "E6BEE0E1-F449-78E3-5329-B39CF83A1574";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".v" no;
createNode transform -n "Viewer__StraightIK__FK_IK__side__grp" -p "WIP__name__FK_IK__grp";
	rename -uid "0A437425-024E-F7B4-5CB9-2D89CC4F3F47";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode transform -n "Viewer_Mesh__name__FK_IK__side__01_Warning" -p "Viewer__StraightIK__FK_IK__side__grp";
	rename -uid "E6C15757-D144-811F-DBD4-32A71A98099A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".rp" -type "double3" 2.1222508621576708e-06 8 3.1427299518327345e-07 ;
	setAttr ".sp" -type "double3" 2.1222508621576708e-06 8 3.1427299518327345e-07 ;
createNode mesh -n "Viewer_Mesh__name__FK_IK__side__01_WarningShape" -p "Viewer_Mesh__name__FK_IK__side__01_Warning";
	rename -uid "DC4F5A6E-6041-94BF-2CDA-3D8FAD5BAEB1";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr -s 3 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 7 "f[0]" "f[19:20]" "f[33:34]" "f[56]" "f[19:20]" "f[33:34]" "f[56]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 11 "f[1:6]" "f[13:18]" "f[21:24]" "f[29:32]" "f[35:41]" "f[49:55]" "f[13:18]" "f[21:24]" "f[29:32]" "f[35:41]" "f[49:55]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 5 "f[7:12]" "f[25:28]" "f[42:48]" "f[25:28]" "f[42:48]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 120 ".uvst[0].uvsp[0:119]" -type "float2" 0.87270147 0.79126859
		 0.87270147 0.76402718 0.87622076 0.76402718 0.87622076 0.79126859 0.87270147 0.61525398
		 0.87622076 0.61525398 0.87270147 0.8240214 0.87622076 0.8240214 0.86656618 0.61525398
		 0.86656618 0.739896 0.86304694 0.739896 0.86304694 0.61525398 0.86656618 0.79113561
		 0.86304694 0.79113561 0.86656618 0.8240214 0.86304694 0.8240214 0.49137396 0.61126256
		 0.49137396 0.0017918082 0.49489328 0.0017918082 0.49489328 0.61126256 0.99800813
		 0.48808354 0.99800813 0.83989292 0.99448889 0.83989292 0.99448889 0.48808354 0.51080579
		 0.66995102 0.51080579 0.61525398 0.51432502 0.61525398 0.51432502 0.66995102 0.46474066
		 0.037293751 0.46474066 0.57580262 0.038595445 0.30684707 0.43400505 0.51796228 0.43400505
		 0.095731802 0.095031328 0.30684707 0.48429236 0.0017918082 0.48429236 0.6112625 0.0019920322
		 0.30686539 0.41445339 0.48275173 0.41445339 0.13094236 0.13201478 0.30684707 0.98341918
		 0.30686542 0.50111872 0.61126256 0.52067041 0.57580262 0.94681579 0.30684704 0.50111872
		 0.0017918015 0.52067041 0.037293747 0.89037979 0.30684704 0.55140609 0.095731795
		 0.55140609 0.51796228 0.85339636 0.30684704 0.57095778 0.13094236 0.57095778 0.48275173
		 0.69988769 0.64290422 0.72678322 0.6697998 0.69988769 0.69669533 0.67299211 0.6697998
		 0.69988769 0.61525398 0.75443345 0.6697998 0.69988769 0.72434562 0.64534187 0.6697998
		 0.57500613 0.72434562 0.52046031 0.6697998 0.5481106 0.6697998 0.57500613 0.69669539
		 0.57500613 0.61525398 0.57500613 0.64290422 0.60190171 0.6697998 0.62955201 0.6697998
		 0.95751488 0.65744066 0.95153809 0.69688749 0.94018209 0.80446976 0.92045873 0.80446976
		 0.90491909 0.67298031 0.90312606 0.65744066 0.93002158 0.63891256 0.97869897 0.64813977
		 0.97093529 0.69937944 0.95777863 0.8240214 0.90308166 0.8240214 0.88549936 0.67524821
		 0.88235617 0.64800686 0.92990059 0.61525398 0.80811328 0.8240214 0.7605688 0.79126859
		 0.78133875 0.78183478 0.80823427 0.80036283 0.76371205 0.76402718 0.78313178 0.76629508
		 0.79867142 0.63480568 0.81839484 0.63480568 0.82975078 0.74238795 0.83572751 0.78183478
		 0.8569116 0.79113561 0.78129429 0.61525398 0.83599132 0.61525398 0.84914798 0.739896
		 0.9903059 0.48409215 0.9903059 0.0017918015 0.9938252 0.0017918015 0.9938252 0.48409215
		 0.9903059 0.0017918015 0.9938252 0.0017918015 0.98483425 0.89769268 0.98483425 0.61525398
		 0.98835349 0.61525398 0.98835349 0.89769268 0.98483425 0.61525398 0.98835349 0.61525398
		 0.63568723 0.72434562 0.63568723 0.6697998 0.63920659 0.6697998 0.63920659 0.72434562
		 0.63568723 0.61525398 0.63920659 0.61525398 0.63568723 0.6697998 0.63920659 0.6697998
		 0.50467044 0.61525398 0.50467044 0.6697998 0.50115114 0.6697998 0.50115114 0.61525398;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 68 ".pt[0:67]" -type "float3"  1.083442e-06 8 3.0528696 
		1.5984709e-06 8 3.0528693 1.5984707e-06 8.000001 3.0528698 1.1516491e-06 8 3.0528696 
		1.5613244e-06 8 3.0528698 1.5613246e-06 8 3.0528693 1.4720613e-06 8 3.0528696 1.5045666e-06 
		8 3.0528696 1.5370719e-06 8 3.0528696 1.5045665e-06 8 3.0528696 1.2474134e-06 8 3.0528696 
		1.2698059e-06 8 3.0528696 1.2885868e-06 8 3.0528696 1.4475016e-06 8 3.0528696 1.4475016e-06 
		8 3.0528696 1.3174804e-06 8 3.0528696 1.2698059e-06 8 3.0528696 1.0392041e-06 8 3.0528696 
		1.6221006e-06 8 3.0528693 1.6221004e-06 8.000001 3.05287 1.1963464e-06 8 3.0528696 
		1.5376947e-06 8 3.0528698 1.5376949e-06 8 3.0528696 1.0356592e-06 8 3.0528696 1.6185558e-06 
		8 3.0528693 1.6185555e-06 8.000001 3.05287 1.1928015e-06 8 3.0528696 1.5341499e-06 
		8 3.0528698 1.53415e-06 8 3.0528696 1.0798972e-06 8 3.0528696 1.5949261e-06 8 3.0528693 
		1.5949258e-06 8.000001 3.0528698 1.1481043e-06 8 3.0528696 1.5577796e-06 8 3.0528698 
		1.5577797e-06 8 3.0528693 1.4386438e-06 8 3.0528696 1.5045666e-06 8 3.0528696 1.5704893e-06 
		8 3.0528696 1.5045665e-06 8 3.0528696 1.435099e-06 8 3.0528696 1.5010218e-06 8 3.0528696 
		1.5669444e-06 8 3.0528696 1.5010216e-06 8 3.0528696 1.4685163e-06 8 3.0528696 1.5010218e-06 
		8 3.0528696 1.533527e-06 8 3.0528696 1.5010216e-06 8 3.0528696 1.2188201e-06 8 3.0528696 
		1.2584045e-06 8 3.0528696 1.2913277e-06 8 3.0528696 1.4711313e-06 8 3.0528696 1.4711313e-06 
		8 3.0528696 1.3204921e-06 8 3.0528696 1.2585651e-06 8 3.0528696 1.2152752e-06 8 3.0528696 
		1.2548596e-06 8 3.0528696 1.2877829e-06 8 3.0528696 1.4675865e-06 8 3.0528696 1.4675865e-06 
		8 3.0528696 1.3169472e-06 8 3.0528696 1.2550203e-06 8 3.0528696 1.2438685e-06 8 3.0528696 
		1.2662611e-06 8 3.0528696 1.2850419e-06 8 3.0528696 1.4439568e-06 8 3.0528696 1.4439568e-06 
		8 3.0528696 1.3139355e-06 8 3.0528696 1.2662611e-06 8 3.0528696;
	setAttr -s 68 ".vt[0:67]"  0.0045214077 1.3715167 1.3933568e-17 -1.22079349 -0.56992674 1.3933568e-17
		 1.2325592 -0.56992674 1.3933568e-17 0.0045214077 1.11440468 1.3933568e-17 0.96632564 -0.42990047 1.3933568e-17
		 -0.95728278 -0.42990047 1.3933568e-17 0.0045214077 -0.093415342 1.3933568e-17 -0.1180101 -0.2159469 1.3933568e-17
		 0.0045214077 -0.33847836 1.3933568e-17 0.1270529 -0.2159469 1.3933568e-17 0.0045214077 0.75341338 1.3933568e-17
		 -0.1180101 0.66900277 1.3933568e-17 -0.10984129 0.59820676 1.3933568e-17 -0.03904536 -0.00083602447 1.3933568e-17
		 0.050811045 -0.00083602447 1.3933568e-17 0.10254661 0.48928988 1.3933568e-17 0.12977578 0.66900277 1.3933568e-17
		 0.004437787 1.53827548 -2.3094324e-17 -1.38234246 -0.65900081 3.3711981e-17 1.39429986 -0.65900081 3.3711984e-17
		 0.0045214077 0.94591445 5.1345936e-17 0.80591255 -0.34082639 -5.8448462e-18 -0.79686981 -0.34082639 -5.8448433e-18
		 0.004437787 1.53827548 0.016033329 -1.38234246 -0.65900081 0.016033329 1.39429986 -0.65900081 0.016033329
		 0.0045214077 0.94591445 0.016033329 0.80591255 -0.34082639 0.016033329 -0.79686981 -0.34082639 0.016033329
		 0.0045214077 1.3715167 0.016033329 -1.22079349 -0.56992674 0.016033329 1.2325592 -0.56992674 0.016033329
		 0.0045214077 1.11440468 0.016033329 0.96632564 -0.42990047 0.016033329 -0.95728278 -0.42990047 0.016033329
		 0.0045214077 0.032554433 -1.4037343e-17 -0.24397987 -0.2159469 1.3933571e-17 0.0045214077 -0.46444809 4.190447e-17
		 0.25302258 -0.2159469 1.3933571e-17 0.0045214077 0.032554433 0.016033329 -0.24397987 -0.2159469 0.016033329
		 0.0045214077 -0.46444809 0.016033329 0.25302258 -0.2159469 0.016033329 0.0045214077 -0.093415342 0.016033329
		 -0.1180101 -0.2159469 0.016033329 0.0045214077 -0.33847836 0.016033329 0.1270529 -0.2159469 0.016033329
		 0.003970278 0.86119783 -9.9994001e-18 -0.2126343 0.71198153 4.3903777e-18 -0.19831419 0.58787465 1.6227763e-17
		 -0.11821241 -0.089910075 3.3711981e-17 0.13097771 -0.089910075 3.3711981e-17 0.19091715 0.47793701 1.6454402e-17
		 0.22628663 0.71137595 4.5248376e-18 0.003970278 0.86119783 0.016033329 -0.2126343 0.71198153 0.016033329
		 -0.19831419 0.58787465 0.016033329 -0.11821241 -0.089910075 0.016033329 0.13097771 -0.089910075 0.016033329
		 0.19091715 0.47793701 0.016033329 0.22628663 0.71137595 0.016033329 0.0045214077 0.75341338 0.016033329
		 -0.1180101 0.66900277 0.016033329 -0.10984129 0.59820676 0.016033329 -0.03904536 -0.00083602447 0.016033329
		 0.050811045 -0.00083602447 0.016033329 0.10254661 0.48928988 0.016033329 0.12977578 0.66900277 0.016033329;
	setAttr -s 119 ".ed[0:118]"  2 1 1 1 0 1 0 2 1 1 18 1 18 17 0 17 0 1 2 19 1
		 19 18 0 17 19 0 3 4 1 4 21 1 21 20 0 20 3 1 4 5 1 5 22 1 22 21 0 5 3 1 20 22 0 18 24 0
		 24 23 0 23 17 0 19 25 0 25 24 0 23 25 0 21 27 0 27 26 0 26 20 0 22 28 0 28 27 0 26 28 0
		 24 30 1 30 29 1 29 23 1 25 31 1 31 30 1 29 31 1 27 33 1 33 32 1 32 26 1 28 34 1 34 33 1
		 32 34 1 9 8 1 8 7 1 7 6 1 6 9 1 7 36 1 36 35 0 35 6 1 8 37 1 37 36 0 9 38 1 38 37 0
		 35 38 0 36 40 0 40 39 0 39 35 0 37 41 0 41 40 0 38 42 0 42 41 0 39 42 0 40 44 1 44 43 1
		 43 39 1 41 45 1 45 44 1 42 46 1 46 45 1 43 46 1 16 15 1 15 14 1 14 13 1 13 12 1 12 11 1
		 11 10 1 10 16 1 11 48 1 48 47 0 47 10 1 12 49 1 49 48 0 13 50 1 50 49 0 14 51 1 51 50 0
		 15 52 1 52 51 0 16 53 1 53 52 0 47 53 0 48 55 0 55 54 0 54 47 0 49 56 1 56 55 0 50 57 0
		 57 56 0 51 58 0 58 57 0 52 59 1 59 58 0 53 60 0 60 59 0 54 60 0 55 62 1 62 61 1 61 54 1
		 56 63 1 63 62 1 57 64 1 64 63 1 58 65 1 65 64 1 59 66 1 66 65 1 60 67 1 67 66 1 61 67 1;
	setAttr -s 57 -ch 238 ".fc[0:56]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 28 29 30
		h 3 -14 -10 -17
		mu 0 3 31 32 33
		f 4 -2 3 4 5
		mu 0 4 30 29 35 36
		f 4 -1 6 7 -4
		mu 0 4 29 28 34 35
		f 4 -3 -6 8 -7
		mu 0 4 28 30 36 34
		f 4 9 10 11 12
		mu 0 4 33 32 38 39
		f 4 13 14 15 -11
		mu 0 4 32 31 37 38
		f 4 16 -13 17 -15
		mu 0 4 31 33 39 37
		f 4 -5 18 19 20
		mu 0 4 96 97 98 99
		f 4 -8 21 22 -19
		mu 0 4 16 17 18 19
		f 4 -9 -21 23 -22
		mu 0 4 100 96 99 101
		f 4 -12 24 25 26
		mu 0 4 102 103 104 105
		f 4 -16 27 28 -25
		mu 0 4 20 21 22 23
		f 4 -18 -27 29 -28
		mu 0 4 106 102 105 107
		f 4 -20 30 31 32
		mu 0 4 40 41 42 43
		f 4 -23 33 34 -31
		mu 0 4 41 44 45 42
		f 4 -24 -33 35 -34
		mu 0 4 44 40 43 45
		f 4 -26 36 37 38
		mu 0 4 49 50 47 46
		f 4 -29 39 40 -37
		mu 0 4 50 51 48 47
		f 4 -30 -39 41 -40
		mu 0 4 51 49 46 48
		f 3 -32 -35 -36
		mu 0 3 43 42 45
		h 3 -38 -41 -42
		mu 0 3 46 47 48
		f 4 42 43 44 45
		mu 0 4 52 53 54 55
		f 4 -45 46 47 48
		mu 0 4 55 54 58 59
		f 4 -44 49 50 -47
		mu 0 4 54 53 57 58
		f 4 -43 51 52 -50
		mu 0 4 53 52 56 57
		f 4 -46 -49 53 -52
		mu 0 4 52 55 59 56
		f 4 -48 54 55 56
		mu 0 4 108 109 110 111
		f 4 -51 57 58 -55
		mu 0 4 109 112 113 110
		f 4 -53 59 60 -58
		mu 0 4 116 117 118 119
		f 4 -54 -57 61 -60
		mu 0 4 114 108 111 115
		f 4 -56 62 63 64
		mu 0 4 60 61 62 63
		f 4 -59 65 66 -63
		mu 0 4 61 64 65 62
		f 4 -61 67 68 -66
		mu 0 4 64 67 66 65
		f 4 -62 -65 69 -68
		mu 0 4 67 60 63 66
		f 4 -64 -67 -69 -70
		mu 0 4 63 62 65 66
		f 7 70 71 72 73 74 75 76
		mu 0 7 68 69 70 71 72 73 74
		f 4 -76 77 78 79
		mu 0 4 74 73 80 81
		f 4 -75 80 81 -78
		mu 0 4 73 72 79 80
		f 4 -74 82 83 -81
		mu 0 4 72 71 78 79
		f 4 -73 84 85 -83
		mu 0 4 71 70 77 78
		f 4 -72 86 87 -85
		mu 0 4 70 69 76 77
		f 4 -71 88 89 -87
		mu 0 4 69 68 75 76
		f 4 -77 -80 90 -89
		mu 0 4 68 74 81 75
		f 4 -79 91 92 93
		mu 0 4 6 0 3 7
		f 4 -82 94 95 -92
		mu 0 4 0 1 2 3
		f 4 -84 96 97 -95
		mu 0 4 1 4 5 2
		f 4 -86 98 99 -97
		mu 0 4 24 25 26 27
		f 4 -88 100 101 -99
		mu 0 4 8 9 10 11
		f 4 -90 102 103 -101
		mu 0 4 9 12 13 10
		f 4 -91 -94 104 -103
		mu 0 4 12 14 15 13
		f 4 -93 105 106 107
		mu 0 4 82 83 84 85
		f 4 -96 108 109 -106
		mu 0 4 83 86 87 84
		f 4 -98 110 111 -109
		mu 0 4 86 93 88 87
		f 4 -100 112 113 -111
		mu 0 4 93 94 89 88
		f 4 -102 114 115 -113
		mu 0 4 94 95 90 89
		f 4 -104 116 117 -115
		mu 0 4 95 92 91 90
		f 4 -105 -108 118 -117
		mu 0 4 92 82 85 91
		f 7 -107 -110 -112 -114 -116 -118 -119
		mu 0 7 85 84 87 88 89 90 91;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Viewer_Mesh__name__FK_IK__side__02_Warning" -p "Viewer__StraightIK__FK_IK__side__grp";
	rename -uid "479E95C8-2441-EE85-FD0B-D681AB9CE4AD";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".rp" -type "double3" 2.1222508621576708e-06 7.9999999999999991 3.1427299525752224e-07 ;
	setAttr ".sp" -type "double3" 2.1222508621576708e-06 7.9999999999999991 3.1427299525752224e-07 ;
createNode mesh -n "Viewer_Mesh__name__FK_IK__side__02_WarningShape" -p "Viewer_Mesh__name__FK_IK__side__02_Warning";
	rename -uid "7083C48C-FF46-D6D8-8A46-7099A81170C3";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr -s 3 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 7 "f[0]" "f[19:20]" "f[33:34]" "f[56]" "f[19:20]" "f[33:34]" "f[56]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 11 "f[1:6]" "f[13:18]" "f[21:24]" "f[29:32]" "f[35:41]" "f[49:55]" "f[13:18]" "f[21:24]" "f[29:32]" "f[35:41]" "f[49:55]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 5 "f[7:12]" "f[25:28]" "f[42:48]" "f[25:28]" "f[42:48]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 120 ".uvst[0].uvsp[0:119]" -type "float2" 0.87270147 0.79126859
		 0.87270147 0.76402718 0.87622076 0.76402718 0.87622076 0.79126859 0.87270147 0.61525398
		 0.87622076 0.61525398 0.87270147 0.8240214 0.87622076 0.8240214 0.86656618 0.61525398
		 0.86656618 0.739896 0.86304694 0.739896 0.86304694 0.61525398 0.86656618 0.79113561
		 0.86304694 0.79113561 0.86656618 0.8240214 0.86304694 0.8240214 0.49137396 0.61126256
		 0.49137396 0.0017918082 0.49489328 0.0017918082 0.49489328 0.61126256 0.99800813
		 0.48808354 0.99800813 0.83989292 0.99448889 0.83989292 0.99448889 0.48808354 0.51080579
		 0.66995102 0.51080579 0.61525398 0.51432502 0.61525398 0.51432502 0.66995102 0.46474066
		 0.037293751 0.46474066 0.57580262 0.038595445 0.30684707 0.43400505 0.51796228 0.43400505
		 0.095731802 0.095031328 0.30684707 0.48429236 0.0017918082 0.48429236 0.6112625 0.0019920322
		 0.30686539 0.41445339 0.48275173 0.41445339 0.13094236 0.13201478 0.30684707 0.98341918
		 0.30686542 0.50111872 0.61126256 0.52067041 0.57580262 0.94681579 0.30684704 0.50111872
		 0.0017918015 0.52067041 0.037293747 0.89037979 0.30684704 0.55140609 0.095731795
		 0.55140609 0.51796228 0.85339636 0.30684704 0.57095778 0.13094236 0.57095778 0.48275173
		 0.69988769 0.64290422 0.72678322 0.6697998 0.69988769 0.69669533 0.67299211 0.6697998
		 0.69988769 0.61525398 0.75443345 0.6697998 0.69988769 0.72434562 0.64534187 0.6697998
		 0.57500613 0.72434562 0.52046031 0.6697998 0.5481106 0.6697998 0.57500613 0.69669539
		 0.57500613 0.61525398 0.57500613 0.64290422 0.60190171 0.6697998 0.62955201 0.6697998
		 0.95751488 0.65744066 0.95153809 0.69688749 0.94018209 0.80446976 0.92045873 0.80446976
		 0.90491909 0.67298031 0.90312606 0.65744066 0.93002158 0.63891256 0.97869897 0.64813977
		 0.97093529 0.69937944 0.95777863 0.8240214 0.90308166 0.8240214 0.88549936 0.67524821
		 0.88235617 0.64800686 0.92990059 0.61525398 0.80811328 0.8240214 0.7605688 0.79126859
		 0.78133875 0.78183478 0.80823427 0.80036283 0.76371205 0.76402718 0.78313178 0.76629508
		 0.79867142 0.63480568 0.81839484 0.63480568 0.82975078 0.74238795 0.83572751 0.78183478
		 0.8569116 0.79113561 0.78129429 0.61525398 0.83599132 0.61525398 0.84914798 0.739896
		 0.9903059 0.48409215 0.9903059 0.0017918015 0.9938252 0.0017918015 0.9938252 0.48409215
		 0.9903059 0.0017918015 0.9938252 0.0017918015 0.98483425 0.89769268 0.98483425 0.61525398
		 0.98835349 0.61525398 0.98835349 0.89769268 0.98483425 0.61525398 0.98835349 0.61525398
		 0.63568723 0.72434562 0.63568723 0.6697998 0.63920659 0.6697998 0.63920659 0.72434562
		 0.63568723 0.61525398 0.63920659 0.61525398 0.63568723 0.6697998 0.63920659 0.6697998
		 0.50467044 0.61525398 0.50467044 0.6697998 0.50115114 0.6697998 0.50115114 0.61525398;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 68 ".pt[0:67]" -type "float3"  2.6370823 8.000001 -1.5303491 
		4.4750552 8.000001 -0.4691956 0.79502642 8.000001 -2.5938616 2.6370823 8.000001 -1.5303491 
		1.1943767 8.000001 -2.3632965 4.0797892 8.000001 -0.69740254 2.6370828 8.000001 -1.5303494 
		2.8208799 8.000001 -1.424234 2.6370828 8.000001 -1.5303494 2.4532857 8.000001 -1.6364648 
		2.6370826 8.000001 -1.5303493 2.8208797 8.000001 -1.4242339 2.8086267 8.000001 -1.4313083 
		2.7024329 8.000001 -1.4926194 2.5676484 8.000001 -1.5704373 2.4900448 8.000001 -1.6152418 
		2.4492011 8.000001 -1.6388228 2.637208 8.000001 -1.5302767 4.7173781 8.000001 -0.32929003 
		0.55241549 8.000001 -2.733933 2.6370826 8.000001 -1.5303493 1.4349964 8.000001 -2.2243748 
		3.8391695 8.000001 -0.83632421 2.651093 8.000001 -1.5543267 4.7312636 8.000001 -0.35334015 
		0.56630063 8.000001 -2.7579832 2.6509678 8.000001 -1.5543991 1.4488814 8.000001 -2.2484245 
		3.8530548 8.000001 -0.86037415 2.6509678 8.000001 -1.5543991 4.4889402 8.000001 -0.49324548 
		0.80891156 8.000001 -2.6179113 2.6509678 8.000001 -1.5543991 1.2082618 8.000001 -2.3873463 
		4.0936742 8.000001 -0.72145247 2.6370828 8.000001 -1.5303494 3.0098348 8.000001 -1.315141 
		2.6370828 8.000001 -1.5303494 2.2643311 8.000001 -1.7455579 2.6509681 8.000001 -1.5543993 
		3.0237198 8.000001 -1.3391908 2.6509681 8.000001 -1.5543994 2.2782164 8.000001 -1.7696078 
		2.6509681 8.000001 -1.5543993 2.8347654 8.000001 -1.448284 2.6509681 8.000001 -1.5543994 
		2.4671707 8.000001 -1.6605148 2.6379092 8.000001 -1.5298721 2.9628162 8.000001 -1.3422869 
		2.9413359 8.000001 -1.3546884 2.8211834 8.000001 -1.4240588 2.4473984 8.000001 -1.6398637 
		2.3574891 8.000001 -1.6917729 2.3044348 8.000001 -1.7224035 2.6517944 8.000001 -1.5539221 
		2.9767013 8.000001 -1.3663368 2.9552212 8.000001 -1.3787385 2.8350687 8.000001 -1.4481087 
		2.4612834 8.000001 -1.6639136 2.3713744 8.000001 -1.7158229 2.31832 8.000001 -1.7464536 
		2.6509678 8.000001 -1.5543991 2.8347652 8.000001 -1.4482839 2.8225117 8.000001 -1.4553581 
		2.7163181 8.000001 -1.5166695 2.5815337 8.000001 -1.5944874 2.5039301 8.000001 -1.6392916 
		2.4630864 8.000001 -1.6628728;
	setAttr -s 68 ".vt[0:67]"  0.0045214077 1.3715167 1.3933568e-17 -1.22079349 -0.56992674 1.3933568e-17
		 1.2325592 -0.56992674 1.3933568e-17 0.0045214077 1.11440468 1.3933568e-17 0.96632564 -0.42990047 1.3933568e-17
		 -0.95728278 -0.42990047 1.3933568e-17 0.0045214077 -0.093415342 1.3933568e-17 -0.1180101 -0.2159469 1.3933568e-17
		 0.0045214077 -0.33847836 1.3933568e-17 0.1270529 -0.2159469 1.3933568e-17 0.0045214077 0.75341338 1.3933568e-17
		 -0.1180101 0.66900277 1.3933568e-17 -0.10984129 0.59820676 1.3933568e-17 -0.03904536 -0.00083602447 1.3933568e-17
		 0.050811045 -0.00083602447 1.3933568e-17 0.10254661 0.48928988 1.3933568e-17 0.12977578 0.66900277 1.3933568e-17
		 0.004437787 1.53827548 -2.3094324e-17 -1.38234246 -0.65900081 3.3711981e-17 1.39429986 -0.65900081 3.3711984e-17
		 0.0045214077 0.94591445 5.1345936e-17 0.80591255 -0.34082639 -5.8448462e-18 -0.79686981 -0.34082639 -5.8448433e-18
		 0.004437787 1.53827548 0.016033329 -1.38234246 -0.65900081 0.016033329 1.39429986 -0.65900081 0.016033329
		 0.0045214077 0.94591445 0.016033329 0.80591255 -0.34082639 0.016033329 -0.79686981 -0.34082639 0.016033329
		 0.0045214077 1.3715167 0.016033329 -1.22079349 -0.56992674 0.016033329 1.2325592 -0.56992674 0.016033329
		 0.0045214077 1.11440468 0.016033329 0.96632564 -0.42990047 0.016033329 -0.95728278 -0.42990047 0.016033329
		 0.0045214077 0.032554433 -1.4037343e-17 -0.24397987 -0.2159469 1.3933571e-17 0.0045214077 -0.46444809 4.190447e-17
		 0.25302258 -0.2159469 1.3933571e-17 0.0045214077 0.032554433 0.016033329 -0.24397987 -0.2159469 0.016033329
		 0.0045214077 -0.46444809 0.016033329 0.25302258 -0.2159469 0.016033329 0.0045214077 -0.093415342 0.016033329
		 -0.1180101 -0.2159469 0.016033329 0.0045214077 -0.33847836 0.016033329 0.1270529 -0.2159469 0.016033329
		 0.003970278 0.86119783 -9.9994001e-18 -0.2126343 0.71198153 4.3903777e-18 -0.19831419 0.58787465 1.6227763e-17
		 -0.11821241 -0.089910075 3.3711981e-17 0.13097771 -0.089910075 3.3711981e-17 0.19091715 0.47793701 1.6454402e-17
		 0.22628663 0.71137595 4.5248376e-18 0.003970278 0.86119783 0.016033329 -0.2126343 0.71198153 0.016033329
		 -0.19831419 0.58787465 0.016033329 -0.11821241 -0.089910075 0.016033329 0.13097771 -0.089910075 0.016033329
		 0.19091715 0.47793701 0.016033329 0.22628663 0.71137595 0.016033329 0.0045214077 0.75341338 0.016033329
		 -0.1180101 0.66900277 0.016033329 -0.10984129 0.59820676 0.016033329 -0.03904536 -0.00083602447 0.016033329
		 0.050811045 -0.00083602447 0.016033329 0.10254661 0.48928988 0.016033329 0.12977578 0.66900277 0.016033329;
	setAttr -s 119 ".ed[0:118]"  2 1 1 1 0 1 0 2 1 1 18 1 18 17 0 17 0 1 2 19 1
		 19 18 0 17 19 0 3 4 1 4 21 1 21 20 0 20 3 1 4 5 1 5 22 1 22 21 0 5 3 1 20 22 0 18 24 0
		 24 23 0 23 17 0 19 25 0 25 24 0 23 25 0 21 27 0 27 26 0 26 20 0 22 28 0 28 27 0 26 28 0
		 24 30 1 30 29 1 29 23 1 25 31 1 31 30 1 29 31 1 27 33 1 33 32 1 32 26 1 28 34 1 34 33 1
		 32 34 1 9 8 1 8 7 1 7 6 1 6 9 1 7 36 1 36 35 0 35 6 1 8 37 1 37 36 0 9 38 1 38 37 0
		 35 38 0 36 40 0 40 39 0 39 35 0 37 41 0 41 40 0 38 42 0 42 41 0 39 42 0 40 44 1 44 43 1
		 43 39 1 41 45 1 45 44 1 42 46 1 46 45 1 43 46 1 16 15 1 15 14 1 14 13 1 13 12 1 12 11 1
		 11 10 1 10 16 1 11 48 1 48 47 0 47 10 1 12 49 1 49 48 0 13 50 1 50 49 0 14 51 1 51 50 0
		 15 52 1 52 51 0 16 53 1 53 52 0 47 53 0 48 55 0 55 54 0 54 47 0 49 56 1 56 55 0 50 57 0
		 57 56 0 51 58 0 58 57 0 52 59 1 59 58 0 53 60 0 60 59 0 54 60 0 55 62 1 62 61 1 61 54 1
		 56 63 1 63 62 1 57 64 1 64 63 1 58 65 1 65 64 1 59 66 1 66 65 1 60 67 1 67 66 1 61 67 1;
	setAttr -s 57 -ch 238 ".fc[0:56]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 28 29 30
		h 3 -14 -10 -17
		mu 0 3 31 32 33
		f 4 -2 3 4 5
		mu 0 4 30 29 35 36
		f 4 -1 6 7 -4
		mu 0 4 29 28 34 35
		f 4 -3 -6 8 -7
		mu 0 4 28 30 36 34
		f 4 9 10 11 12
		mu 0 4 33 32 38 39
		f 4 13 14 15 -11
		mu 0 4 32 31 37 38
		f 4 16 -13 17 -15
		mu 0 4 31 33 39 37
		f 4 -5 18 19 20
		mu 0 4 96 97 98 99
		f 4 -8 21 22 -19
		mu 0 4 16 17 18 19
		f 4 -9 -21 23 -22
		mu 0 4 100 96 99 101
		f 4 -12 24 25 26
		mu 0 4 102 103 104 105
		f 4 -16 27 28 -25
		mu 0 4 20 21 22 23
		f 4 -18 -27 29 -28
		mu 0 4 106 102 105 107
		f 4 -20 30 31 32
		mu 0 4 40 41 42 43
		f 4 -23 33 34 -31
		mu 0 4 41 44 45 42
		f 4 -24 -33 35 -34
		mu 0 4 44 40 43 45
		f 4 -26 36 37 38
		mu 0 4 49 50 47 46
		f 4 -29 39 40 -37
		mu 0 4 50 51 48 47
		f 4 -30 -39 41 -40
		mu 0 4 51 49 46 48
		f 3 -32 -35 -36
		mu 0 3 43 42 45
		h 3 -38 -41 -42
		mu 0 3 46 47 48
		f 4 42 43 44 45
		mu 0 4 52 53 54 55
		f 4 -45 46 47 48
		mu 0 4 55 54 58 59
		f 4 -44 49 50 -47
		mu 0 4 54 53 57 58
		f 4 -43 51 52 -50
		mu 0 4 53 52 56 57
		f 4 -46 -49 53 -52
		mu 0 4 52 55 59 56
		f 4 -48 54 55 56
		mu 0 4 108 109 110 111
		f 4 -51 57 58 -55
		mu 0 4 109 112 113 110
		f 4 -53 59 60 -58
		mu 0 4 116 117 118 119
		f 4 -54 -57 61 -60
		mu 0 4 114 108 111 115
		f 4 -56 62 63 64
		mu 0 4 60 61 62 63
		f 4 -59 65 66 -63
		mu 0 4 61 64 65 62
		f 4 -61 67 68 -66
		mu 0 4 64 67 66 65
		f 4 -62 -65 69 -68
		mu 0 4 67 60 63 66
		f 4 -64 -67 -69 -70
		mu 0 4 63 62 65 66
		f 7 70 71 72 73 74 75 76
		mu 0 7 68 69 70 71 72 73 74
		f 4 -76 77 78 79
		mu 0 4 74 73 80 81
		f 4 -75 80 81 -78
		mu 0 4 73 72 79 80
		f 4 -74 82 83 -81
		mu 0 4 72 71 78 79
		f 4 -73 84 85 -83
		mu 0 4 71 70 77 78
		f 4 -72 86 87 -85
		mu 0 4 70 69 76 77
		f 4 -71 88 89 -87
		mu 0 4 69 68 75 76
		f 4 -77 -80 90 -89
		mu 0 4 68 74 81 75
		f 4 -79 91 92 93
		mu 0 4 6 0 3 7
		f 4 -82 94 95 -92
		mu 0 4 0 1 2 3
		f 4 -84 96 97 -95
		mu 0 4 1 4 5 2
		f 4 -86 98 99 -97
		mu 0 4 24 25 26 27
		f 4 -88 100 101 -99
		mu 0 4 8 9 10 11
		f 4 -90 102 103 -101
		mu 0 4 9 12 13 10
		f 4 -91 -94 104 -103
		mu 0 4 12 14 15 13
		f 4 -93 105 106 107
		mu 0 4 82 83 84 85
		f 4 -96 108 109 -106
		mu 0 4 83 86 87 84
		f 4 -98 110 111 -109
		mu 0 4 86 93 88 87
		f 4 -100 112 113 -111
		mu 0 4 93 94 89 88
		f 4 -102 114 115 -113
		mu 0 4 94 95 90 89
		f 4 -104 116 117 -115
		mu 0 4 95 92 91 90
		f 4 -105 -108 118 -117
		mu 0 4 92 82 85 91
		f 7 -107 -110 -112 -114 -116 -118 -119
		mu 0 7 85 84 87 88 89 90 91;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Viewer_Mesh__name__FK_IK__side__03_Warning" -p "Viewer__StraightIK__FK_IK__side__grp";
	rename -uid "9C5307A9-8F4E-9395-CBD4-789A2A2AAC87";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".rp" -type "double3" 2.1222508621576708e-06 8 3.1427299518327345e-07 ;
	setAttr ".sp" -type "double3" 2.1222508621576708e-06 8 3.1427299518327345e-07 ;
createNode mesh -n "Viewer_Mesh__name__FK_IK__side__03_WarningShape" -p "Viewer_Mesh__name__FK_IK__side__03_Warning";
	rename -uid "4692A5B0-4A4B-D29E-C05E-0583F88073DE";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr -s 3 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 7 "f[0]" "f[19:20]" "f[33:34]" "f[56]" "f[19:20]" "f[33:34]" "f[56]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 11 "f[1:6]" "f[13:18]" "f[21:24]" "f[29:32]" "f[35:41]" "f[49:55]" "f[13:18]" "f[21:24]" "f[29:32]" "f[35:41]" "f[49:55]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 5 "f[7:12]" "f[25:28]" "f[42:48]" "f[25:28]" "f[42:48]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 120 ".uvst[0].uvsp[0:119]" -type "float2" 0.87270147 0.79126859
		 0.87270147 0.76402718 0.87622076 0.76402718 0.87622076 0.79126859 0.87270147 0.61525398
		 0.87622076 0.61525398 0.87270147 0.8240214 0.87622076 0.8240214 0.86656618 0.61525398
		 0.86656618 0.739896 0.86304694 0.739896 0.86304694 0.61525398 0.86656618 0.79113561
		 0.86304694 0.79113561 0.86656618 0.8240214 0.86304694 0.8240214 0.49137396 0.61126256
		 0.49137396 0.0017918082 0.49489328 0.0017918082 0.49489328 0.61126256 0.99800813
		 0.48808354 0.99800813 0.83989292 0.99448889 0.83989292 0.99448889 0.48808354 0.51080579
		 0.66995102 0.51080579 0.61525398 0.51432502 0.61525398 0.51432502 0.66995102 0.46474066
		 0.037293751 0.46474066 0.57580262 0.038595445 0.30684707 0.43400505 0.51796228 0.43400505
		 0.095731802 0.095031328 0.30684707 0.48429236 0.0017918082 0.48429236 0.6112625 0.0019920322
		 0.30686539 0.41445339 0.48275173 0.41445339 0.13094236 0.13201478 0.30684707 0.98341918
		 0.30686542 0.50111872 0.61126256 0.52067041 0.57580262 0.94681579 0.30684704 0.50111872
		 0.0017918015 0.52067041 0.037293747 0.89037979 0.30684704 0.55140609 0.095731795
		 0.55140609 0.51796228 0.85339636 0.30684704 0.57095778 0.13094236 0.57095778 0.48275173
		 0.69988769 0.64290422 0.72678322 0.6697998 0.69988769 0.69669533 0.67299211 0.6697998
		 0.69988769 0.61525398 0.75443345 0.6697998 0.69988769 0.72434562 0.64534187 0.6697998
		 0.57500613 0.72434562 0.52046031 0.6697998 0.5481106 0.6697998 0.57500613 0.69669539
		 0.57500613 0.61525398 0.57500613 0.64290422 0.60190171 0.6697998 0.62955201 0.6697998
		 0.95751488 0.65744066 0.95153809 0.69688749 0.94018209 0.80446976 0.92045873 0.80446976
		 0.90491909 0.67298031 0.90312606 0.65744066 0.93002158 0.63891256 0.97869897 0.64813977
		 0.97093529 0.69937944 0.95777863 0.8240214 0.90308166 0.8240214 0.88549936 0.67524821
		 0.88235617 0.64800686 0.92990059 0.61525398 0.80811328 0.8240214 0.7605688 0.79126859
		 0.78133875 0.78183478 0.80823427 0.80036283 0.76371205 0.76402718 0.78313178 0.76629508
		 0.79867142 0.63480568 0.81839484 0.63480568 0.82975078 0.74238795 0.83572751 0.78183478
		 0.8569116 0.79113561 0.78129429 0.61525398 0.83599132 0.61525398 0.84914798 0.739896
		 0.9903059 0.48409215 0.9903059 0.0017918015 0.9938252 0.0017918015 0.9938252 0.48409215
		 0.9903059 0.0017918015 0.9938252 0.0017918015 0.98483425 0.89769268 0.98483425 0.61525398
		 0.98835349 0.61525398 0.98835349 0.89769268 0.98483425 0.61525398 0.98835349 0.61525398
		 0.63568723 0.72434562 0.63568723 0.6697998 0.63920659 0.6697998 0.63920659 0.72434562
		 0.63568723 0.61525398 0.63920659 0.61525398 0.63568723 0.6697998 0.63920659 0.6697998
		 0.50467044 0.61525398 0.50467044 0.6697998 0.50115114 0.6697998 0.50115114 0.61525398;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 68 ".pt[0:67]" -type "float3"  -2.6506417 8 -1.5225194 -0.8126694 
		8 -2.583673 -4.4926991 8.000001 -0.45900726 -2.6506417 8 -1.5225194 -4.0933485 8 
		-0.68957233 -1.2079356 8 -2.3554659 -2.6506419 8 -1.5225194 -2.4668448 8 -1.6286347 
		-2.6506422 8 -1.5225194 -2.8344393 8 -1.416404 -2.6506419 8 -1.5225194 -2.4668448 
		8 -1.6286347 -2.4790978 8 -1.6215603 -2.5852919 8 -1.5602491 -2.7200766 8 -1.4824312 
		-2.7976797 8 -1.4376271 -2.8385236 8 -1.414046 -2.6505165 8 -1.5225918 -0.57034612 
		8 -2.7235785 -4.7353106 8.000001 -0.31893587 -2.6506419 8 -1.5225194 -3.8527291 8 
		-0.82849407 -1.4485552 8 -2.2165444 -2.6644018 8 -1.5466421 -0.5842315 8 -2.7476282 
		-4.7491956 8.000001 -0.34298587 -2.6645272 8 -1.5465696 -3.8666143 8 -0.85254431 
		-1.4624405 8 -2.2405946 -2.6645269 8 -1.5465696 -0.82655478 8 -2.6077228 -4.5065842 
		8.000001 -0.4830575 -2.6645272 8 -1.5465696 -4.107234 8 -0.71362257 -1.2218208 8 
		-2.3795161 -2.6506419 8 -1.5225194 -2.2778902 8 -1.7377274 -2.6506419 8 -1.5225194 
		-3.0233939 8 -1.3073108 -2.6645274 8 -1.5465696 -2.2917755 8 -1.7617776 -2.6645272 
		8 -1.5465691 -3.0372791 8 -1.3313611 -2.6645274 8 -1.5465691 -2.4807301 8 -1.6526849 
		-2.6645274 8 -1.5465691 -2.8483248 8 -1.4404538 -2.6498151 8 -1.5229967 -2.3249085 
		8 -1.7105815 -2.3463886 8 -1.69818 -2.4665413 8 -1.6288097 -2.8403265 8 -1.4130046 
		-2.9302354 8 -1.3610957 -2.9832897 8 -1.3304651 -2.6637006 8 -1.5470469 -2.3387938 
		8 -1.7346318 -2.3602738 8 -1.7222302 -2.4804265 8 -1.6528599 -2.8542118 8 -1.4370549 
		-2.9441206 8 -1.3851459 -2.9971752 8 -1.3545153 -2.6645272 8 -1.5465696 -2.4807301 
		8 -1.6526849 -2.4929833 8 -1.6456106 -2.5991771 8 -1.5842993 -2.7339618 8 -1.5064814 
		-2.8115649 8 -1.4616773 -2.8524089 8 -1.4380958;
	setAttr -s 68 ".vt[0:67]"  0.0045214077 1.3715167 1.3933568e-17 -1.22079349 -0.56992674 1.3933568e-17
		 1.2325592 -0.56992674 1.3933568e-17 0.0045214077 1.11440468 1.3933568e-17 0.96632564 -0.42990047 1.3933568e-17
		 -0.95728278 -0.42990047 1.3933568e-17 0.0045214077 -0.093415342 1.3933568e-17 -0.1180101 -0.2159469 1.3933568e-17
		 0.0045214077 -0.33847836 1.3933568e-17 0.1270529 -0.2159469 1.3933568e-17 0.0045214077 0.75341338 1.3933568e-17
		 -0.1180101 0.66900277 1.3933568e-17 -0.10984129 0.59820676 1.3933568e-17 -0.03904536 -0.00083602447 1.3933568e-17
		 0.050811045 -0.00083602447 1.3933568e-17 0.10254661 0.48928988 1.3933568e-17 0.12977578 0.66900277 1.3933568e-17
		 0.004437787 1.53827548 -2.3094324e-17 -1.38234246 -0.65900081 3.3711981e-17 1.39429986 -0.65900081 3.3711984e-17
		 0.0045214077 0.94591445 5.1345936e-17 0.80591255 -0.34082639 -5.8448462e-18 -0.79686981 -0.34082639 -5.8448433e-18
		 0.004437787 1.53827548 0.016033329 -1.38234246 -0.65900081 0.016033329 1.39429986 -0.65900081 0.016033329
		 0.0045214077 0.94591445 0.016033329 0.80591255 -0.34082639 0.016033329 -0.79686981 -0.34082639 0.016033329
		 0.0045214077 1.3715167 0.016033329 -1.22079349 -0.56992674 0.016033329 1.2325592 -0.56992674 0.016033329
		 0.0045214077 1.11440468 0.016033329 0.96632564 -0.42990047 0.016033329 -0.95728278 -0.42990047 0.016033329
		 0.0045214077 0.032554433 -1.4037343e-17 -0.24397987 -0.2159469 1.3933571e-17 0.0045214077 -0.46444809 4.190447e-17
		 0.25302258 -0.2159469 1.3933571e-17 0.0045214077 0.032554433 0.016033329 -0.24397987 -0.2159469 0.016033329
		 0.0045214077 -0.46444809 0.016033329 0.25302258 -0.2159469 0.016033329 0.0045214077 -0.093415342 0.016033329
		 -0.1180101 -0.2159469 0.016033329 0.0045214077 -0.33847836 0.016033329 0.1270529 -0.2159469 0.016033329
		 0.003970278 0.86119783 -9.9994001e-18 -0.2126343 0.71198153 4.3903777e-18 -0.19831419 0.58787465 1.6227763e-17
		 -0.11821241 -0.089910075 3.3711981e-17 0.13097771 -0.089910075 3.3711981e-17 0.19091715 0.47793701 1.6454402e-17
		 0.22628663 0.71137595 4.5248376e-18 0.003970278 0.86119783 0.016033329 -0.2126343 0.71198153 0.016033329
		 -0.19831419 0.58787465 0.016033329 -0.11821241 -0.089910075 0.016033329 0.13097771 -0.089910075 0.016033329
		 0.19091715 0.47793701 0.016033329 0.22628663 0.71137595 0.016033329 0.0045214077 0.75341338 0.016033329
		 -0.1180101 0.66900277 0.016033329 -0.10984129 0.59820676 0.016033329 -0.03904536 -0.00083602447 0.016033329
		 0.050811045 -0.00083602447 0.016033329 0.10254661 0.48928988 0.016033329 0.12977578 0.66900277 0.016033329;
	setAttr -s 119 ".ed[0:118]"  2 1 1 1 0 1 0 2 1 1 18 1 18 17 0 17 0 1 2 19 1
		 19 18 0 17 19 0 3 4 1 4 21 1 21 20 0 20 3 1 4 5 1 5 22 1 22 21 0 5 3 1 20 22 0 18 24 0
		 24 23 0 23 17 0 19 25 0 25 24 0 23 25 0 21 27 0 27 26 0 26 20 0 22 28 0 28 27 0 26 28 0
		 24 30 1 30 29 1 29 23 1 25 31 1 31 30 1 29 31 1 27 33 1 33 32 1 32 26 1 28 34 1 34 33 1
		 32 34 1 9 8 1 8 7 1 7 6 1 6 9 1 7 36 1 36 35 0 35 6 1 8 37 1 37 36 0 9 38 1 38 37 0
		 35 38 0 36 40 0 40 39 0 39 35 0 37 41 0 41 40 0 38 42 0 42 41 0 39 42 0 40 44 1 44 43 1
		 43 39 1 41 45 1 45 44 1 42 46 1 46 45 1 43 46 1 16 15 1 15 14 1 14 13 1 13 12 1 12 11 1
		 11 10 1 10 16 1 11 48 1 48 47 0 47 10 1 12 49 1 49 48 0 13 50 1 50 49 0 14 51 1 51 50 0
		 15 52 1 52 51 0 16 53 1 53 52 0 47 53 0 48 55 0 55 54 0 54 47 0 49 56 1 56 55 0 50 57 0
		 57 56 0 51 58 0 58 57 0 52 59 1 59 58 0 53 60 0 60 59 0 54 60 0 55 62 1 62 61 1 61 54 1
		 56 63 1 63 62 1 57 64 1 64 63 1 58 65 1 65 64 1 59 66 1 66 65 1 60 67 1 67 66 1 61 67 1;
	setAttr -s 57 -ch 238 ".fc[0:56]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 28 29 30
		h 3 -14 -10 -17
		mu 0 3 31 32 33
		f 4 -2 3 4 5
		mu 0 4 30 29 35 36
		f 4 -1 6 7 -4
		mu 0 4 29 28 34 35
		f 4 -3 -6 8 -7
		mu 0 4 28 30 36 34
		f 4 9 10 11 12
		mu 0 4 33 32 38 39
		f 4 13 14 15 -11
		mu 0 4 32 31 37 38
		f 4 16 -13 17 -15
		mu 0 4 31 33 39 37
		f 4 -5 18 19 20
		mu 0 4 96 97 98 99
		f 4 -8 21 22 -19
		mu 0 4 16 17 18 19
		f 4 -9 -21 23 -22
		mu 0 4 100 96 99 101
		f 4 -12 24 25 26
		mu 0 4 102 103 104 105
		f 4 -16 27 28 -25
		mu 0 4 20 21 22 23
		f 4 -18 -27 29 -28
		mu 0 4 106 102 105 107
		f 4 -20 30 31 32
		mu 0 4 40 41 42 43
		f 4 -23 33 34 -31
		mu 0 4 41 44 45 42
		f 4 -24 -33 35 -34
		mu 0 4 44 40 43 45
		f 4 -26 36 37 38
		mu 0 4 49 50 47 46
		f 4 -29 39 40 -37
		mu 0 4 50 51 48 47
		f 4 -30 -39 41 -40
		mu 0 4 51 49 46 48
		f 3 -32 -35 -36
		mu 0 3 43 42 45
		h 3 -38 -41 -42
		mu 0 3 46 47 48
		f 4 42 43 44 45
		mu 0 4 52 53 54 55
		f 4 -45 46 47 48
		mu 0 4 55 54 58 59
		f 4 -44 49 50 -47
		mu 0 4 54 53 57 58
		f 4 -43 51 52 -50
		mu 0 4 53 52 56 57
		f 4 -46 -49 53 -52
		mu 0 4 52 55 59 56
		f 4 -48 54 55 56
		mu 0 4 108 109 110 111
		f 4 -51 57 58 -55
		mu 0 4 109 112 113 110
		f 4 -53 59 60 -58
		mu 0 4 116 117 118 119
		f 4 -54 -57 61 -60
		mu 0 4 114 108 111 115
		f 4 -56 62 63 64
		mu 0 4 60 61 62 63
		f 4 -59 65 66 -63
		mu 0 4 61 64 65 62
		f 4 -61 67 68 -66
		mu 0 4 64 67 66 65
		f 4 -62 -65 69 -68
		mu 0 4 67 60 63 66
		f 4 -64 -67 -69 -70
		mu 0 4 63 62 65 66
		f 7 70 71 72 73 74 75 76
		mu 0 7 68 69 70 71 72 73 74
		f 4 -76 77 78 79
		mu 0 4 74 73 80 81
		f 4 -75 80 81 -78
		mu 0 4 73 72 79 80
		f 4 -74 82 83 -81
		mu 0 4 72 71 78 79
		f 4 -73 84 85 -83
		mu 0 4 71 70 77 78
		f 4 -72 86 87 -85
		mu 0 4 70 69 76 77
		f 4 -71 88 89 -87
		mu 0 4 69 68 75 76
		f 4 -77 -80 90 -89
		mu 0 4 68 74 81 75
		f 4 -79 91 92 93
		mu 0 4 6 0 3 7
		f 4 -82 94 95 -92
		mu 0 4 0 1 2 3
		f 4 -84 96 97 -95
		mu 0 4 1 4 5 2
		f 4 -86 98 99 -97
		mu 0 4 24 25 26 27
		f 4 -88 100 101 -99
		mu 0 4 8 9 10 11
		f 4 -90 102 103 -101
		mu 0 4 9 12 13 10
		f 4 -91 -94 104 -103
		mu 0 4 12 14 15 13
		f 4 -93 105 106 107
		mu 0 4 82 83 84 85
		f 4 -96 108 109 -106
		mu 0 4 83 86 87 84
		f 4 -98 110 111 -109
		mu 0 4 86 93 88 87
		f 4 -100 112 113 -111
		mu 0 4 93 94 89 88
		f 4 -102 114 115 -113
		mu 0 4 94 95 90 89
		f 4 -104 116 117 -115
		mu 0 4 95 92 91 90
		f 4 -105 -108 118 -117
		mu 0 4 92 82 85 91
		f 7 -107 -110 -112 -114 -116 -118 -119
		mu 0 7 85 84 87 88 89 90 91;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Viewer_Curve__name__FK_IK__side__StraightCurve" -p "Viewer__StraightIK__FK_IK__side__grp";
	rename -uid "C117C67F-4345-FE24-92CF-328B810DB3F1";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0 0.10370016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode nurbsCurve -n "Viewer_Curve__name__FK_IK__side__StraightCurveShape" -p
		 "Viewer_Curve__name__FK_IK__side__StraightCurve";
	rename -uid "16FD9A31-C042-4E8B-B9C2-7EA57CFF85BF";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr ".ls" 16;
createNode nurbsCurve -n "Viewer_Curve__name__FK_IK__side__StraightCurveShapeOrig" 
		-p "Viewer_Curve__name__FK_IK__side__StraightCurve";
	rename -uid "6ED9F61C-0D41-B915-4C43-029180AE091F";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 0
		0 8 0
		0 16 0
		;
createNode transform -n "Viewer_DRV__name__FK_IK__side__IK_Length" -p "Viewer__StraightIK__FK_IK__side__grp";
	rename -uid "AE82BA73-F741-7711-3102-CDA9ED5051E9";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.63349968 0.26999992 3 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode nurbsCurve -n "Viewer_DRV__name__FK_IK__side__IK_LengthShape" -p "Viewer_DRV__name__FK_IK__side__IK_Length";
	rename -uid "EA1B6263-DB47-A442-6A7A-2996CD57A64A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr ".ls" 3;
createNode nurbsCurve -n "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig" -p "Viewer_DRV__name__FK_IK__side__IK_Length";
	rename -uid "F2D77860-364C-9BF5-3CCF-DBAD08DCBC0F";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 0
		0 8 0
		0 16 0
		;
createNode transform -n "Viewer_DRV__name__FK_IK__side__IK_Angle" -p "Viewer__StraightIK__FK_IK__side__grp";
	rename -uid "EFF03FC7-FF4F-A5BA-E1C5-65AD00659BC8";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.63349968 0.26999992 3 ;
createNode nurbsCurve -n "Viewer_DRV__name__FK_IK__side__IK_AngleShape" -p "Viewer_DRV__name__FK_IK__side__IK_Angle";
	rename -uid "61B21CB0-D246-9670-1844-2EB4D062FE89";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".ls" 4;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 2
		2
		9.1945772612761781e-09 8 8.5335502250159413e-16
		2.1283051410136981e-06 8 3.142724267490849e-07
		;
createNode nurbsCurve -n "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig" -p "Viewer_DRV__name__FK_IK__side__IK_Angle";
	rename -uid "C7A25969-A94E-8E32-B4E3-92B7BB20C12D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 0
		0 8 0
		0 16 0
		;
createNode dagContainer -n "Component__name__FK_IK__side__Asset" -p "Component__name__FK_IK__side__grp";
	rename -uid "8E45473C-B74B-7C5C-F34A-678B4FE6F486";
	addAttr -ci true -uac -sn "Component_Outliner_Color" -ln "Component_Outliner_Color" 
		-nn "Component_Outliner_Color" -at "float3" -nc 3;
	addAttr -ci true -sn "Component_Outliner_Color_R" -ln "Component_Outliner_Color_R" 
		-nn "Component_Outliner_Color R" -at "float" -p "Component_Outliner_Color";
	addAttr -ci true -sn "Component_Outliner_Color_G" -ln "Component_Outliner_Color_G" 
		-nn "Component_Outliner_Color G" -at "float" -p "Component_Outliner_Color";
	addAttr -ci true -sn "Component_Outliner_Color_B" -ln "Component_Outliner_Color_B" 
		-nn "Component_Outliner_Color B" -at "float" -p "Component_Outliner_Color";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".isc" yes;
	setAttr ".bbx" yes;
	setAttr ".icn" -type "string" "puppetAdd.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/09/16 17:33:52";
	setAttr ".uocol" yes;
	setAttr ".Component_Outliner_Color" -type "float3" 0.93199998 0.56572396 0.80070841 ;
	setAttr -cb on ".Component_Name" -type "string" "Leg";
	setAttr -cb on ".Component_Type" -type "string" "FK_IK";
	setAttr -cb on ".Component_Side" -type "string" "L";
createNode dagContainer -n "Setup__name__FK_IK__side__Asset" -p "Component__name__FK_IK__side__Asset";
	rename -uid "C30A6964-8642-7161-A671-649917839BFD";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".isc" yes;
	setAttr ".icn" -type "string" "tePoseOffset.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/09/18 17:43:33";
createNode dagContainer -n "System__name__FK_IK__side__Asset" -p "Component__name__FK_IK__side__Asset";
	rename -uid "E8396078-0945-161B-FF76-D7817A85F597";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".isc" yes;
	setAttr ".bbx" yes;
	setAttr ".icn" -type "string" "falloff_primitive.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/09/16 15:12:44";
createNode dagContainer -n "Viewer__name__FK_IK__side__Asset" -p "Component__name__FK_IK__side__Asset";
	rename -uid "02C0E008-B941-9568-160E-9D9CE6B83685";
	addAttr -ci true -sn "FK_Offset" -ln "FK_Offset" -at "double3" -nc 3;
	addAttr -ci true -sn "FK_OffsetX" -ln "FK_OffsetX" -at "double" -p "FK_Offset";
	addAttr -ci true -sn "FK_OffsetY" -ln "FK_OffsetY" -at "double" -p "FK_Offset";
	addAttr -ci true -sn "FK_OffsetZ" -ln "FK_OffsetZ" -at "double" -p "FK_Offset";
	addAttr -ci true -sn "IK_Offset" -ln "IK_Offset" -at "double3" -nc 3;
	addAttr -ci true -sn "IK_OffsetX" -ln "IK_OffsetX" -at "double" -p "IK_Offset";
	addAttr -ci true -sn "IK_OffsetY" -ln "IK_OffsetY" -at "double" -p "IK_Offset";
	addAttr -ci true -sn "IK_OffsetZ" -ln "IK_OffsetZ" -at "double" -p "IK_Offset";
	addAttr -ci true -sn "Line_Width" -ln "Line_Width" -dv -1 -min -1 -max 10 -at "long";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".isc" yes;
	setAttr ".bbx" yes;
	setAttr ".icn" -type "string" "QR_xRay.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/09/15 19:18:38";
	setAttr -k on ".FK_Offset" -type "double3" -1 0 0 ;
	setAttr -k on ".FK_Offset";
	setAttr -k on ".FK_OffsetX";
	setAttr -k on ".FK_OffsetY";
	setAttr -k on ".FK_OffsetZ";
	setAttr -k on ".IK_Offset" -type "double3" 1 0 0 ;
	setAttr -k on ".IK_Offset";
	setAttr -k on ".IK_OffsetX";
	setAttr -k on ".IK_OffsetY";
	setAttr -k on ".IK_OffsetZ";
	setAttr -cb on ".Line_Width";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "43CDD548-6D4D-668F-6FFC-C2878B3BA7C2";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "D9E04CDC-5E42-BEFE-CCF6-468658C06A97";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "788FFAC2-3E4D-F756-05D5-3C8C2B0ACC58";
createNode displayLayerManager -n "layerManager";
	rename -uid "574703AD-9B48-D1AA-40FA-3A888E38DB71";
	setAttr ".cdl" 1;
	setAttr -s 3 ".dli[1:2]"  1 2;
createNode displayLayer -n "defaultLayer";
	rename -uid "E76B2F26-A049-A9FE-6919-3D9A492B700E";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "69F75D07-C841-D469-B821-71BE8ABACEF6";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "BB8BDD5A-DF47-9BCD-1E3E-E89BD7683AD0";
	setAttr ".g" yes;
createNode ikRPsolver -n "ikRPsolver";
	rename -uid "B64CD71A-094E-8DEA-BD7E-F4ADD3BDD75B";
createNode objectSet -n "Viewer__FK_IK__NodeGroup";
	rename -uid "31900C73-2049-0BB8-1C80-EEB1D7A500F0";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 13 ".dsm";
	setAttr -s 8 ".dnsm";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "0E0AE512-1D44-DD4E-01FB-0A8412DAF24C";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 250 -ast 0 -aet 250 ";
	setAttr ".st" 6;
createNode hyperLayout -n "hyperLayout1";
	rename -uid "9C0AEE27-8C49-B2CB-7F4F-928F23A903BA";
	setAttr ".ihi" 0;
createNode multMatrix -n "Viewer__name__FK_Upper__side__MultMatrix";
	rename -uid "90A3F07B-A748-8EE1-462E-2AA69F4915EF";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name__FK_Lower__side__MultMatrix";
	rename -uid "5B7DD279-0045-4751-2039-E297C2B57DAD";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name__FK_End__side__MultMatrix";
	rename -uid "3CCD185D-3249-37E4-3FC9-B5934AA867DE";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode composeMatrix -n "Viewer__name__FK_Offset__side__ComposeMatrix";
	rename -uid "F70A578F-C545-6700-98B2-E1A32B6B5B3B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode composeMatrix -n "Viewer__name__IK_Offset__side__ComposeMatrix";
	rename -uid "EBE8EC38-0040-58D0-B3A6-E6A8AE6C339C";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode multMatrix -n "Viewer__name__IK_Upper__side__MultMatrix";
	rename -uid "BED1605A-AF45-1E16-EECC-45AEF7EFB3BB";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name__IK_Lower__side__MultMatrix";
	rename -uid "7260A13F-004F-5728-732B-4CAB4A566431";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name__IK_End__side__MultMatrix";
	rename -uid "0B095533-184F-C3D7-0E65-808A1FBA54B5";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode parentMatrix -n "PRN__name__FK_IK_Upper__side__ParentMatrix";
	rename -uid "9BDDB48A-8944-4086-403E-2FB2371540B8";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".tgt";
	setAttr ".tgt[1].ofm" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999989 0 0
		 0 0 0.99999999999999978 0 0 0 0 1;
createNode parentMatrix -n "PRN__name__FK_IK_Lower__side__ParentMatrix";
	rename -uid "B49B5485-C440-3A5C-1304-F982908339B2";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".tgt";
createNode multMatrix -n "DRV__name__IK_Lower__side__MultMatrix";
	rename -uid "027FD6B2-E845-1B92-9307-12B3275E5F8D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode multMatrix -n "DRV__name__FK_Lower__side__MultMatrix";
	rename -uid "A98B46E1-7342-A3CE-776E-69BCE7350804";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode setRange -n "CTR__name__FK_IK__side__Properties__SetRange";
	rename -uid "DD03E95B-9F42-51D4-F552-BD8486FCC884";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".n" -type "float3" 1 0 0 ;
	setAttr ".m" -type "float3" 0 1 0 ;
	setAttr ".om" -type "float3" 10 10 0 ;
createNode parentMatrix -n "PRN__name__FK_IK_End__side__ParentMatrix";
	rename -uid "F1DDC055-CB49-2E0C-98A3-16A59941B27A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".tgt";
createNode multMatrix -n "DRV__name__FK_End__side__MultMatrix";
	rename -uid "C76DFF39-5240-A034-73F1-3A8EC2BC512C";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode multMatrix -n "DRV__name__IK_End__side__MultMatrix";
	rename -uid "A8825917-2649-8F95-F761-2AB7A68550FF";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode hyperLayout -n "hyperLayout2";
	rename -uid "1E5F1D7D-1747-25BE-9218-3DAD777EB4F7";
	setAttr ".ihi" 0;
createNode objectSet -n "System__name_FK_IK_NodeGroup";
	rename -uid "E9CA2955-274C-9AEF-23A9-099022C77D9E";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 25 ".dsm";
	setAttr -s 10 ".dnsm";
createNode multMatrix -n "Offset_CTR__name__FK_Lower__side__MultMatrix";
	rename -uid "CEE7A41C-5847-23FF-DCAE-54A69718BB87";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 3 ".i";
createNode multMatrix -n "Offset_CTR__name__FK_End__side__MultMatrix";
	rename -uid "3D30D896-A342-859D-8F6E-9282F3E0F493";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 3 ".i";
createNode hyperLayout -n "hyperLayout3";
	rename -uid "996F855E-1549-DC46-6ABF-44A47639D4AD";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
createNode objectSet -n "Component__name__FK_IK__side__All_Nodes";
	rename -uid "5673A7A5-CB4F-CFA3-3AD6-9680319CA01E";
	addAttr -ci true -uac -sn "Component_Outliner_Color" -ln "Component_Outliner_Color" 
		-nn "Component_Outliner_Color" -at "float3" -nc 3;
	addAttr -ci true -sn "Component_Outliner_Color_R" -ln "Component_Outliner_Color_R" 
		-nn "Component_Outliner_Color R" -at "float" -p "Component_Outliner_Color";
	addAttr -ci true -sn "Component_Outliner_Color_G" -ln "Component_Outliner_Color_G" 
		-nn "Component_Outliner_Color G" -at "float" -p "Component_Outliner_Color";
	addAttr -ci true -sn "Component_Outliner_Color_B" -ln "Component_Outliner_Color_B" 
		-nn "Component_Outliner_Color B" -at "float" -p "Component_Outliner_Color";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 120 ".dsm";
	setAttr -s 38 ".dnsm";
createNode skinCluster -n "SkinCluster__CTR__name__IK_Pole__side__crvShape";
	rename -uid "72A5F19F-ED4C-2ABC-3093-6FA2F7057690";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1;
	setAttr -s 2 ".pm";
	setAttr ".pm[0]" -type "matrix" -2.6594138312817747e-07 0.99999999999993905 -2.2644166586921998e-07 0
		 -0.99999999999996358 -2.6594139370278597e-07 -4.6759823613044684e-08 0 -4.6759883833254066e-08 2.2644165343383955e-07 0.99999999999997335 0
		 8.0000000000005738 5.2802310613573114e-09 5.9806077363663816e-08 1;
	setAttr ".pm[1]" -type "matrix" 7.7715611723760958e-16 1 0 0 -1 7.7715611723760958e-16 0 0
		 0 0 1 0 8 -3.1427308666565068e-07 -11 1;
	setAttr ".gm" -type "matrix" 7.7715611723760958e-16 -1 0 0 1 7.7715611723760958e-16 0 0
		 0 0 1 0 3.1427308044840174e-07 8 11 1;
	setAttr -s 2 ".ma";
	setAttr -s 2 ".dpf[0:1]"  2 2;
	setAttr -s 2 ".lw";
	setAttr -s 2 ".lw";
	setAttr ".mmi" yes;
	setAttr ".rsmd" 1;
	setAttr ".ucm" yes;
	setAttr -s 2 ".ifcl";
	setAttr -s 2 ".ifcl";
createNode multMatrix -n "DRV__name__IK_Pole__side__MultMatrix";
	rename -uid "7E6A8E10-D54F-4378-241C-DCB5075D5B0A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode shadingEngine -n "lambert1SG";
	rename -uid "0D3C6BDA-E642-58D2-3ACD-06AE8E55B32B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "A6F70DD9-734F-1D96-4444-739F7C13DAF3";
createNode standardSurface -n "M_Pivot";
	rename -uid "D2BB24B0-E741-F833-DA44-E5B0DBC03CE9";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".sr" 1;
	setAttr ".t" 1;
	setAttr ".e" 0.20000000298023224;
	setAttr ".ec" -type "float3" 1 0.9684 0 ;
createNode shadingEngine -n "SG_Pivot";
	rename -uid "F71F7BAE-AB48-8BC7-25DD-F7AE0858BE9C";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "INF_Pivot";
	rename -uid "B1164D80-3743-502C-EB78-BE8E41DC77E1";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode standardSurface -n "M_Warning_Red_Saturated";
	rename -uid "20BB9C9B-324C-9DC8-0173-5A8E0F792F1B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".b" 0;
	setAttr ".bc" -type "float3" 0 0 0 ;
	setAttr ".s" 0;
	setAttr ".e" 1;
	setAttr ".ec" -type "float3" 2 0 0 ;
createNode shadingEngine -n "SG_Warning_Red_Saturated";
	rename -uid "9C0798CD-B445-ED7D-9A3F-B1BA78DB203A";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "INF_Warning_Red_Saturated";
	rename -uid "C606E344-4741-2657-9EA3-D1B71453E159";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode standardSurface -n "M_Warning_Red_Bright";
	rename -uid "15C84438-EF4E-D846-7426-A0B2D437FE4D";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".b" 0;
	setAttr ".bc" -type "float3" 0 0 0 ;
	setAttr ".s" 0;
	setAttr ".e" 1;
	setAttr ".ec" -type "float3" 3 0.33000004 0.41900003 ;
createNode shadingEngine -n "SG_Warning_Red_Bright";
	rename -uid "95BFF45B-2244-77DB-A393-E6963BC08FC3";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "INF_Warning_Red_Bright";
	rename -uid "495EC402-AA44-7E48-935D-B19E9EF9FD67";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode skinCluster -n "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve";
	rename -uid "D7E00B79-BE45-1013-F19B-CA8BCF8A1D00";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 3 ".wl";
	setAttr ".wl[0:2].w"
		1 2 1
		1 1 1
		1 0 1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" 2.6488882463417003e-07 0.99999999999993927 -2.2644164445644185e-07 0
		 -0.99999999999996414 2.6488883354347914e-07 3.9283993554806479e-08 0 3.9284053536667135e-08 2.2644163405054289e-07 0.99999999999997358 0
		 15.999999999999426 -4.2382213366956663e-06 -6.2854389687690366e-07 1;
	setAttr ".pm[1]" -type "matrix" -2.663339140294995e-07 0.99999999999993905 -2.2644166737284817e-07 0
		 -0.99999999999996358 -2.6633392460412409e-07 -4.6759894349620911e-08 0 -4.6759954658716045e-08 2.2644165491909427e-07 0.99999999999997335 0
		 8.0000000000005738 1.1560725482768207e-08 5.9807206358588533e-08 1;
	setAttr ".pm[2]" -type "matrix" -2.663339140294995e-07 0.99999999999993905 -2.2644166737284817e-07 0
		 -0.99999999999996358 -2.6633392460412409e-07 -4.6759894349620911e-08 0 -4.6759954658716045e-08 2.2644165491909427e-07 0.99999999999997335 0
		 5.7676945204117566e-13 1.1560722637462045e-08 5.9807206358589049e-08 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  2 2 2;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode dagPose -n "bindPose2";
	rename -uid "C3E535E8-DD45-E6EA-183D-3BB468BD5AD1";
	setAttr -s 6 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 2.6528135510517359e-07 -0.99999999999996403 3.9284124013341519e-08 0
		 0.99999999999993916 2.6528136398695779e-07 2.2644163256525081e-07 0 -2.264416429865887e-07 3.9284063942595972e-08 0.99999999999997358 0
		 0 16 0 1;
	setAttr ".wm[3]" -type "matrix" 2.6488882464794045e-07 -0.99999999999996414 3.9284053536667161e-08 0
		 0.99999999999993927 2.6488883352970872e-07 2.2644163405054286e-07 0 -2.2644164445644188e-07 3.9283993554806459e-08 0.99999999999997358 0
		 0 16 0 1;
	setAttr ".wm[4]" -type "matrix" -2.6633391401572907e-07 -0.99999999999996336 -4.6759954658716005e-08 0
		 0.99999999999993883 -2.6633392461789446e-07 2.2644165491909417e-07 0 -2.264416673728482e-07 -4.6759894349620925e-08 0.99999999999997324 0
		 2.1191106001860615e-06 8.0000000000002878 3.1427242829333809e-07 1;
	setAttr ".wm[5]" -type "matrix" -2.6633391401572907e-07 -0.99999999999996336 -4.6759954658716005e-08 0
		 0.99999999999993883 -2.6633392461789446e-07 2.2644165491909417e-07 0 -2.264416673728482e-07 -4.6759894349620925e-08 0.99999999999997324 0
		 -1.1560709094464195e-08 5.8264504332328215e-13 -5.9807208976389636e-08 1;
	setAttr -s 6 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 2.6572578050048972e-07 -7.0681366646458273e-14
		 2.6488882403730503e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1.3286288951531204e-07 1.7623023646340621e-14 -1.3264067724727083e-07 0.99999999999998235 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 5.586746895394004e-16 8.6043887904430454e-08
		 -6.0979102681642036e-07 0 8 3.0025378274715735e-15 1.0587911840678754e-22 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 3.9284134334405239e-08 0.99999999999999922 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 8 2.8453064201213753e-15
		 -3.1763735522036263e-22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 6 ".m";
	setAttr -s 6 ".p";
	setAttr -s 6 ".g[0:5]" yes yes yes no no no;
	setAttr ".bp" yes;
createNode skinCluster -n "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length";
	rename -uid "F150F554-5B41-C263-613F-B2A1CE3DABCB";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 3 ".wl";
	setAttr ".wl[0:2].w"
		2 1 0.5 2 0.5
		2 0 0.5 1 0.5
		1 0 1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" 2.6488882463417003e-07 0.99999999999993927 -2.2644164445644185e-07 0
		 -0.99999999999996414 2.6488883354347914e-07 3.9283993554806479e-08 0 3.9284053536667135e-08 2.2644163405054289e-07 0.99999999999997358 0
		 15.999999999999426 -4.2382213366956663e-06 -6.2854389687690366e-07 1;
	setAttr ".pm[1]" -type "matrix" -2.663339140294995e-07 0.99999999999993905 -2.2644166737284817e-07 0
		 -0.99999999999996358 -2.6633392460412409e-07 -4.6759894349620911e-08 0 -4.6759954658716045e-08 2.2644165491909427e-07 0.99999999999997335 0
		 8.0000000000005738 1.1560725482768207e-08 5.9807206358588533e-08 1;
	setAttr ".pm[2]" -type "matrix" -2.663339140294995e-07 0.99999999999993905 -2.2644166737284817e-07 0
		 -0.99999999999996358 -2.6633392460412409e-07 -4.6759894349620911e-08 0 -4.6759954658716045e-08 2.2644165491909427e-07 0.99999999999997335 0
		 5.7676945204117566e-13 1.1560722637462045e-08 5.9807206358589049e-08 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  2 2 2;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode decomposeMatrix -n "PRN__name__FK_IK_Lower__side__DecompMatrix";
	rename -uid "32579244-7249-0ED7-60DC-A0A2196D5B26";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode distanceBetween -n "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween";
	rename -uid "94D2DC18-7547-CB40-38ED-84BC96260BBA";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
createNode setRange -n "Viewer_StraightIK__name__FK_IK__side__Set_Range";
	rename -uid "E3A916AF-E84E-F1C5-E39A-72BFE371D9EB";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode floatLogic -n "Viewer_StraightIK__name__FK_IK__side__FloatLogic";
	rename -uid "62E1EF76-D244-D027-414B-B88592C315EF";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr "._ab" 0.10000000149011612;
	setAttr "._op" 2;
createNode multMatrix -n "Offset_CTR__name__FK_Upper__side__MultMatrix";
	rename -uid "F2DCCE44-D04E-2728-F828-919F7716EE55";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr -s 2 ".i";
createNode objectSet -n "NodeTree__name_FK_IK__FK_Matrix";
	rename -uid "0EB7C564-1644-7AF4-556A-7F8882FE905B";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr -s 3 ".dnsm";
createNode nodeGraphEditorBookmarks -n "MayaNodeEditorBookmarks";
	rename -uid "9E45F05F-7B45-212B-6E19-DE8995E3B269";
createNode nodeGraphEditorBookmarkInfo -n "nodeView1";
	rename -uid "5420E07F-EF4B-BA2A-FEC5-5EADD0F7069C";
	setAttr ".nm" -type "string" "FK_Matrix";
	setAttr ".vl" -type "double2" 528.55738725052095 1411.8480007730984 ;
	setAttr ".vh" -type "double2" 2514.0858585104993 2447.6232421907703 ;
	setAttr -s 12 ".ni";
	setAttr ".ni[0].x" 1335.7142333984375;
	setAttr ".ni[0].y" 2385.71435546875;
	setAttr ".ni[0].nvs" 18313;
	setAttr ".ni[1].x" 1837.630126953125;
	setAttr ".ni[1].y" 1773.89697265625;
	setAttr ".ni[1].nvs" 18313;
	setAttr ".ni[2].x" 1335.7142333984375;
	setAttr ".ni[2].y" 2158.571533203125;
	setAttr ".ni[2].nvs" 18313;
	setAttr ".ni[3].x" 642.85711669921875;
	setAttr ".ni[3].y" 2128.571533203125;
	setAttr ".ni[3].nvs" 18313;
	setAttr ".ni[4].x" 1819.0587158203125;
	setAttr ".ni[4].y" 1932.4683837890625;
	setAttr ".ni[4].nvs" 18313;
	setAttr ".ni[5].x" 2204.28564453125;
	setAttr ".ni[5].y" 2121.428466796875;
	setAttr ".ni[5].nvs" 18313;
	setAttr ".ni[6].x" 1305.5728759765625;
	setAttr ".ni[6].y" 1848.1129150390625;
	setAttr ".ni[6].nvs" 18313;
	setAttr ".ni[7].x" 1014.2857055664062;
	setAttr ".ni[7].y" 2045.7142333984375;
	setAttr ".ni[7].nvs" 18313;
	setAttr ".ni[8].x" 2204.28564453125;
	setAttr ".ni[8].y" 2368.571533203125;
	setAttr ".ni[8].nvs" 18313;
	setAttr ".ni[9].x" 1778.5714111328125;
	setAttr ".ni[9].y" 2370;
	setAttr ".ni[9].nvs" 18313;
	setAttr ".ni[10].x" 1883.344482421875;
	setAttr ".ni[10].y" 1579.611328125;
	setAttr ".ni[10].nvs" 18313;
	setAttr ".ni[11].x" 1014.2857055664062;
	setAttr ".ni[11].y" 2272.857177734375;
	setAttr ".ni[11].nvs" 18313;
createNode hyperLayout -n "hyperLayout4";
	rename -uid "8AFF5F22-C749-A71B-5E8A-6F8EDB73977C";
	setAttr ".ihi" 0;
createNode objectSet -n "Setup__name__FK_IK__side__Set";
	rename -uid "81DCD1F1-404E-4380-4E8A-048DE4AC3F94";
	addAttr -ci true -sn "Component_Name" -ln "Component_Name" -nn "Component_Name" 
		-dt "string";
	addAttr -ci true -sn "Component_Type" -ln "Component_Type" -nn "Component_Type" 
		-dt "string";
	addAttr -ci true -sn "Component_Side" -ln "Component_Side" -nn "Component_Side" 
		-dt "string";
	setAttr ".ihi" 0;
	setAttr -s 19 ".dsm";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "6B38F76F-0743-3E2D-9536-6585D01E16BA";
	setAttr -s 4 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1162.2710160865613 2809.5236978833682 ;
	setAttr ".tgi[0].vh" -type "double2" 1514.6519544651528 3534.5236690744573 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 430.62384033203125;
	setAttr ".tgi[0].ni[0].y" 3457.934814453125;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -285.71429443359375;
	setAttr ".tgi[0].ni[1].y" 3185.71435546875;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -285.71429443359375;
	setAttr ".tgi[0].ni[2].y" 3284.28564453125;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 21.428571701049805;
	setAttr ".tgi[0].ni[3].y" 3484.28564453125;
	setAttr ".tgi[0].ni[3].nvs" 18306;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -3617.9485741843587 -32.142855865617356 ;
	setAttr ".tgi[1].vh" -type "double2" 694.13916655658215 1135.7142405850541 ;
	setAttr -s 12 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -2610;
	setAttr ".tgi[1].ni[0].y" 395.71429443359375;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" -1944.2857666015625;
	setAttr ".tgi[1].ni[1].y" 1212.857177734375;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" -1088.5714111328125;
	setAttr ".tgi[1].ni[2].y" 654.28570556640625;
	setAttr ".tgi[1].ni[2].nvs" 18305;
	setAttr ".tgi[1].ni[3].x" -1944.2857666015625;
	setAttr ".tgi[1].ni[3].y" 505.71429443359375;
	setAttr ".tgi[1].ni[3].nvs" 18305;
	setAttr ".tgi[1].ni[4].x" -1509.6441650390625;
	setAttr ".tgi[1].ni[4].y" 679.47979736328125;
	setAttr ".tgi[1].ni[4].nvs" 18305;
	setAttr ".tgi[1].ni[5].x" -2302.857177734375;
	setAttr ".tgi[1].ni[5].y" 345.71429443359375;
	setAttr ".tgi[1].ni[5].nvs" 18305;
	setAttr ".tgi[1].ni[6].x" -1944.2857666015625;
	setAttr ".tgi[1].ni[6].y" 315.71429443359375;
	setAttr ".tgi[1].ni[6].nvs" 18305;
	setAttr ".tgi[1].ni[7].x" -1525.3638916015625;
	setAttr ".tgi[1].ni[7].y" 983.44757080078125;
	setAttr ".tgi[1].ni[7].nvs" 18305;
	setAttr ".tgi[1].ni[8].x" -1088.5714111328125;
	setAttr ".tgi[1].ni[8].y" 844.28570556640625;
	setAttr ".tgi[1].ni[8].nvs" 18305;
	setAttr ".tgi[1].ni[9].x" -1944.2857666015625;
	setAttr ".tgi[1].ni[9].y" 880;
	setAttr ".tgi[1].ni[9].nvs" 18305;
	setAttr ".tgi[1].ni[10].x" -1088.5714111328125;
	setAttr ".tgi[1].ni[10].y" 428.57144165039062;
	setAttr ".tgi[1].ni[10].nvs" 18305;
	setAttr ".tgi[1].ni[11].x" -1505.7142333984375;
	setAttr ".tgi[1].ni[11].y" 410;
	setAttr ".tgi[1].ni[11].nvs" 18305;
	setAttr ".tgi[2].tn" -type "string" "FK_Matrix";
	setAttr ".tgi[2].vl" -type "double2" -513.78203086618748 1532.1427962609728 ;
	setAttr ".tgi[2].vh" -type "double2" 3341.1628708971193 2576.1903738218684 ;
	setAttr -s 12 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 978.28619384765625;
	setAttr ".tgi[2].ni[0].y" 2054.844970703125;
	setAttr ".tgi[2].ni[0].nvs" 18313;
	setAttr ".tgi[2].ni[1].x" 1386.625244140625;
	setAttr ".tgi[2].ni[1].y" 2234.060302734375;
	setAttr ".tgi[2].ni[1].nvs" 18313;
	setAttr ".tgi[2].ni[2].x" 1377.9356689453125;
	setAttr ".tgi[2].ni[2].y" 2446.306640625;
	setAttr ".tgi[2].ni[2].nvs" 18313;
	setAttr ".tgi[2].ni[3].x" 1718.9281005859375;
	setAttr ".tgi[2].ni[3].y" 2109.793701171875;
	setAttr ".tgi[2].ni[3].nvs" 18313;
	setAttr ".tgi[2].ni[4].x" 983.25164794921875;
	setAttr ".tgi[2].ni[4].y" 2385.821044921875;
	setAttr ".tgi[2].ni[4].nvs" 18313;
	setAttr ".tgi[2].ni[5].x" 1723.2393798828125;
	setAttr ".tgi[2].ni[5].y" 2395.15869140625;
	setAttr ".tgi[2].ni[5].nvs" 18313;
	setAttr ".tgi[2].ni[6].x" 975.37054443359375;
	setAttr ".tgi[2].ni[6].y" 2227.9697265625;
	setAttr ".tgi[2].ni[6].nvs" 18313;
	setAttr ".tgi[2].ni[7].x" 2540.2412109375;
	setAttr ".tgi[2].ni[7].y" 1652.2435302734375;
	setAttr ".tgi[2].ni[7].nvs" 18313;
	setAttr ".tgi[2].ni[8].x" 2007.6639404296875;
	setAttr ".tgi[2].ni[8].y" 2403.6826171875;
	setAttr ".tgi[2].ni[8].nvs" 18313;
	setAttr ".tgi[2].ni[9].x" 2521.669677734375;
	setAttr ".tgi[2].ni[9].y" 1810.81494140625;
	setAttr ".tgi[2].ni[9].nvs" 18313;
	setAttr ".tgi[2].ni[10].x" 683.82208251953125;
	setAttr ".tgi[2].ni[10].y" 2352.016845703125;
	setAttr ".tgi[2].ni[10].nvs" 18313;
	setAttr ".tgi[2].ni[11].x" 2585.95556640625;
	setAttr ".tgi[2].ni[11].y" 1457.9578857421875;
	setAttr ".tgi[2].ni[11].nvs" 18313;
	setAttr ".tgi[3].tn" -type "string" "Untitled_3";
	setAttr ".tgi[3].vl" -type "double2" -848.60749176428533 -964.7489410752471 ;
	setAttr ".tgi[3].vh" -type "double2" 101.81264964437446 -468.95063565428404 ;
	setAttr ".tgi[3].ni[0].x" -293.02520751953125;
	setAttr ".tgi[3].ni[0].y" -561.260498046875;
	setAttr ".tgi[3].ni[0].nvs" 18304;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "F5D04A6F-6546-D01D-44A4-28A7CDAB0A01";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 4747.0694084380057 -778.57139763378086 ;
	setAttr ".tgi[0].vh" -type "double2" 6391.0253870691085 -333.33332008785732 ;
	setAttr -s 5 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 5345.71435546875;
	setAttr ".tgi[0].ni[0].y" -524.28570556640625;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 5652.85693359375;
	setAttr ".tgi[0].ni[1].y" -194.28572082519531;
	setAttr ".tgi[0].ni[1].nvs" 2066;
	setAttr ".tgi[0].ni[2].x" 5420;
	setAttr ".tgi[0].ni[2].y" -972.85711669921875;
	setAttr ".tgi[0].ni[2].nvs" 2066;
	setAttr ".tgi[0].ni[3].x" 5420;
	setAttr ".tgi[0].ni[3].y" -268.57144165039062;
	setAttr ".tgi[0].ni[3].nvs" 2066;
	setAttr ".tgi[0].ni[4].x" 5420;
	setAttr ".tgi[0].ni[4].y" 435.71429443359375;
	setAttr ".tgi[0].ni[4].nvs" 2066;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 0;
	setAttr -av ".unw";
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
	setAttr -av -k on ".hwi";
	setAttr -k on ".csvd";
	setAttr -av -k on ".ta" 3;
	setAttr -av -k on ".tq" 1;
	setAttr -k on ".ts";
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
	setAttr -s 6 ".st";
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
	setAttr -s 8 ".s";
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
	setAttr -s 18 ".u";
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
	setAttr -av ".pa";
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar" 1.7777777910232544;
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Component__name__FK_IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Component__name__FK_IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Component__name__FK_IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Component__name__FK_IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Component__name__FK_IK__side__grp.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DAG_Nodes__name__FK_IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DAG_Nodes__name__FK_IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DAG_Nodes__name__FK_IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DAG_Nodes__name__FK_IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DAG_Nodes__name__FK_IK__side__grp.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Setup_Positions__name__FK_IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Setup_Positions__name__FK_IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Setup_Positions__name__FK_IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Setup_Positions__name__FK_IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Setup_Positions__name__FK_IK__side__grp.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_Position__name__FK_IK_Upper__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_Position__name__FK_IK_Upper__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_Position__name__FK_IK_Upper__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_Position__name__FK_IK_Upper__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_Position__name__FK_IK_Upper__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_IK_Upper__side__pos.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_IK_Upper__side__pos.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_IK_Upper__side__pos.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_IK_Upper__side__pos.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_IK_Upper__side__pos.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.Line_Width_Outline" "Position__name__FK_Upper__side__outline1_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Upper__side__outline1_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Upper__side__outline1_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Upper__side__outline1_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Upper__side__outline1_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Upper__side__outline1_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.Line_Width_Axes" "Position__name__FK_Upper__side__Axis_Y_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Upper__side__Axis_Y_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Upper__side__Axis_Y_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Upper__side__Axis_Y_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Upper__side__Axis_Y_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Upper__side__Axis_Y_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.Line_Width_Axes" "Position__name__FK_Upper__side__Axis_Z_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Upper__side__Axis_Z_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Upper__side__Axis_Z_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Upper__side__Axis_Z_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Upper__side__Axis_Z_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Upper__side__Axis_Z_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.Line_Width_Axes" "Position__name__FK_Upper__side__Axis_X_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Upper__side__Axis_X_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Upper__side__Axis_X_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Upper__side__Axis_X_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Upper__side__Axis_X_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Upper__side__Axis_X_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.Line_Width_Outline" "Position__name__FK_Upper__side__outline2_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Upper__side__outline2_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Upper__side__outline2_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Upper__side__outline2_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Upper__side__outline2_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Upper__side__outline2_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.Line_Width_Outline" "Position__name__FK_Upper__side__outline3_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Upper__side__outline3_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Upper__side__outline3_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Upper__side__outline3_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Upper__side__outline3_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Upper__side__outline3_Shape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_Position__name__FK_IK_Lower__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_Position__name__FK_IK_Lower__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_Position__name__FK_IK_Lower__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_Position__name__FK_IK_Lower__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_Position__name__FK_IK_Lower__side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_IK_Lower__side__pos.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_IK_Lower__side__pos.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_IK_Lower__side__pos.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_IK_Lower__side__pos.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_IK_Lower__side__pos.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Lower__side__outline1_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Lower__side__outline1_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Lower__side__outline1_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Lower__side__outline1_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Lower__side__outline1_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.Line_Width_Outline" "Position__name__FK_Lower__side__outline1_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Lower__side__Axis_Y_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Lower__side__Axis_Y_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Lower__side__Axis_Y_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Lower__side__Axis_Y_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Lower__side__Axis_Y_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.Line_Width_Axes" "Position__name__FK_Lower__side__Axis_Y_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Lower__side__Axis_Z_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Lower__side__Axis_Z_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Lower__side__Axis_Z_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Lower__side__Axis_Z_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Lower__side__Axis_Z_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.Line_Width_Axes" "Position__name__FK_Lower__side__Axis_Z_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Lower__side__Axis_X_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Lower__side__Axis_X_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Lower__side__Axis_X_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Lower__side__Axis_X_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Lower__side__Axis_X_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.Line_Width_Axes" "Position__name__FK_Lower__side__Axis_X_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Lower__side__outline2_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Lower__side__outline2_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Lower__side__outline2_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Lower__side__outline2_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Lower__side__outline2_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.Line_Width_Outline" "Position__name__FK_Lower__side__outline2_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_Lower__side__outline3_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_Lower__side__outline3_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_Lower__side__outline3_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_Lower__side__outline3_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_Lower__side__outline3_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.Line_Width_Outline" "Position__name__FK_Lower__side__outline3_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_Position__name__FK_IK_End__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_Position__name__FK_IK_End__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_Position__name__FK_IK_End__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_Position__name__FK_IK_End__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_Position__name__FK_IK_End__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_IK_End__side__pos.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_IK_End__side__pos.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_IK_End__side__pos.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_IK_End__side__pos.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_IK_End__side__pos.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_End__side__outline1_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_End__side__outline1_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_End__side__outline1_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_End__side__outline1_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_End__side__outline1_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.Line_Width_Outline" "Position__name__FK_End__side__outline1_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_End__side__Axis_Y_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_End__side__Axis_Y_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_End__side__Axis_Y_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_End__side__Axis_Y_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_End__side__Axis_Y_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.Line_Width_Axes" "Position__name__FK_End__side__Axis_Y_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_End__side__Axis_Z_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_End__side__Axis_Z_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_End__side__Axis_Z_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_End__side__Axis_Z_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_End__side__Axis_Z_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.Line_Width_Axes" "Position__name__FK_End__side__Axis_Z_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_End__side__Axis_X_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_End__side__Axis_X_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_End__side__Axis_X_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_End__side__Axis_X_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_End__side__Axis_X_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.Line_Width_Axes" "Position__name__FK_End__side__Axis_X_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_End__side__outline2_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_End__side__outline2_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_End__side__outline2_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_End__side__outline2_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_End__side__outline2_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.Line_Width_Outline" "Position__name__FK_End__side__outline2_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__FK_End__side__outline3_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__FK_End__side__outline3_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__FK_End__side__outline3_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__FK_End__side__outline3_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__FK_End__side__outline3_Shape.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.Line_Width_Outline" "Position__name__FK_End__side__outline3_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_Position__name__IK_Pole__Side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_Position__name__IK_Pole__Side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_Position__name__IK_Pole__Side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_Position__name__IK_Pole__Side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_Position__name__IK_Pole__Side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__outline1_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__outline1_Shape.oclr"
		;
connectAttr "Position__name__IK_Pole__Side__trs.Line_Width_Outline" "Position__name__IK_Pole__Side__outline1_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__outline1_Shape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__outline1_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__outline1_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__Axis_Y_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__Axis_Y_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__Axis_Y_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__Axis_Y_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__Axis_Y_Shape.Component_Side"
		;
connectAttr "Position__name__IK_Pole__Side__trs.Line_Width_Axes" "Position__name__IK_Pole__Side__Axis_Y_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__Axis_Z_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__Axis_Z_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__Axis_Z_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__Axis_Z_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__Axis_Z_Shape.Component_Side"
		;
connectAttr "Position__name__IK_Pole__Side__trs.Line_Width_Axes" "Position__name__IK_Pole__Side__Axis_Z_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__Axis_X_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__Axis_X_Shape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__Axis_X_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__Axis_X_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__Axis_X_Shape.Component_Side"
		;
connectAttr "Position__name__IK_Pole__Side__trs.Line_Width_Axes" "Position__name__IK_Pole__Side__Axis_X_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__outline2_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__outline2_Shape.oclr"
		;
connectAttr "Position__name__IK_Pole__Side__trs.Line_Width_Outline" "Position__name__IK_Pole__Side__outline2_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__outline2_Shape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__outline2_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__outline2_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Position__name__IK_Pole__Side__outline3_Shape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Position__name__IK_Pole__Side__outline3_Shape.oclr"
		;
connectAttr "Position__name__IK_Pole__Side__trs.Line_Width_Outline" "Position__name__IK_Pole__Side__outline3_Shape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Position__name__IK_Pole__Side__outline3_Shape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Position__name__IK_Pole__Side__outline3_Shape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Position__name__IK_Pole__Side__outline3_Shape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Curves__name_FK_IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Curves__name_FK_IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Curves__name_FK_IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Curves__name_FK_IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Curves__name_FK_IK__side__grp.Component_Side"
		;
connectAttr "Viewer__name__FK_Upper__side__MultMatrix.o" "Viewer__name__FK_Upper__side__crv.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_Upper__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_Upper__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Upper__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Upper__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Upper__side__crv.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.Line_Width" "Viewer__name__FK_Upper__side__crvShape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_Upper__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_Upper__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Upper__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Upper__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Upper__side__crvShape.Component_Side"
		;
connectAttr "Viewer__name__FK_Lower__side__MultMatrix.o" "Viewer__name__FK_Lower__side__crv.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_Lower__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_Lower__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Lower__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Lower__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Lower__side__crv.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.Line_Width" "Viewer__name__FK_Lower__side__crvShape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_Lower__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_Lower__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Lower__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Lower__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Lower__side__crvShape.Component_Side"
		;
connectAttr "Viewer__name__FK_End__side__MultMatrix.o" "Viewer__name__FK_End__side__crv.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_End__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_End__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_End__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_End__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_End__side__crv.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.Line_Width" "Viewer__name__FK_End__side__crvShape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_End__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_End__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_End__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_End__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_End__side__crvShape.Component_Side"
		;
connectAttr "Viewer__name__IK_Upper__side__MultMatrix.o" "Viewer__name__IK_Upper__side__crv.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__IK_Upper__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__IK_Upper__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Upper__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Upper__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Upper__side__crv.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.Line_Width" "Viewer__name__IK_Upper__side__crvShape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__IK_Upper__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__IK_Upper__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Upper__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Upper__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Upper__side__crvShape.Component_Side"
		;
connectAttr "Viewer__name__IK_Lower__side__MultMatrix.o" "Viewer__name__IK_Lower__side__crv.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__IK_Lower__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__IK_Lower__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Lower__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Lower__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Lower__side__crv.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.Line_Width" "Viewer__name__IK_Lower__side__crvShape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__IK_Lower__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__IK_Lower__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Lower__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Lower__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Lower__side__crvShape.Component_Side"
		;
connectAttr "Viewer__name__IK_End__side__MultMatrix.o" "Viewer__name__IK_End__side__crv.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__IK_End__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__IK_End__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_End__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_End__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_End__side__crv.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.Line_Width" "Viewer__name__IK_End__side__crvShape.ls"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__IK_End__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__IK_End__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_End__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_End__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_End__side__crvShape.Component_Side"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.ox" "Controls__name__FK__side__grp.v"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Controls__name__FK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Controls__name__FK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Controls__name__FK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Controls__name__FK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Controls__name__FK__side__grp.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.wm" "Offset__CTR__name__FK_Upper__side__trs.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset__CTR__name__FK_Upper__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset__CTR__name__FK_Upper__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset__CTR__name__FK_Upper__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset__CTR__name__FK_Upper__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset__CTR__name__FK_Upper__side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_Upper__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_Upper__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_Upper__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_Upper__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_Upper__side__crv.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_Upper__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_Upper__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_Upper__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_Upper__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_Upper__side__crvShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_Upper__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_Upper__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_Upper__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_Upper__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_Upper__side__jnt.Component_Side"
		;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.o" "Offset_CTR__name__FK_Lower__side__trs.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_CTR__name__FK_Lower__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_CTR__name__FK_Lower__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__FK_Lower__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__FK_Lower__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__FK_Lower__side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_Lower__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_Lower__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_Lower__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_Lower__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_Lower__side__crv.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_Lower__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_Lower__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_Lower__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_Lower__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_Lower__side__crvShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_Lower__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_Lower__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_Lower__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_Lower__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_Lower__side__jnt.Component_Side"
		;
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.o" "Offset_CTR__name__FK_End__side__trs.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_CTR__name__FK_End__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_CTR__name__FK_End__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__FK_End__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__FK_End__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__FK_End__side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_End__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_End__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_End__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_End__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_End__side__crv.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_End__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_End__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_End__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_End__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_End__side__crvShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_End__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_End__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_End__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_End__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_End__side__jnt.Component_Side"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.oy" "Controls__name__IK__side__grp.v"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Controls__name__IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Controls__name__IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Controls__name__IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Controls__name__IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Controls__name__IK__side__grp.Component_Side"
		;
connectAttr "Position__name__FK_IK_End__side__pos.wm" "Offset_CTR__name__IK__side__crv_trs.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_CTR__name__IK__side__crv_trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_CTR__name__IK__side__crv_trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__IK__side__crv_trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__IK__side__crv_trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__IK__side__crv_trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__IK__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__IK__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__IK__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__IK__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__IK__side__crv.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__IK__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__IK__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__IK__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__IK__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__IK__side__crvShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__IK__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__IK__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__IK__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__IK__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__IK__side__jnt.Component_Side"
		;
connectAttr "Position__name__IK_Pole__Side__trs.wm" "Offset_CTR__name__IK_Pole__side__crv_trs.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_CTR__name__IK_Pole__side__crv_trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_CTR__name__IK_Pole__side__crv_trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__IK_Pole__side__crv_trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__IK_Pole__side__crv_trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__IK_Pole__side__crv_trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__IK_Pole__side__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__IK_Pole__side__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__IK_Pole__side__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__IK_Pole__side__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__IK_Pole__side__crv.Component_Side"
		;
connectAttr "SkinCluster__CTR__name__IK_Pole__side__crvShape.og[0]" "CTR__name__K_Pole__side__crvShape.cr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__K_Pole__side__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__K_Pole__side__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__K_Pole__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__K_Pole__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__K_Pole__side__crvShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__IK_Pole__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__IK_Pole__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__IK_Pole__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__IK_Pole__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__IK_Pole__side__jnt.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__IK_Pole__side__crvShapeOrig.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__IK_Pole__side__crvShapeOrig.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__IK_Pole__side__crvShapeOrig.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__IK_Pole__side__crvShapeOrig.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__IK_Pole__side__crvShapeOrig.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Properties__name__FK_IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Properties__name__FK_IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Properties__name__FK_IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Properties__name__FK_IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Properties__name__FK_IK__side__grp.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_IK__side__Properties__crv.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_IK__side__Properties__crv.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_IK__side__Properties__crv.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_IK__side__Properties__crv.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_IK__side__Properties__crv.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_IK__side__Properties__crvShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_IK__side__Properties__crvShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_IK__side__Properties__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_IK__side__Properties__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_IK__side__Properties__crvShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_IK__side__Properties__crvShape1.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_IK__side__Properties__crvShape1.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_IK__side__Properties__crvShape1.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_IK__side__Properties__crvShape1.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_IK__side__Properties__crvShape1.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "CTR__name__FK_IK__side__Properties__crvShfape2.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "CTR__name__FK_IK__side__Properties__crvShfape2.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_IK__side__Properties__crvShfape2.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_IK__side__Properties__crvShfape2.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_IK__side__Properties__crvShfape2.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "System__name__FK_IK__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "System__name__FK_IK__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "System__name__FK_IK__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "System__name__FK_IK__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "System__name__FK_IK__grp.Component_Side"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.ctx" "DRV__name__FK_Upper__side__jnt.tx"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.cty" "DRV__name__FK_Upper__side__jnt.ty"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.ctz" "DRV__name__FK_Upper__side__jnt.tz"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.crx" "DRV__name__FK_Upper__side__jnt.rx"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.cry" "DRV__name__FK_Upper__side__jnt.ry"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.crz" "DRV__name__FK_Upper__side__jnt.rz"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__FK_Upper__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__FK_Upper__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_Upper__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_Upper__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_Upper__side__jnt.Component_Side"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.s" "DRV__name__FK_Lower__side__jnt.is"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.ctx" "DRV__name__FK_Lower__side__jnt.tx"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.cty" "DRV__name__FK_Lower__side__jnt.ty"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.ctz" "DRV__name__FK_Lower__side__jnt.tz"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.crx" "DRV__name__FK_Lower__side__jnt.rx"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.cry" "DRV__name__FK_Lower__side__jnt.ry"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.crz" "DRV__name__FK_Lower__side__jnt.rz"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__FK_Lower__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__FK_Lower__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_Lower__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_Lower__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_Lower__side__jnt.Component_Side"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.s" "DRV__name__FK_End__side__jnt.is"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.ctx" "DRV__name__FK_End__side__jnt.tx"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.cty" "DRV__name__FK_End__side__jnt.ty"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.ctz" "DRV__name__FK_End__side__jnt.tz"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.crx" "DRV__name__FK_End__side__jnt.rx"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.cry" "DRV__name__FK_End__side__jnt.ry"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.crz" "DRV__name__FK_End__side__jnt.rz"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__FK_End__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__FK_End__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_End__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_End__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_End__side__jnt.Component_Side"
		;
connectAttr "DRV__name__FK_End__side__jnt.ro" "DRV__name__FK_End__side__jnt_parentConstraint1.cro"
		;
connectAttr "DRV__name__FK_End__side__jnt.pim" "DRV__name__FK_End__side__jnt_parentConstraint1.cpim"
		;
connectAttr "DRV__name__FK_End__side__jnt.rp" "DRV__name__FK_End__side__jnt_parentConstraint1.crp"
		;
connectAttr "DRV__name__FK_End__side__jnt.rpt" "DRV__name__FK_End__side__jnt_parentConstraint1.crt"
		;
connectAttr "DRV__name__FK_End__side__jnt.jo" "DRV__name__FK_End__side__jnt_parentConstraint1.cjo"
		;
connectAttr "CTR__name__FK_End__side__jnt.t" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "CTR__name__FK_End__side__jnt.rp" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "CTR__name__FK_End__side__jnt.rpt" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "CTR__name__FK_End__side__jnt.r" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "CTR__name__FK_End__side__jnt.ro" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "CTR__name__FK_End__side__jnt.s" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "CTR__name__FK_End__side__jnt.pm" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "CTR__name__FK_End__side__jnt.jo" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tjo"
		;
connectAttr "CTR__name__FK_End__side__jnt.ssc" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tsc"
		;
connectAttr "CTR__name__FK_End__side__jnt.is" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tis"
		;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.w0" "DRV__name__FK_End__side__jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__FK_End__side__jnt_parentConstraint1.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__FK_End__side__jnt_parentConstraint1.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_End__side__jnt_parentConstraint1.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_End__side__jnt_parentConstraint1.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_End__side__jnt_parentConstraint1.Component_Side"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.ro" "DRV__name__FK_Lower__side__jnt_parentConstraint1.cro"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.pim" "DRV__name__FK_Lower__side__jnt_parentConstraint1.cpim"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.rp" "DRV__name__FK_Lower__side__jnt_parentConstraint1.crp"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.rpt" "DRV__name__FK_Lower__side__jnt_parentConstraint1.crt"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.jo" "DRV__name__FK_Lower__side__jnt_parentConstraint1.cjo"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.t" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.rp" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.rpt" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.r" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.ro" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.s" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.pm" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.jo" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tjo"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.ssc" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tsc"
		;
connectAttr "CTR__name__FK_Lower__side__jnt.is" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tis"
		;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.w0" "DRV__name__FK_Lower__side__jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__FK_Lower__side__jnt_parentConstraint1.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__FK_Lower__side__jnt_parentConstraint1.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_Lower__side__jnt_parentConstraint1.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_Lower__side__jnt_parentConstraint1.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_Lower__side__jnt_parentConstraint1.Component_Side"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.ro" "DRV__name__FK_Upper__side__jnt_parentConstraint1.cro"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.pim" "DRV__name__FK_Upper__side__jnt_parentConstraint1.cpim"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.rp" "DRV__name__FK_Upper__side__jnt_parentConstraint1.crp"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.rpt" "DRV__name__FK_Upper__side__jnt_parentConstraint1.crt"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.jo" "DRV__name__FK_Upper__side__jnt_parentConstraint1.cjo"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.t" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.rp" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.rpt" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.r" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.ro" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.s" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.pm" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.jo" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tjo"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.ssc" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tsc"
		;
connectAttr "CTR__name__FK_Upper__side__jnt.is" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tis"
		;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.w0" "DRV__name__FK_Upper__side__jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__FK_Upper__side__jnt_parentConstraint1.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__FK_Upper__side__jnt_parentConstraint1.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_Upper__side__jnt_parentConstraint1.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_Upper__side__jnt_parentConstraint1.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_Upper__side__jnt_parentConstraint1.Component_Side"
		;
connectAttr "PRN__name__FK_IK_Upper__side__ParentMatrix.omat" "PRN__name__FK_IK_Upper__side__jnt.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "PRN__name__FK_IK_Upper__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "PRN__name__FK_IK_Upper__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_Upper__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_Upper__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_Upper__side__jnt.Component_Side"
		;
connectAttr "PRN__name__FK_IK_Upper__side__jnt.s" "PRN__name__FK_IK_Lower__side__jnt.is"
		;
connectAttr "PRN__name__FK_IK_Lower__side__ParentMatrix.omat" "PRN__name__FK_IK_Lower__side__jnt.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "PRN__name__FK_IK_Lower__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "PRN__name__FK_IK_Lower__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_Lower__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_Lower__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_Lower__side__jnt.Component_Side"
		;
connectAttr "PRN__name__FK_IK_Lower__side__jnt.s" "PRN__name__FK_IK_End__side__jnt.is"
		;
connectAttr "PRN__name__FK_IK_End__side__ParentMatrix.omat" "PRN__name__FK_IK_End__side__jnt.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "PRN__name__FK_IK_End__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "PRN__name__FK_IK_End__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_End__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_End__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_End__side__jnt.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset__DRV__name__IK_Handle__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset__DRV__name__IK_Handle__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset__DRV__name__IK_Handle__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset__DRV__name__IK_Handle__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset__DRV__name__IK_Handle__side__trs.Component_Side"
		;
connectAttr "CTR__name__IK__side__jnt.wm" "DRV__name__IK_Handle__side__jnt.opm";
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_Handle__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_Handle__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Handle__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Handle__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Handle__side__jnt.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset__name__side__ikHandle_trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset__name__side__ikHandle_trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset__name__side__ikHandle_trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset__name__side__ikHandle_trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset__name__side__ikHandle_trs.Component_Side"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.msg" "__name__side__ikHandle.hsj";
connectAttr "__name__side__effector.hp" "__name__side__ikHandle.hee";
connectAttr "ikRPsolver.msg" "__name__side__ikHandle.hsv";
connectAttr "__name__side__ikHandle_poleVectorConstraint1.ctx" "__name__side__ikHandle.pvx"
		;
connectAttr "__name__side__ikHandle_poleVectorConstraint1.cty" "__name__side__ikHandle.pvy"
		;
connectAttr "__name__side__ikHandle_poleVectorConstraint1.ctz" "__name__side__ikHandle.pvz"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "__name__side__ikHandle.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "__name__side__ikHandle.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "__name__side__ikHandle.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "__name__side__ikHandle.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "__name__side__ikHandle.Component_Side"
		;
connectAttr "__name__side__ikHandle.pim" "__name__side__ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.pm" "__name__side__ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.t" "__name__side__ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.t" "__name__side__ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.rp" "__name__side__ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.rpt" "__name__side__ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.pm" "__name__side__ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "__name__side__ikHandle_poleVectorConstraint1.w0" "__name__side__ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "__name__side__ikHandle_poleVectorConstraint1.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "__name__side__ikHandle_poleVectorConstraint1.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "__name__side__ikHandle_poleVectorConstraint1.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "__name__side__ikHandle_poleVectorConstraint1.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "__name__side__ikHandle_poleVectorConstraint1.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_DRV__name__IK_Pole__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_DRV__name__IK_Pole__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_DRV__name__IK_Pole__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_DRV__name__IK_Pole__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_DRV__name__IK_Pole__side__trs.Component_Side"
		;
connectAttr "DRV__name__IK_Pole__side__MultMatrix.o" "DRV__name__IK_Pole__side__jnt.opm"
		;
connectAttr "DRV__name__IK_Pole__side__jnt_aimConstraint1.crx" "DRV__name__IK_Pole__side__jnt.rx"
		;
connectAttr "DRV__name__IK_Pole__side__jnt_aimConstraint1.cry" "DRV__name__IK_Pole__side__jnt.ry"
		;
connectAttr "DRV__name__IK_Pole__side__jnt_aimConstraint1.crz" "DRV__name__IK_Pole__side__jnt.rz"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_Pole__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_Pole__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Pole__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Pole__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Pole__side__jnt.Component_Side"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.pim" "DRV__name__IK_Pole__side__jnt_aimConstraint1.cpim"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.t" "DRV__name__IK_Pole__side__jnt_aimConstraint1.ct"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.rp" "DRV__name__IK_Pole__side__jnt_aimConstraint1.crp"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.rpt" "DRV__name__IK_Pole__side__jnt_aimConstraint1.crt"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.ro" "DRV__name__IK_Pole__side__jnt_aimConstraint1.cro"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.jo" "DRV__name__IK_Pole__side__jnt_aimConstraint1.cjo"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.is" "DRV__name__IK_Pole__side__jnt_aimConstraint1.is"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.t" "DRV__name__IK_Pole__side__jnt_aimConstraint1.tg[0].tt"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.rp" "DRV__name__IK_Pole__side__jnt_aimConstraint1.tg[0].trp"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.rpt" "DRV__name__IK_Pole__side__jnt_aimConstraint1.tg[0].trt"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.pm" "DRV__name__IK_Pole__side__jnt_aimConstraint1.tg[0].tpm"
		;
connectAttr "DRV__name__IK_Pole__side__jnt_aimConstraint1.w0" "DRV__name__IK_Pole__side__jnt_aimConstraint1.tg[0].tw"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_Pole__side__jnt_aimConstraint1.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_Pole__side__jnt_aimConstraint1.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Pole__side__jnt_aimConstraint1.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Pole__side__jnt_aimConstraint1.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Pole__side__jnt_aimConstraint1.Component_Side"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.wm" "DRV__name__IK_Shape_Line_Start__side__jnt.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_Shape_Line_Start__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_Shape_Line_Start__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Shape_Line_Start__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Shape_Line_Start__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Shape_Line_Start__side__jnt.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.wm" "Offset_DRV__name__IK_Upper__side__trs.opm"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Offset_DRV__name__IK_Upper__side__trs.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Offset_DRV__name__IK_Upper__side__trs.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_DRV__name__IK_Upper__side__trs.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_DRV__name__IK_Upper__side__trs.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_DRV__name__IK_Upper__side__trs.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_Upper__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_Upper__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Upper__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Upper__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Upper__side__jnt.Component_Side"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.s" "DRV__name__IK_Lower__side__jnt.is"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_Lower__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_Lower__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Lower__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Lower__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Lower__side__jnt.Component_Side"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.s" "DRV__name__IK_End__side__jnt.is"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "DRV__name__IK_End__side__jnt.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "DRV__name__IK_End__side__jnt.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_End__side__jnt.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_End__side__jnt.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_End__side__jnt.Component_Side"
		;
connectAttr "DRV__name__IK_End__side__jnt.tx" "__name__side__effector.tx";
connectAttr "DRV__name__IK_End__side__jnt.ty" "__name__side__effector.ty";
connectAttr "DRV__name__IK_End__side__jnt.tz" "__name__side__effector.tz";
connectAttr "DRV__name__IK_End__side__jnt.opm" "__name__side__effector.opm";
connectAttr "Component__name__FK_IK__side__Asset.uocol" "__name__side__effector.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "__name__side__effector.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "__name__side__effector.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "__name__side__effector.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "__name__side__effector.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "WIP__name__FK_IK__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "WIP__name__FK_IK__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "WIP__name__FK_IK__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "WIP__name__FK_IK__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "WIP__name__FK_IK__grp.Component_Side"
		;
connectAttr "Viewer_StraightIK__name__FK_IK__side__FloatLogic.ob" "Viewer__StraightIK__FK_IK__side__grp.v"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__StraightIK__FK_IK__side__grp.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__StraightIK__FK_IK__side__grp.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__StraightIK__FK_IK__side__grp.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__StraightIK__FK_IK__side__grp.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__StraightIK__FK_IK__side__grp.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Mesh__name__FK_IK__side__01_Warning.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Mesh__name__FK_IK__side__01_Warning.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Mesh__name__FK_IK__side__01_Warning.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Mesh__name__FK_IK__side__01_Warning.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Mesh__name__FK_IK__side__01_Warning.Component_Side"
		;
connectAttr "SG_Warning_Red_Saturated.mwc" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.iog.og[1].gco"
		;
connectAttr "SG_Warning_Red_Bright.mwc" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.iog.og[2].gco"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Mesh__name__FK_IK__side__01_WarningShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Mesh__name__FK_IK__side__02_Warning.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Mesh__name__FK_IK__side__02_Warning.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Mesh__name__FK_IK__side__02_Warning.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Mesh__name__FK_IK__side__02_Warning.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Mesh__name__FK_IK__side__02_Warning.Component_Side"
		;
connectAttr "SG_Warning_Red_Saturated.mwc" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.iog.og[1].gco"
		;
connectAttr "SG_Warning_Red_Bright.mwc" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.iog.og[2].gco"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Mesh__name__FK_IK__side__02_WarningShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Mesh__name__FK_IK__side__03_Warning.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Mesh__name__FK_IK__side__03_Warning.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Mesh__name__FK_IK__side__03_Warning.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Mesh__name__FK_IK__side__03_Warning.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Mesh__name__FK_IK__side__03_Warning.Component_Side"
		;
connectAttr "SG_Warning_Red_Saturated.mwc" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.iog.og[1].gco"
		;
connectAttr "SG_Warning_Red_Bright.mwc" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.iog.og[2].gco"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Mesh__name__FK_IK__side__03_WarningShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Curve__name__FK_IK__side__StraightCurve.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Curve__name__FK_IK__side__StraightCurve.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Curve__name__FK_IK__side__StraightCurve.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Curve__name__FK_IK__side__StraightCurve.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Curve__name__FK_IK__side__StraightCurve.Component_Side"
		;
connectAttr "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.og[0]" "Viewer_Curve__name__FK_IK__side__StraightCurveShape.cr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_Curve__name__FK_IK__side__StraightCurveShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_Curve__name__FK_IK__side__StraightCurveShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_Curve__name__FK_IK__side__StraightCurveShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_Curve__name__FK_IK__side__StraightCurveShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_Curve__name__FK_IK__side__StraightCurveShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_DRV__name__FK_IK__side__IK_Length.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_DRV__name__FK_IK__side__IK_Length.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_Length.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_Length.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_Length.Component_Side"
		;
connectAttr "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.og[0]" "Viewer_DRV__name__FK_IK__side__IK_LengthShape.cr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_DRV__name__FK_IK__side__IK_LengthShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_DRV__name__FK_IK__side__IK_LengthShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_LengthShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_LengthShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_LengthShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_DRV__name__FK_IK__side__IK_Angle.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_DRV__name__FK_IK__side__IK_Angle.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_Angle.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_Angle.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_Angle.Component_Side"
		;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_LengthShape.c" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.cp[0]"
		;
connectAttr "PRN__name__FK_IK_Lower__side__DecompMatrix.ot" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.cp[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_AngleShape.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig.uocol"
		;
connectAttr "hyperLayout3.msg" "Component__name__FK_IK__side__Asset.hl";
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Component__name__FK_IK__side__Asset.oclr"
		;
connectAttr "hyperLayout4.msg" "Setup__name__FK_IK__side__Asset.hl";
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Setup__name__FK_IK__side__Asset.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Setup__name__FK_IK__side__Asset.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Setup__name__FK_IK__side__Asset.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Setup__name__FK_IK__side__Asset.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Setup__name__FK_IK__side__Asset.uocol"
		;
connectAttr "hyperLayout2.msg" "System__name__FK_IK__side__Asset.hl";
connectAttr "Component__name__FK_IK__side__Asset.uocol" "System__name__FK_IK__side__Asset.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "System__name__FK_IK__side__Asset.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "System__name__FK_IK__side__Asset.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "System__name__FK_IK__side__Asset.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "System__name__FK_IK__side__Asset.Component_Side"
		;
connectAttr "hyperLayout1.msg" "Viewer__name__FK_IK__side__Asset.hl";
connectAttr "Component__name__FK_IK__side__Asset.uocol" "Viewer__name__FK_IK__side__Asset.uocol"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Outliner_Color" "Viewer__name__FK_IK__side__Asset.oclr"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_IK__side__Asset.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_IK__side__Asset.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_IK__side__Asset.Component_Side"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "SG_Pivot.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "SG_Warning_Red_Saturated.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "SG_Warning_Red_Bright.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "SG_Pivot.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "SG_Warning_Red_Saturated.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "SG_Warning_Red_Bright.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "Viewer_Curves__name_FK_IK__side__grp.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_Upper__side__crv.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__crv.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_End__side__crv.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__crv.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__crv.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__IK_End__side__crv.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_Upper__side__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__IK_End__side__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_End__side__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name__FK_Upper__side__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__IK_Offset__side__ComposeMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__FK_Offset__side__ComposeMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__FK_End__side__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name__IK_End__side__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__FK_IK__NodeGroup.msg" "hyperLayout1.hyp[0].dn";
connectAttr "DRV__name__FK_Upper__side__jnt.wm" "Viewer__name__FK_Upper__side__MultMatrix.i[0]"
		;
connectAttr "Viewer__name__FK_Offset__side__ComposeMatrix.omat" "Viewer__name__FK_Upper__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Upper__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Upper__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Upper__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.wm" "Viewer__name__FK_Lower__side__MultMatrix.i[0]"
		;
connectAttr "Viewer__name__FK_Offset__side__ComposeMatrix.omat" "Viewer__name__FK_Lower__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Lower__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Lower__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Lower__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__FK_End__side__jnt.wm" "Viewer__name__FK_End__side__MultMatrix.i[0]"
		;
connectAttr "Viewer__name__FK_Offset__side__ComposeMatrix.omat" "Viewer__name__FK_End__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_End__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_End__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_End__side__MultMatrix.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.FK_Offset" "Viewer__name__FK_Offset__side__ComposeMatrix.it"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__FK_Offset__side__ComposeMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__FK_Offset__side__ComposeMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__FK_Offset__side__ComposeMatrix.Component_Side"
		;
connectAttr "Viewer__name__FK_IK__side__Asset.IK_Offset" "Viewer__name__IK_Offset__side__ComposeMatrix.it"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Offset__side__ComposeMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Offset__side__ComposeMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Offset__side__ComposeMatrix.Component_Side"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.wm" "Viewer__name__IK_Upper__side__MultMatrix.i[0]"
		;
connectAttr "Viewer__name__IK_Offset__side__ComposeMatrix.omat" "Viewer__name__IK_Upper__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Upper__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Upper__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Upper__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.wm" "Viewer__name__IK_Lower__side__MultMatrix.i[0]"
		;
connectAttr "Viewer__name__IK_Offset__side__ComposeMatrix.omat" "Viewer__name__IK_Lower__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_Lower__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_Lower__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_Lower__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__IK_End__side__jnt.wm" "Viewer__name__IK_End__side__MultMatrix.i[0]"
		;
connectAttr "Viewer__name__IK_Offset__side__ComposeMatrix.omat" "Viewer__name__IK_End__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer__name__IK_End__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer__name__IK_End__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer__name__IK_End__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__FK_Upper__side__jnt.wm" "PRN__name__FK_IK_Upper__side__ParentMatrix.tgt[0].tmat"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.ox" "PRN__name__FK_IK_Upper__side__ParentMatrix.tgt[0].wgt"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.wm" "PRN__name__FK_IK_Upper__side__ParentMatrix.tgt[1].tmat"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.oy" "PRN__name__FK_IK_Upper__side__ParentMatrix.tgt[1].wgt"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_Upper__side__ParentMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_Upper__side__ParentMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_Upper__side__ParentMatrix.Component_Side"
		;
connectAttr "DRV__name__FK_Lower__side__MultMatrix.o" "PRN__name__FK_IK_Lower__side__ParentMatrix.tgt[0].tmat"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.ox" "PRN__name__FK_IK_Lower__side__ParentMatrix.tgt[0].wgt"
		;
connectAttr "DRV__name__IK_Lower__side__MultMatrix.o" "PRN__name__FK_IK_Lower__side__ParentMatrix.tgt[1].tmat"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.oy" "PRN__name__FK_IK_Lower__side__ParentMatrix.tgt[1].wgt"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_Lower__side__ParentMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_Lower__side__ParentMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_Lower__side__ParentMatrix.Component_Side"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.wm" "DRV__name__IK_Lower__side__MultMatrix.i[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.pim" "DRV__name__IK_Lower__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Lower__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Lower__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Lower__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.wm" "DRV__name__FK_Lower__side__MultMatrix.i[0]"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.pim" "DRV__name__FK_Lower__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_Lower__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_Lower__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_Lower__side__MultMatrix.Component_Side"
		;
connectAttr "CTR__name__FK_IK__side__Properties__crv.FK_IK_Switch" "CTR__name__FK_IK__side__Properties__SetRange.vx"
		;
connectAttr "CTR__name__FK_IK__side__Properties__crv.FK_IK_Switch" "CTR__name__FK_IK__side__Properties__SetRange.vy"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "CTR__name__FK_IK__side__Properties__SetRange.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "CTR__name__FK_IK__side__Properties__SetRange.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "CTR__name__FK_IK__side__Properties__SetRange.Component_Side"
		;
connectAttr "DRV__name__FK_End__side__MultMatrix.o" "PRN__name__FK_IK_End__side__ParentMatrix.tgt[0].tmat"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.ox" "PRN__name__FK_IK_End__side__ParentMatrix.tgt[0].wgt"
		;
connectAttr "DRV__name__IK_End__side__MultMatrix.o" "PRN__name__FK_IK_End__side__ParentMatrix.tgt[1].tmat"
		;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.oy" "PRN__name__FK_IK_End__side__ParentMatrix.tgt[1].wgt"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_End__side__ParentMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_End__side__ParentMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_End__side__ParentMatrix.Component_Side"
		;
connectAttr "DRV__name__FK_End__side__jnt.wm" "DRV__name__FK_End__side__MultMatrix.i[0]"
		;
connectAttr "DRV__name__FK_End__side__jnt.pim" "DRV__name__FK_End__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__FK_End__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__FK_End__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__FK_End__side__MultMatrix.Component_Side"
		;
connectAttr "DRV__name__IK_End__side__jnt.wm" "DRV__name__IK_End__side__MultMatrix.i[0]"
		;
connectAttr "DRV__name__IK_End__side__jnt.pim" "DRV__name__IK_End__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_End__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_End__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_End__side__MultMatrix.Component_Side"
		;
connectAttr "System__name_FK_IK_NodeGroup.msg" "hyperLayout2.hyp[0].dn";
connectAttr "DRV__name__FK_Upper__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__FK_Lower__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__FK_End__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__IK_Upper__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__IK_Lower__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__IK_End__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "__name__side__effector.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "Offset_DRV__name__IK_Pole__side__trs.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__IK_Pole__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "Offset__DRV__name__IK_Handle__side__trs.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__IK_Handle__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "Offset__name__side__ikHandle_trs.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "__name__side__ikHandle.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "__name__side__ikHandle_poleVectorConstraint1.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_Upper__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_Lower__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_End__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "Properties__name__FK_IK__side__grp.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__crv.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "Controls__name__FK__side__grp.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "CTR__name__FK_Upper__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "CTR__name__FK_Lower__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "CTR__name__FK_End__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "CTR__name__IK__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "CTR__name__IK_Pole__side__jnt.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV__name__FK_End__side__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "DRV__name__FK_Lower__side__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "DRV__name__IK_End__side__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "DRV__name__IK_Lower__side__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_End__side__ParentMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_Lower__side__ParentMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_Upper__side__ParentMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Upper__side__MultMatrix.o" "Offset_CTR__name__FK_Lower__side__MultMatrix.i[0]"
		;
connectAttr "CTR__name__FK_Upper__side__crv.pim" "Offset_CTR__name__FK_Lower__side__MultMatrix.i[1]"
		;
connectAttr "CTR__name__FK_Upper__side__crv.wm" "Offset_CTR__name__FK_Lower__side__MultMatrix.i[2]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__FK_Lower__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__FK_Lower__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__FK_Lower__side__MultMatrix.Component_Side"
		;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.o" "Offset_CTR__name__FK_End__side__MultMatrix.i[0]"
		;
connectAttr "CTR__name__FK_Lower__side__crv.pim" "Offset_CTR__name__FK_End__side__MultMatrix.i[2]"
		;
connectAttr "CTR__name__FK_Lower__side__crv.wm" "Offset_CTR__name__FK_End__side__MultMatrix.i[3]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__FK_End__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__FK_End__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__FK_End__side__MultMatrix.Component_Side"
		;
connectAttr "Setup__name__FK_IK__side__Asset.msg" "hyperLayout3.hyp[0].dn";
connectAttr "Viewer__name__FK_IK__side__Asset.msg" "hyperLayout3.hyp[1].dn";
connectAttr "System__name__FK_IK__side__Asset.msg" "hyperLayout3.hyp[2].dn";
connectAttr "Component__name__FK_IK__side__All_Nodes.msg" "hyperLayout3.hyp[3].dn"
		;
connectAttr "Viewer__name__FK_Offset__side__ComposeMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__FK_End__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__IK_Offset__side__ComposeMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__IK_End__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__FK_Upper__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_End__side__ParentMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "DRV__name__IK_Lower__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_Lower__side__ParentMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "DRV__name__IK_End__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "DRV__name__FK_Lower__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "DRV__name__FK_End__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_Upper__side__ParentMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "DRV__name__IK_Pole__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "SkinCluster__CTR__name__IK_Pole__side__crvShape.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "M_Pivot.msg" "Component__name__FK_IK__side__All_Nodes.dnsm" -na;
connectAttr "INF_Warning_Red_Saturated.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "INF_Warning_Red_Bright.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "M_Warning_Red_Saturated.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "M_Warning_Red_Bright.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer_StraightIK__name__FK_IK__side__FloatLogic.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer_StraightIK__name__FK_IK__side__Set_Range.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "PRN__name__FK_IK_Lower__side__DecompMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "INF_Pivot.msg" "Component__name__FK_IK__side__All_Nodes.dnsm" -na;
connectAttr "Offset_CTR__name__FK_Upper__side__MultMatrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "SG_Pivot.msg" "Component__name__FK_IK__side__All_Nodes.dnsm" -na;
connectAttr "Setup__name__FK_IK__side__Set.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "NodeTree__name_FK_IK__FK_Matrix.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__FK_IK__NodeGroup.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "System__name_FK_IK_NodeGroup.msg" "Component__name__FK_IK__side__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name__FK_Upper__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Curves__name_FK_IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__FK_End__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__FK_End__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__IK_End__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__IK_End__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__FK_Upper__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset__name__side__ikHandle_trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "__name__side__ikHandle_poleVectorConstraint1.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "__name__side__ikHandle.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_Upper__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Controls__name__FK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_End__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__FK_End__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__FK_Upper__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_Upper__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_Lower__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__FK_Lower__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "__name__side__effector.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Properties__name__FK_IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_End__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_End__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_Lower__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_Lower__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_Upper__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_DRV__name__IK_Pole__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_Handle__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_Pole__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset__DRV__name__IK_Handle__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_End__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_End__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_CTR__name__FK_End__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_Lower__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_Lower__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Lower__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_Upper__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_Upper__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset__CTR__name__FK_Upper__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Controls__name__IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__crvShfape2.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__crvShape1.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__FK_Upper__side__jnt_parentConstraint1.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__FK_Lower__side__jnt_parentConstraint1.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__FK_End__side__jnt_parentConstraint1.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "System__name__FK_IK__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "System__name__FK_IK__side__Asset.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name__FK_IK__side__Asset.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Component__name__FK_IK__side__Asset.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Component__name__FK_IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__IK__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__IK_Pole__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__StraightIK__FK_IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__outline3_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__outline2_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__Axis_X_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__Axis_Z_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__Axis_Y_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__outline1_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_Position__name__IK_Pole__Side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_End__side__outline3_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_End__side__outline2_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_End__side__Axis_X_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_End__side__Axis_Z_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_End__side__Axis_Y_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_End__side__outline1_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_IK_End__side__pos.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_Position__name__FK_IK_End__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Lower__side__outline3_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Lower__side__outline2_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Lower__side__Axis_X_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Lower__side__Axis_Z_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Lower__side__Axis_Y_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Lower__side__outline1_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_IK_Lower__side__pos.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_Position__name__FK_IK_Lower__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Upper__side__outline3_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Upper__side__outline2_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Upper__side__Axis_X_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Upper__side__Axis_Z_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Upper__side__Axis_Y_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_Upper__side__outline1_Shape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Position__name__FK_IK_Upper__side__pos.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_Position__name__FK_IK_Upper__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Setup_Positions__name__FK_IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__K_Pole__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__IK_Pole__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_CTR__name__IK_Pole__side__crv_trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__IK__side__crvShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__IK__side__crv.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_CTR__name__IK__side__crv_trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Offset_DRV__name__IK_Upper__side__trs.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DRV__name__IK_Pole__side__jnt_aimConstraint1.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "WIP__name__FK_IK__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_AngleShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_Angle.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_LengthShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_Length.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Curve__name__FK_IK__side__StraightCurveShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Curve__name__FK_IK__side__StraightCurve.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__03_WarningShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__03_Warning.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__02_WarningShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__02_Warning.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__01_WarningShape.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__01_Warning.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "DAG_Nodes__name__FK_IK__side__grp.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Setup__name__FK_IK__side__Asset.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name__IK_Pole__side__crvShapeOrig.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_AngleShape1Orig.iog" "Component__name__FK_IK__side__All_Nodes.dsm"
		 -na;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Component__name__FK_IK__side__All_Nodes.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Component__name__FK_IK__side__All_Nodes.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Component__name__FK_IK__side__All_Nodes.Component_Side"
		;
connectAttr "CTR__name__IK_Pole__side__crvShapeOrig.ws" "SkinCluster__CTR__name__IK_Pole__side__crvShape.ip[0].ig"
		;
connectAttr "CTR__name__IK_Pole__side__crvShapeOrig.l" "SkinCluster__CTR__name__IK_Pole__side__crvShape.orggeom[0]"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.wm" "SkinCluster__CTR__name__IK_Pole__side__crvShape.ma[0]"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.wm" "SkinCluster__CTR__name__IK_Pole__side__crvShape.ma[1]"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.liw" "SkinCluster__CTR__name__IK_Pole__side__crvShape.lw[0]"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.liw" "SkinCluster__CTR__name__IK_Pole__side__crvShape.lw[1]"
		;
connectAttr "DRV__name__IK_Shape_Line_Start__side__jnt.obcc" "SkinCluster__CTR__name__IK_Pole__side__crvShape.ifcl[0]"
		;
connectAttr "DRV__name__IK_Pole__side__jnt.obcc" "SkinCluster__CTR__name__IK_Pole__side__crvShape.ifcl[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "SkinCluster__CTR__name__IK_Pole__side__crvShape.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "SkinCluster__CTR__name__IK_Pole__side__crvShape.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "SkinCluster__CTR__name__IK_Pole__side__crvShape.Component_Side"
		;
connectAttr "CTR__name__IK_Pole__side__jnt.wm" "DRV__name__IK_Pole__side__MultMatrix.i[5]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "DRV__name__IK_Pole__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "DRV__name__IK_Pole__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "DRV__name__IK_Pole__side__MultMatrix.Component_Side"
		;
connectAttr ":lambert1.oc" "lambert1SG.ss";
connectAttr "lambert1SG.msg" "materialInfo1.sg";
connectAttr ":lambert1.msg" "materialInfo1.m";
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "M_Pivot.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "M_Pivot.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "M_Pivot.Component_Side"
		;
connectAttr "M_Pivot.oc" "SG_Pivot.ss";
connectAttr "SG_Pivot.msg" "INF_Pivot.sg";
connectAttr "M_Pivot.msg" "INF_Pivot.m";
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "INF_Pivot.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "INF_Pivot.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "INF_Pivot.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "M_Warning_Red_Saturated.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "M_Warning_Red_Saturated.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "M_Warning_Red_Saturated.Component_Side"
		;
connectAttr "M_Warning_Red_Saturated.oc" "SG_Warning_Red_Saturated.ss";
connectAttr "Viewer_Mesh__name__FK_IK__side__02_WarningShape.iog.og[1]" "SG_Warning_Red_Saturated.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__01_WarningShape.iog.og[1]" "SG_Warning_Red_Saturated.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__03_WarningShape.iog.og[1]" "SG_Warning_Red_Saturated.dsm"
		 -na;
connectAttr "SG_Warning_Red_Saturated.msg" "INF_Warning_Red_Saturated.sg";
connectAttr "M_Warning_Red_Saturated.msg" "INF_Warning_Red_Saturated.m";
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "INF_Warning_Red_Saturated.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "INF_Warning_Red_Saturated.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "INF_Warning_Red_Saturated.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "M_Warning_Red_Bright.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "M_Warning_Red_Bright.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "M_Warning_Red_Bright.Component_Side"
		;
connectAttr "M_Warning_Red_Bright.oc" "SG_Warning_Red_Bright.ss";
connectAttr "Viewer_Mesh__name__FK_IK__side__02_WarningShape.iog.og[2]" "SG_Warning_Red_Bright.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__01_WarningShape.iog.og[2]" "SG_Warning_Red_Bright.dsm"
		 -na;
connectAttr "Viewer_Mesh__name__FK_IK__side__03_WarningShape.iog.og[2]" "SG_Warning_Red_Bright.dsm"
		 -na;
connectAttr "SG_Warning_Red_Bright.msg" "INF_Warning_Red_Bright.sg";
connectAttr "M_Warning_Red_Bright.msg" "INF_Warning_Red_Bright.m";
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "INF_Warning_Red_Bright.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "INF_Warning_Red_Bright.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "INF_Warning_Red_Bright.Component_Side"
		;
connectAttr "Viewer_Curve__name__FK_IK__side__StraightCurveShapeOrig.ws" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ip[0].ig"
		;
connectAttr "Viewer_Curve__name__FK_IK__side__StraightCurveShapeOrig.l" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.orggeom[0]"
		;
connectAttr "bindPose2.msg" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.bp"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.wm" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ma[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.wm" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ma[1]"
		;
connectAttr "DRV__name__IK_End__side__jnt.wm" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ma[2]"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.liw" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.lw[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.liw" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.lw[1]"
		;
connectAttr "DRV__name__IK_End__side__jnt.liw" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.lw[2]"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.obcc" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ifcl[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.obcc" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ifcl[1]"
		;
connectAttr "DRV__name__IK_End__side__jnt.obcc" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.ifcl[2]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "SkinCluster__Viewer_Curve__name__FK_IK__side__StraightCurve.Component_Side"
		;
connectAttr "Component__name__FK_IK__side__grp.msg" "bindPose2.m[0]";
connectAttr "System__name__FK_IK__grp.msg" "bindPose2.m[1]";
connectAttr "Offset_DRV__name__IK_Upper__side__trs.msg" "bindPose2.m[2]";
connectAttr "DRV__name__IK_Upper__side__jnt.msg" "bindPose2.m[3]";
connectAttr "DRV__name__IK_Lower__side__jnt.msg" "bindPose2.m[4]";
connectAttr "DRV__name__IK_End__side__jnt.msg" "bindPose2.m[5]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.m[0]" "bindPose2.p[1]";
connectAttr "bindPose2.m[1]" "bindPose2.p[2]";
connectAttr "bindPose2.m[2]" "bindPose2.p[3]";
connectAttr "bindPose2.m[3]" "bindPose2.p[4]";
connectAttr "bindPose2.m[4]" "bindPose2.p[5]";
connectAttr "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.ws" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ip[0].ig"
		;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_LengthShape1Orig.l" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.orggeom[0]"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.wm" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ma[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.wm" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ma[1]"
		;
connectAttr "DRV__name__IK_End__side__jnt.wm" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ma[2]"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.liw" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.lw[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.liw" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.lw[1]"
		;
connectAttr "DRV__name__IK_End__side__jnt.liw" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.lw[2]"
		;
connectAttr "DRV__name__IK_Upper__side__jnt.obcc" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ifcl[0]"
		;
connectAttr "DRV__name__IK_Lower__side__jnt.obcc" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ifcl[1]"
		;
connectAttr "DRV__name__IK_End__side__jnt.obcc" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.ifcl[2]"
		;
connectAttr "bindPose2.msg" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.bp"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "SkinCluster__Viewer_DRV__name__FK_IK__side__IK_Length.Component_Side"
		;
connectAttr "PRN__name__FK_IK_Lower__side__jnt.wm" "PRN__name__FK_IK_Lower__side__DecompMatrix.imat"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "PRN__name__FK_IK_Lower__side__DecompMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "PRN__name__FK_IK_Lower__side__DecompMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "PRN__name__FK_IK_Lower__side__DecompMatrix.Component_Side"
		;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_AngleShape.cp[0]" "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.p1"
		;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_AngleShape.cp[1]" "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.p2"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.Component_Side"
		;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.d" "Viewer_StraightIK__name__FK_IK__side__Set_Range.vx"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_StraightIK__name__FK_IK__side__Set_Range.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_StraightIK__name__FK_IK__side__Set_Range.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_StraightIK__name__FK_IK__side__Set_Range.Component_Side"
		;
connectAttr "Viewer_StraightIK__name__FK_IK__side__Set_Range.ox" "Viewer_StraightIK__name__FK_IK__side__FloatLogic._aa"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Viewer_StraightIK__name__FK_IK__side__FloatLogic.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Viewer_StraightIK__name__FK_IK__side__FloatLogic.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Viewer_StraightIK__name__FK_IK__side__FloatLogic.Component_Side"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.pim" "Offset_CTR__name__FK_Upper__side__MultMatrix.i[0]"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.wm" "Offset_CTR__name__FK_Upper__side__MultMatrix.i[1]"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Name" "Offset_CTR__name__FK_Upper__side__MultMatrix.Component_Name"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Type" "Offset_CTR__name__FK_Upper__side__MultMatrix.Component_Type"
		;
connectAttr "Component__name__FK_IK__side__Asset.Component_Side" "Offset_CTR__name__FK_Upper__side__MultMatrix.Component_Side"
		;
connectAttr "CTR__name__FK_End__side__crv.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Offset_CTR__name__FK_End__side__trs.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "CTR__name__FK_Lower__side__crv.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Lower__side__trs.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "CTR__name__FK_Upper__side__crv.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Position__name__FK_IK_End__side__pos.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Position__name__FK_IK_Upper__side__pos.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Position__name__FK_IK_Lower__side__pos.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Offset__CTR__name__FK_Upper__side__trs.iog" "NodeTree__name_FK_IK__FK_Matrix.dsm"
		 -na;
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.msg" "NodeTree__name_FK_IK__FK_Matrix.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.msg" "NodeTree__name_FK_IK__FK_Matrix.dnsm"
		 -na;
connectAttr "Offset_CTR__name__FK_Upper__side__MultMatrix.msg" "NodeTree__name_FK_IK__FK_Matrix.dnsm"
		 -na;
connectAttr "nodeView1.msg" "MayaNodeEditorBookmarks.b[0]";
connectAttr "CTR__name__FK_Lower__side__crv.msg" "nodeView1.ni[0].dn";
connectAttr "Position__name__FK_IK_End__side__pos.msg" "nodeView1.ni[1].dn";
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.msg" "nodeView1.ni[2].dn"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.msg" "nodeView1.ni[3].dn";
connectAttr "Position__name__FK_IK_Lower__side__pos.msg" "nodeView1.ni[4].dn";
connectAttr "Offset_CTR__name__FK_Lower__side__trs.msg" "nodeView1.ni[5].dn";
connectAttr "Offset__CTR__name__FK_Upper__side__trs.msg" "nodeView1.ni[6].dn";
connectAttr "CTR__name__FK_Upper__side__crv.msg" "nodeView1.ni[7].dn";
connectAttr "Offset_CTR__name__FK_End__side__trs.msg" "nodeView1.ni[8].dn";
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.msg" "nodeView1.ni[9].dn"
		;
connectAttr "CTR__name__FK_End__side__crv.msg" "nodeView1.ni[10].dn";
connectAttr "Offset_CTR__name__FK_Upper__side__MultMatrix.msg" "nodeView1.ni[11].dn"
		;
connectAttr "Setup__name__FK_IK__side__Set.msg" "hyperLayout4.hyp[0].dn";
connectAttr "Position__name__FK_IK_Upper__side__pos.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "Position__name__FK_IK_Lower__side__pos.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "Position__name__FK_IK_End__side__pos.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "Position__name__IK_Pole__Side__trs.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "Properties__name__FK_IK__side__grp.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__crv.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_End__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_Lower__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "PRN__name__FK_IK_Upper__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "CTR__name__IK_Pole__side__crv.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "CTR__name__IK__side__crv.iog" "Setup__name__FK_IK__side__Set.dsm" -na
		;
connectAttr "__name__side__ikHandle.iog" "Setup__name__FK_IK__side__Set.dsm" -na
		;
connectAttr "__name__side__effector.iog" "Setup__name__FK_IK__side__Set.dsm" -na
		;
connectAttr "DRV__name__IK_End__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "DRV__name__IK_Lower__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "DRV__name__IK_Upper__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "__name__side__ikHandle_poleVectorConstraint1.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "Offset__name__side__ikHandle_trs.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "DRV__name__IK_Handle__side__jnt.iog" "Setup__name__FK_IK__side__Set.dsm"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__crvShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "hyperLayout1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "hyperLayout3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "Component__name__FK_IK__side__Asset.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "hyperLayout1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "DRV__name__FK_Upper__side__jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "Viewer__name__FK_Lower__side__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "Viewer__name__FK_Offset__side__ComposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "Viewer__name__FK_Lower__side__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "Component__name__FK_IK__side__Asset.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "DRV__name__FK_End__side__jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "Viewer__name__FK_Upper__side__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "Viewer__name__FK_Upper__side__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "DRV__name__FK_Lower__side__jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "Viewer__name__FK_End__side__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "Viewer__name__FK_End__side__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "CTR__name__FK_Upper__side__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "CTR__name__FK_Lower__side__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "Offset_CTR__name__FK_Lower__side__trs.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "Offset_CTR__name__FK_Upper__side__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "Offset__CTR__name__FK_Upper__side__trs.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn"
		;
connectAttr "Position__name__FK_IK_End__side__pos.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn"
		;
connectAttr "Offset_CTR__name__FK_End__side__trs.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "Position__name__FK_IK_Lower__side__pos.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn"
		;
connectAttr "Position__name__FK_IK_Upper__side__pos.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "CTR__name__FK_End__side__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn"
		;
connectAttr "Component__name__FK_IK__side__Asset.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn"
		;
connectAttr "SG_Pivot.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "INF_Pivot.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "Position__name__IK_Pole__Side__outline1_Shape.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "Position__name__IK_Pole__Side__outline2_Shape.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "Position__name__IK_Pole__Side__outline3_Shape.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "lambert1SG.pa" ":renderPartition.st" -na;
connectAttr "SG_Pivot.pa" ":renderPartition.st" -na;
connectAttr "SG_Warning_Red_Saturated.pa" ":renderPartition.st" -na;
connectAttr "SG_Warning_Red_Bright.pa" ":renderPartition.st" -na;
connectAttr "M_Pivot.msg" ":defaultShaderList1.s" -na;
connectAttr "M_Warning_Red_Saturated.msg" ":defaultShaderList1.s" -na;
connectAttr "M_Warning_Red_Bright.msg" ":defaultShaderList1.s" -na;
connectAttr "Viewer__name__FK_Upper__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name__FK_Lower__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name__FK_End__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name__IK_Upper__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name__IK_Lower__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name__IK_End__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV__name__IK_Lower__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV__name__FK_Lower__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CTR__name__FK_IK__side__Properties__SetRange.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV__name__FK_End__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV__name__IK_End__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Offset_CTR__name__FK_Lower__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Offset_CTR__name__FK_End__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV__name__IK_Pole__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer_DRV__name__FK_IK__side__IK_Angle__DistanceBetween.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer_StraightIK__name__FK_IK__side__Set_Range.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer_StraightIK__name__FK_IK__side__FloatLogic.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Offset_CTR__name__FK_Upper__side__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
// End of Component__FK_IK__002.ma
