//Maya ASCII 2024 scene
//Name: Component__FK_IK.ma
//Last modified: Wed, Sep 17, 2025 05:17:21 AM
//Codeset: UTF-8
requires maya "2024";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2024";
fileInfo "version" "2024";
fileInfo "cutIdentifier" "202310181224-69282f2959";
fileInfo "osv" "Mac OS X 15.6.1";
fileInfo "UUID" "B2CD387F-B74A-7193-02E1-968D20F920E2";
fileInfo "exportedFrom" "/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools/_Components/Component__FK_IK.ma";
createNode transform -s -n "persp";
	rename -uid "791AB2CA-5B47-9357-402D-B7B3A2065FB9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 17.283930287453998 19.500921617658648 34.147551671136256 ;
	setAttr ".r" -type "double3" -14.738352728933684 26.999999999894367 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "1B2153B1-5448-00E4-6908-75BC7A86B79C";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 1000;
	setAttr ".coi" 38.879710431727233;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 16 0 ;
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
createNode transform -n "Component__name_FK_IK__grp";
	rename -uid "E52DD3D8-794B-EB59-CA7E-3FA64BD74C33";
createNode transform -n "Viewer_Curves__name_FK_IK__grp" -p "Component__name_FK_IK__grp";
	rename -uid "E102804C-2B4D-3262-C9AF-A19AC29353A5";
	setAttr ".v" no;
createNode transform -n "Viewer__name_FK_Upper_L__crv" -p "Viewer_Curves__name_FK_IK__grp";
	rename -uid "A59C512B-134F-1CDD-075E-94944660FF8B";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.55199999 0.28979999 0.1904 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name_FK_Upper_L__crvShape" -p "Viewer__name_FK_Upper_L__crv";
	rename -uid "EE7E19E9-AD4A-56D5-07FB-08B0695602F4";
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
createNode transform -n "Viewer__name_FK_Lower_L__crv" -p "Viewer_Curves__name_FK_IK__grp";
	rename -uid "12EE772E-7C49-F28A-41EE-F789F29411E0";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.55199999 0.28979999 0.1904 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name_FK_Lower_L__crvShape" -p "Viewer__name_FK_Lower_L__crv";
	rename -uid "8D79753C-3149-DD0A-9937-E1ABD1B96F17";
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
createNode transform -n "Viewer__name_FK_End_L__crv" -p "Viewer_Curves__name_FK_IK__grp";
	rename -uid "97722DB1-7B4B-F3E8-C54D-E0BEAD16CA6A";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.55199999 0.28979999 0.1904 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name_FK_End_L__crvShape" -p "Viewer__name_FK_End_L__crv";
	rename -uid "8DA40F92-BA46-1C46-751A-1CA27353F61D";
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
createNode transform -n "Viewer__name_IK_Upper_L__crv" -p "Viewer_Curves__name_FK_IK__grp";
	rename -uid "58A63B1A-6048-D164-C00E-009D62A45F09";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.95498258 0.26899999 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name_IK_Upper_L__crvShape" -p "Viewer__name_IK_Upper_L__crv";
	rename -uid "EEA10420-3F41-43A5-D998-3DA8246925C5";
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
createNode transform -n "Viewer__name_IK_Lower_L__crv" -p "Viewer_Curves__name_FK_IK__grp";
	rename -uid "22B913F3-5D49-7A56-CB6F-6C9AA0D6C48F";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.95498258 0.26899999 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name_IK_Lower_L__crvShape" -p "Viewer__name_IK_Lower_L__crv";
	rename -uid "D072BF08-4C4A-9AEA-0084-F6BE618E1FAC";
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
createNode transform -n "Viewer__name_IK_End_L__crv" -p "Viewer_Curves__name_FK_IK__grp";
	rename -uid "0F97F34B-EF47-8AF5-96A3-388FF9A395D7";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.95498258 0.26899999 ;
	setAttr ".dla" yes;
createNode nurbsCurve -n "Viewer__name_IK_End_L__crvShape" -p "Viewer__name_IK_End_L__crv";
	rename -uid "92B9E2E8-724A-DE5D-E266-A19C37CE7522";
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
createNode transform -n "Controls__name_FK__grp" -p "Component__name_FK_IK__grp";
	rename -uid "77E01D92-E94F-90AD-8370-DB9AA724CB9D";
createNode transform -n "Offset_CTR_name_FK_Upper_L_trs" -p "Controls__name_FK__grp";
	rename -uid "CBB62E44-084A-C06B-AE9A-8E85C6AA4DF7";
	setAttr ".t" -type "double3" 0 16 0 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000057 ;
createNode transform -n "CTR_name_FK_Upper_L_crv" -p "Offset_CTR_name_FK_Upper_L_trs";
	rename -uid "5FE8B595-754A-F6D4-5B47-A6A32F297948";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
createNode nurbsCurve -n "CTR_name_FK_Upper_L_crvShape" -p "CTR_name_FK_Upper_L_crv";
	rename -uid "55DDE38F-574E-AD03-0E56-0CA845D64A58";
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
createNode joint -n "CTR_name_FK_Upper_L_jnt" -p "CTR_name_FK_Upper_L_crv";
	rename -uid "098BC71B-E045-E03A-E02E-6ABEFC73D52E";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Offset_CTR_name_FK_Lower_L_trs" -p "Controls__name_FK__grp";
	rename -uid "DE257BB2-0943-C50F-5FAC-DA8C994A6128";
	setAttr ".t" -type "double3" 0 8 0 ;
	setAttr ".r" -type "double3" 0 0 -90 ;
createNode transform -n "CTR_name_FK_Lower_L_crv" -p "Offset_CTR_name_FK_Lower_L_trs";
	rename -uid "EF62E445-2841-74AB-491B-5C9D148B851D";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
createNode nurbsCurve -n "CTR_name_FK_Lower_L_crvShape" -p "CTR_name_FK_Lower_L_crv";
	rename -uid "22C9521E-704A-080C-ACE1-5AA9E1E9F6E2";
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
createNode joint -n "CTR_name_FK_Lower_L_jnt" -p "CTR_name_FK_Lower_L_crv";
	rename -uid "2B7E2416-1A4A-7867-FA2C-028C33DAFB2A";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Offset_CTR_name_FK_End_L_trs" -p "Controls__name_FK__grp";
	rename -uid "5ADE2F01-7D4A-F1FC-0BFF-F19A2E99886A";
	setAttr ".t" -type "double3" -1.2575833298502675e-15 0 0 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000028 ;
createNode transform -n "CTR_name_FK_End_L_crv" -p "Offset_CTR_name_FK_End_L_trs";
	rename -uid "B5992740-614C-09BC-24D8-309D4F4B3360";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
createNode nurbsCurve -n "CTR_name_FK_End_L_crvShape" -p "CTR_name_FK_End_L_crv";
	rename -uid "3C362635-2847-3C0E-2B92-678DF1872079";
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
createNode joint -n "CTR_name_FK_End_L_jnt" -p "CTR_name_FK_End_L_crv";
	rename -uid "5743C472-E645-F499-6010-15A3120DDC66";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Controls__name_IK__grp" -p "Component__name_FK_IK__grp";
	rename -uid "5BB1C89F-0947-0123-5BE3-0C811BE32048";
createNode transform -n "Offset_CTR_name_IK_L_crv_trs" -p "Controls__name_IK__grp";
	rename -uid "EFDA4A0E-7C4F-5671-9467-B0B54121D8B9";
	setAttr ".r" -type "double3" 0 0 -90.000000000000028 ;
createNode transform -n "CTR_name_IK_L_crv" -p "Offset_CTR_name_IK_L_crv_trs";
	rename -uid "97A43F1B-7A41-A336-0267-AC95B58BC57B";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0 0 2 ;
createNode nurbsCurve -n "CTR_name_IK_L_crvShape" -p "CTR_name_IK_L_crv";
	rename -uid "3F08E607-C24D-EE7E-0CE9-04A14679D6B7";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 2 no 3
		5 0 0.25 0.5 0.75 1
		5
		-2.2204460492503131e-16 2.6432479794547157 -2.6432479794547157
		2.2204460492503131e-16 -2.6432479794547157 -2.6432479794547157
		2.2204460492503131e-16 -2.6432479794547157 2.6432479794547157
		-2.2204460492503131e-16 2.6432479794547157 2.6432479794547135
		-2.2204460492503131e-16 2.6432479794547157 -2.6432479794547157
		;
createNode joint -n "CTR_name_IK_L_jnt" -p "CTR_name_IK_L_crv";
	rename -uid "508CAAAA-2448-BC76-7EE3-F6A2CE9B7E5F";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.40000001 0.69999999 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 1.2;
createNode transform -n "Offset_CTR_name_IK_Pole_L_crv_trs" -p "Controls__name_IK__grp";
	rename -uid "1AFE0480-D64A-A363-9FC7-F4A14EB96CB0";
	setAttr ".t" -type "double3" 3.1427308044840174e-07 8 11 ;
	setAttr ".r" -type "double3" 0 0 -89.999999999999957 ;
createNode transform -n "CTR_name_IK_Pole_L_crv" -p "Offset_CTR_name_IK_Pole_L_crv_trs";
	rename -uid "D6482A24-3C44-112E-4279-B7AA04EA41AF";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.38600004 0.82299018 2 ;
	setAttr ".rp" -type "double3" 8.8817841970012523e-16 0 0 ;
	setAttr ".sp" -type "double3" 8.8817841970012523e-16 0 0 ;
createNode nurbsCurve -n "CTR_name_IK_Pole_L_crvShape" -p "CTR_name_IK_Pole_L_crv";
	rename -uid "CB5A9673-534B-0B4F-ED50-11A0CB90F221";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode joint -n "CTR_name_IK_Pole_L_jnt" -p "CTR_name_IK_Pole_L_crv";
	rename -uid "8EBB4945-7B46-7DC3-CA22-2D9E52B55E20";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
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
createNode nurbsCurve -n "CTR_name_IK_Pole_L_crvShapeOrig" -p "CTR_name_IK_Pole_L_crv";
	rename -uid "FE4B47F8-EF4B-81AF-F024-279CFA19DB9F";
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
createNode transform -n "Properties__name_FK_IK__grp" -p "Component__name_FK_IK__grp";
	rename -uid "072A531C-2444-B2AF-6FD8-C39AA470B5FD";
	setAttr ".t" -type "double3" 0 20 0 ;
	setAttr ".r" -type "double3" 90.000000000000057 0 0 ;
createNode transform -n "CTR__name_Properties__crv" -p "Properties__name_FK_IK__grp";
	rename -uid "033C4B11-B04E-31B8-58F8-1490960445A0";
	addAttr -ci true -sn "FK_IK_Switch" -ln "FK_IK_Switch" -nn "FK <> IK" -min 0 -max 
		10 -at "double";
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
	setAttr -k on ".FK_IK_Switch" 5;
createNode nurbsCurve -n "CTR__name_Properties__crvShape" -p "CTR__name_Properties__crv";
	rename -uid "A6239A07-644B-7B97-84D7-FD8CDC213006";
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
createNode nurbsCurve -n "CTR__name_Properties__crvShape1" -p "CTR__name_Properties__crv";
	rename -uid "4C1F12C2-8B4C-F4F0-646C-A59CCF5BA530";
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
createNode nurbsCurve -n "CTR__name_Properties__crvShape2" -p "CTR__name_Properties__crv";
	rename -uid "8D821F56-9C46-D2F2-9231-1680A0B1D6C6";
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
createNode transform -n "System__name_FK_IK__grp" -p "Component__name_FK_IK__grp";
	rename -uid "C9A955FD-454D-DA3D-9262-6B85D40A7663";
createNode joint -n "DRV_name_FK_Upper_L_jnt" -p "System__name_FK_IK__grp";
	rename -uid "4960B015-9041-5EA5-139F-B78594909370";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "DRV_name_FK_Lower_L_jnt" -p "DRV_name_FK_Upper_L_jnt";
	rename -uid "61E3665B-584A-06E7-F6E2-8BBB8D8ABAAC";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "DRV_name_FK_End_L_jnt" -p "DRV_name_FK_Lower_L_jnt";
	rename -uid "64104A69-D249-8A24-F3D0-4FBCFDFE0537";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".opm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -1.2575833298502675e-15 0 0 1;
	setAttr ".jo" -type "double3" 0 0 89.999999999999986 ;
	setAttr ".radi" 0.5;
createNode parentConstraint -n "DRV_name_FK_End_L_jnt_parentConstraint1" -p "DRV_name_FK_End_L_jnt";
	rename -uid "C76F02C7-AC43-2493-8191-4C862D809845";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "CTR_name_FK_End_L_jntW0" -dv 1 -min 
		0 -at "double";
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
createNode parentConstraint -n "DRV_name_FK_Lower_L_jnt_parentConstraint1" -p "DRV_name_FK_Lower_L_jnt";
	rename -uid "263C3261-7C4B-C9B5-09CE-3DACB71520F5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "CTR_name_FK_Lower_L_jntW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 5.3290705182007514e-15 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "DRV_name_FK_Upper_L_jnt_parentConstraint1" -p "DRV_name_FK_Upper_L_jnt";
	rename -uid "E3DDD92C-E246-C9ED-8805-E3BA9BBC50F1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "CTR_name_FK_Upper_L_jntW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 0 -90.000000000000057 ;
	setAttr ".rst" -type "double3" 0 16 0 ;
	setAttr ".rsrr" -type "double3" 0 0 -90.000000000000057 ;
	setAttr -k on ".w0";
createNode joint -n "DRV_name_IK_Upper_L_jnt" -p "System__name_FK_IK__grp";
	rename -uid "21E40772-4F4D-FBE5-A7EA-3EAD4DBCD656";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".t" -type "double3" 0 16 0 ;
	setAttr ".r" -type "double3" 1.5224965646281382e-05 -2.1389865039415207e-07 1.5199502010244443e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.2508151971410476e-06 -2.2508151049323824e-06 -89.999999999999957 ;
	setAttr ".radi" 0.2;
createNode joint -n "DRV_name_IK_Lower_L_jnt" -p "DRV_name_IK_Upper_L_jnt";
	rename -uid "4A800FF3-5C49-1CB4-853F-52A23C26F37B";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".t" -type "double3" 8 3.0025376703741241e-15 1.0587911840678754e-22 ;
	setAttr ".r" -type "double3" 3.2009701831389208e-14 4.9299516098366046e-06 -3.4938452221529697e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.5016301983727808e-06 ;
	setAttr ".pa" -type "double3" 0 90 0 ;
	setAttr ".radi" 0.2;
createNode joint -n "DRV_name_IK_End_L_jnt" -p "DRV_name_IK_Lower_L_jnt";
	rename -uid "5FD355A4-8D4D-C439-2D79-E794C3D1BCAE";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".t" -type "double3" 7.9999999999999982 2.8453065954836651e-15 -4.2351647362715017e-22 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.2;
createNode ikEffector -n "name_effector" -p "DRV_name_IK_Lower_L_jnt";
	rename -uid "72390087-6442-A760-D492-FBA2FCDCFF64";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "PRN_name_FK_IK_Upper_L_jnt" -p "System__name_FK_IK__grp";
	rename -uid "EE59108D-0B44-D2C9-EB35-29ACB1F65076";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.30000001 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 2.6528135510517364e-07 -0.99999999999996425 3.9284124013341526e-08 0
		 0.99999999999993916 2.6528136398695779e-07 2.2644163256525081e-07 0 -2.2644164298658865e-07 3.9284063942595965e-08 0.99999999999997335 0
		 0 16 0 1;
	setAttr ".radi" 1.6;
createNode joint -n "PRN_name_FK_IK_Lower_L_jnt" -p "PRN_name_FK_IK_Upper_L_jnt";
	rename -uid "C63A3831-AF48-1352-3C1A-50B8D9717F26";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.30000001 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" -2.6594138355849631e-07 -0.99999999999996358 -4.6759883833253987e-08 0
		 0.99999999999993894 -2.6594139416064577e-07 2.2644165343383958e-07 0 -2.2644166586921998e-07 -4.6759823613044585e-08 0.99999999999997291 0
		 2.1222508438439274e-06 8.0000000000002878 3.1427299210673306e-07 1;
	setAttr ".radi" 1.6;
createNode joint -n "PRN_name_FK_IK_End_L_jnt" -p "PRN_name_FK_IK_Lower_L_jnt";
	rename -uid "8EC2C636-3246-4E7A-9B5E-2B86682EB660";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.30000001 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".radi" 1.6;
createNode transform -n "Offset_DRV_name_IK_Handle_L_trs" -p "System__name_FK_IK__grp";
	rename -uid "5ECE6494-A145-3629-5633-119435A477A8";
createNode joint -n "DRV_name_IK_Handle_L_jnt" -p "Offset_DRV_name_IK_Handle_L_trs";
	rename -uid "0A6F56FF-9243-5866-936D-C8998DE75C97";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode transform -n "Offset_name_ikHandle_trs" -p "DRV_name_IK_Handle_L_jnt";
	rename -uid "7722AC8F-C84F-F1F1-22A0-5E96AB9F0DD3";
	setAttr ".t" -type "double3" -2.4428937844856154e-32 0 0 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
createNode ikHandle -n "name_ikHandle" -p "Offset_name_ikHandle_trs";
	rename -uid "A0177170-2B43-D40A-BF3F-0D9E49FCF155";
	setAttr ".hpr" 4;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "name_ikHandle_poleVectorConstraint1" -p "name_ikHandle";
	rename -uid "62AC8B83-8941-DADD-6FDC-5ABD45896A3B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "DRV_IK_Pole_L_jntW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "Offset_DRV_name_IK_Pole_L_trs" -p "System__name_FK_IK__grp";
	rename -uid "9DEC4283-CD45-9C83-3546-B5A0A027146F";
	setAttr ".t" -type "double3" 3.1427308044840174e-07 8 11 ;
	setAttr ".r" -type "double3" 0 0 -89.999999999999957 ;
createNode joint -n "DRV_name_IK_Pole_L_jnt" -p "Offset_DRV_name_IK_Pole_L_trs";
	rename -uid "EF13DFB5-AA4D-8D84-FFD4-898514152E60";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.69999999 0.30000001 2 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 7.7715611723760958e-16 -1 0 0 1 7.7715611723760958e-16 0 0
		 0 0 1 0 3.1427308044840174e-07 8 11 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "DRV_name_IK_Pole_L_jnt_aimConstraint1" -p "DRV_name_IK_Pole_L_jnt";
	rename -uid "F90679DA-3C40-6BBD-B356-1384A654C670";
	addAttr -dcb 0 -ci true -sn "w0" -ln "DRV_name_IK_Shape_Line_Start_L_jntW0" -dv 
		1 -at "double";
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
createNode joint -n "DRV_name_IK_Shape_Line_Start_L_jnt" -p "System__name_FK_IK__grp";
	rename -uid "34CF8B51-8147-6CDE-1871-C786F6383BAC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
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
createNode dagContainer -n "Component_name_FK_IK__Asset" -p "Component__name_FK_IK__grp";
	rename -uid "8E45473C-B74B-7C5C-F34A-678B4FE6F486";
	setAttr ".isc" yes;
	setAttr ".bbx" yes;
	setAttr ".icn" -type "string" "QR_selectAll.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/09/16 17:33:52";
createNode dagContainer -n "Viewer__name_FK_IK__Asset" -p "Component_name_FK_IK__Asset";
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
createNode dagContainer -n "System__name_FK_IK__Asset" -p "Component_name_FK_IK__Asset";
	rename -uid "E8396078-0945-161B-FF76-D7817A85F597";
	setAttr ".isc" yes;
	setAttr ".bbx" yes;
	setAttr ".icn" -type "string" "falloff_primitive.png";
	setAttr ".ctor" -type "string" "zophiekat";
	setAttr ".cdat" -type "string" "2025/09/16 15:12:44";
createNode transform -n "Position__name_FK_IK_Upper__trs";
	rename -uid "DA5E3F88-8648-BF2C-4DAE-1BAC1C983755";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73710018 0 ;
	setAttr ".t" -type "double3" 0 16 0 ;
	setAttr ".r" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
	setAttr -cb on ".Line_Width_Circle" -1;
	setAttr -cb on ".Line_Width_Outline" 8;
	setAttr -cb on ".Line_Width_Axes" 8;
createNode nurbsCurve -n "Position__name_FK_Upper__outline1_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "BC34E563-FA43-6AB6-F9C2-A294364F2F90";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.64954000652299693 3.9772854495326871e-17 -0.64954000652299582
		-1.0479993989651161e-16 5.6247310241583062e-17 -0.9185882865287307
		-0.64954000652299648 3.9772854495326908e-17 -0.64954000652299648
		-0.9185882865287307 1.4357197466220823e-32 -2.6317484459166608e-16
		-0.6495400065229967 -3.9772854495326878e-17 0.64954000652299615
		-2.7678857800881757e-16 -5.6247310241583086e-17 0.9185882865287307
		0.64954000652299582 -3.9772854495326915e-17 0.64954000652299648
		0.9185882865287307 -3.2152405899514894e-32 4.9638462019634506e-16
		0.64954000652299693 3.9772854495326871e-17 -0.64954000652299582
		-1.0479993989651161e-16 5.6247310241583062e-17 -0.9185882865287307
		-0.64954000652299648 3.9772854495326908e-17 -0.64954000652299648
		;
createNode mesh -n "Position__name_FK_Upper__origin1_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "18CF0CC2-AD44-CFB2-852E-7D8308BB308B";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_Upper__circle1_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "911F55E0-2744-0231-5BA0-13B2866B3143";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0852224216856956 1.2768304821138377e-16 -2.0852224216856889
		-3.3643991481498132e-16 1.8057109846567665e-16 -2.9489498293123755
		-2.0852224216856903 1.2768304821138385e-16 -2.0852224216856903
		-2.9489498293123755 6.2561940436228878e-32 -1.038944445904395e-15
		-2.0852224216856921 -1.276830482113838e-16 2.0852224216856898
		-8.8857613562568408e-16 -1.8057109846567667e-16 2.9489498293123764
		2.0852224216856889 -1.2768304821138385e-16 2.0852224216856903
		2.9489498293123755 -8.67481355991061e-32 1.3994741436724598e-15
		2.0852224216856956 1.2768304821138377e-16 -2.0852224216856889
		-3.3643991481498132e-16 1.8057109846567665e-16 -2.9489498293123755
		-2.0852224216856903 1.2768304821138385e-16 -2.0852224216856903
		;
createNode nurbsCurve -n "Position__name_FK_Upper__Axis_Y_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "F290B989-1A46-623B-2825-CBAF62FA1AB6";
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
createNode nurbsCurve -n "Position__name_FK_Upper__Axis_Z_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "58DB36DB-864F-1AC6-B4FB-C088C48428A6";
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
createNode nurbsCurve -n "Position__name_FK_Upper__Axis_X_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "7D5E98B4-F24E-3B07-CF16-DF898E8BED31";
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
createNode nurbsCurve -n "Position__name_FK_Upper__outline2_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "0837578A-3C40-BD45-B8BC-2ABB90A51162";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.64954017883380966 -0.64953983421211525 1.7259950994488994e-07
		0.91858828652867486 2.4368435447286174e-07 2.0800663191645937e-07
		0.6495398342121036 0.64954017883383131 1.2156628997491492e-07
		-2.4368434557884147e-07 0.91858828652869917 -3.6085935906554123e-08
		-0.64954017883380999 0.64953983421211348 -1.7259950994488999e-07
		-0.91858828652867486 -2.4368435447286174e-07 -2.080066319164594e-07
		-0.6495398342121036 -0.64954017883383131 -1.2156628997491495e-07
		2.436843453456317e-07 -0.9185882865286974 3.608593590655407e-08
		0.64954017883380966 -0.64953983421211525 1.7259950994488994e-07
		0.91858828652867486 2.4368435447286174e-07 2.0800663191645937e-07
		0.6495398342121036 0.64954017883383131 1.2156628997491492e-07
		;
createNode mesh -n "Position__name_FK_Upper__origin2_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "DAF06328-574E-D8B5-FB1B-71AA63DEF710";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".pt[0:31]" -type "float3"  -0.64923012 0.16120529 -0.81043595 
		-0.97164148 -0.16120625 -0.81043595 -1.146129 -0.45907497 -0.68705434 -1.146129 -0.68705463 
		-0.45907506 -0.97164118 -0.81043625 -0.16120565 -0.64922976 -0.8104353 0.16120584 
		-0.22797906 -0.68705368 0.45907509 0.22797954 -0.45907497 0.68705446 0.64923018 -0.16120529 
		0.81043595 0.97164142 0.16120529 0.81043595 1.1461291 0.45907593 0.68705428 1.1461289 
		0.68705368 0.45907483 0.97164124 0.81043625 0.16120568 0.64922959 0.81043625 -0.1612059 
		0.22797871 0.68705368 -0.45907527 -0.22797969 0.45907402 -0.68705451 -0.82631308 
		0 -0.82631326 -1.07963 -0.31621647 -0.76341391 -1.168583 -0.58429146 -0.5842917 -1.0796299 
		-0.76341343 -0.31621635 -0.82631278 -0.82631302 8.2678007e-08 -0.44719714 -0.76341343 
		0.31621647 2.7421089e-07 -0.58429146 0.58429182 0.44719765 -0.31621647 0.76341397 
		0.82631314 0 0.82631326 1.07963 0.31621742 0.76341391 1.168583 0.58429146 0.58429158 
		1.0796298 0.76341438 0.3162162 0.82631278 0.82631302 -1.0778651e-07 0.44719696 0.76341438 
		-0.31621659 -4.5302482e-07 0.58429146 -0.58429193 -0.44719768 0.31621552 -0.76341397;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_Upper__circle2_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "E27B96CD-2C4C-D6F7-4FCF-5FB4A1740AE3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0852229748561926 -2.0852218685149708 5.5409730654720603e-07
		2.9489498293121961 7.8230143429891541e-07 6.6776501581995693e-07
		2.0852218685149326 2.085222974856265 3.9026503530366031e-07
		-7.8230140712780968e-07 2.9489498293122693 -1.1584690997350496e-07
		-2.0852229748561935 2.0852218685149673 -5.5409730654720614e-07
		-2.948949829312197 -7.8230143429891541e-07 -6.6776501581995714e-07
		-2.0852218685149326 -2.0852229748562632 -3.9026503530366036e-07
		7.8230140676727995e-07 -2.9489498293122693 1.1584690997350488e-07
		2.0852229748561926 -2.0852218685149708 5.5409730654720603e-07
		2.9489498293121961 7.8230143429891541e-07 6.6776501581995693e-07
		2.0852218685149326 2.085222974856265 3.9026503530366031e-07
		;
createNode nurbsCurve -n "Position__name_FK_Upper__outline3_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "B8D4EF23-954A-CE31-A68B-39A10ECF8B27";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.7231086246738414e-07 0.64954015580281643 -0.64953985724311913
		-2.4368435802557542e-07 0.91858828652867419 2.1111360351369751e-07
		-1.7231086246738414e-07 0.64953985724309593 0.64954015580283986
		0 -2.1111360314572271e-07 0.91858828652870639
		1.7231086246738414e-07 -0.64954015580281677 0.64953985724311891
		2.4368435980193226e-07 -0.91858828652867419 -2.1111360313210899e-07
		1.7231086246738414e-07 -0.64953985724309593 -0.64954015580283919
		0 2.1111360291251294e-07 -0.91858828652870639
		-1.7231086246738414e-07 0.64954015580281643 -0.64953985724311913
		-2.4368435802557542e-07 0.91858828652867419 2.1111360351369751e-07
		-1.7231086246738414e-07 0.64953985724309593 0.64954015580283986
		;
createNode mesh -n "Position__name_FK_Upper__origin3_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "A33F1E52-B14B-A8AA-623C-B59648C65D8C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".pt[0:31]" -type "float3"  0.16120571 -0.81043625 -0.64923024 
		-0.16120571 -0.81043625 -0.97164166 -0.45907497 -0.68705368 -1.1461294 -0.68705422 
		-0.45907402 -1.1461293 -0.81043577 -0.16120529 -0.97164148 -0.81043577 0.16120625 
		-0.64922994 -0.68705422 0.45907497 -0.22797914 -0.45907485 0.68705463 0.22797959 
		-0.16120559 0.81043625 0.64923036 0.16120571 0.8104353 0.97164166 0.45907509 0.68705368 
		1.1461294 0.68705434 0.45907497 1.1461291 0.81043577 0.16120529 0.97164148 0.81043565 
		-0.16120529 0.64922976 0.68705404 -0.45907593 0.22797878 0.4590748 -0.68705368 -0.22797973 
		0 -0.82631302 -0.82631326 -0.31621635 -0.76341438 -1.0796303 -0.58429158 -0.58429146 
		-1.1685833 -0.76341373 -0.31621552 -1.0796301 -0.82631308 0 -0.82631302 -0.76341373 
		0.31621647 -0.44719729 -0.58429152 0.58429146 2.5349354e-07 -0.31621623 0.76341343 
		0.44719774 5.9604645e-08 0.82631302 0.82631332 0.31621635 0.76341343 1.0796303 0.5842917 
		0.58429146 1.1685833 0.76341379 0.31621552 1.07963 0.82631308 0 0.82631302 0.76341367 
		-0.31621742 0.44719711 0.58429146 -0.58429146 -4.323075e-07 0.3162162 -0.76341438 
		-0.44719777;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_Upper__circle3_Shape" -p "Position__name_FK_IK_Upper__trs";
	rename -uid "F44CB3FF-9342-A327-D01D-F68DB0542C0F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-5.5317066127713588e-07 2.0852229009196481 -2.085221942451553
		-7.8230145561519748e-07 2.9489498293121943 6.7773934653560031e-07
		-5.5317066127713588e-07 2.0852219424514744 2.0852229009197227
		0 -6.7773934516021595e-07 2.9489498293122978
		5.5317066482984956e-07 -2.085222900919649 2.0852219424515495
		7.8230145383884064e-07 -2.9489498293121952 -6.7773934531058452e-07
		5.5317066482984956e-07 -2.0852219424514744 -2.0852229009197214
		0 6.7773934479968622e-07 -2.9489498293122978
		-5.5317066127713588e-07 2.0852229009196481 -2.085221942451553
		-7.8230145561519748e-07 2.9489498293121943 6.7773934653560031e-07
		-5.5317066127713588e-07 2.0852219424514744 2.0852229009197227
		;
createNode transform -n "Position__name_FK_IK_Lower__trs";
	rename -uid "F3E26C9A-014C-A290-0733-52999C320EF6";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73710018 0 ;
	setAttr ".t" -type "double3" 2.1222508621576708e-06 8 3.1427299518327345e-07 ;
	setAttr ".r" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
	setAttr -cb on ".Line_Width_Circle" -1;
	setAttr -cb on ".Line_Width_Outline" 8;
	setAttr -cb on ".Line_Width_Axes" 8;
createNode nurbsCurve -n "Position__name_FK_Lower__outline1_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "761C40A3-E44F-3E88-CCFC-8A834B8C86F3";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.64954000652299693 3.9772854495326871e-17 -0.64954000652299582
		-1.0479993989651161e-16 5.6247310241583062e-17 -0.9185882865287307
		-0.64954000652299648 3.9772854495326908e-17 -0.64954000652299648
		-0.9185882865287307 1.4357197466220823e-32 -2.6317484459166608e-16
		-0.6495400065229967 -3.9772854495326878e-17 0.64954000652299615
		-2.7678857800881757e-16 -5.6247310241583086e-17 0.9185882865287307
		0.64954000652299582 -3.9772854495326915e-17 0.64954000652299648
		0.9185882865287307 -3.2152405899514894e-32 4.9638462019634506e-16
		0.64954000652299693 3.9772854495326871e-17 -0.64954000652299582
		-1.0479993989651161e-16 5.6247310241583062e-17 -0.9185882865287307
		-0.64954000652299648 3.9772854495326908e-17 -0.64954000652299648
		;
createNode mesh -n "Position__name_FK_Lower__origin1_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "96BA042D-FB4B-5247-3654-C496505BBA4E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_Lower__circle1_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "0BC7B2F8-7D47-6121-FC6C-9FB69C79577C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0852224216856956 1.2768304821138377e-16 -2.0852224216856889
		-3.3643991481498132e-16 1.8057109846567665e-16 -2.9489498293123755
		-2.0852224216856903 1.2768304821138385e-16 -2.0852224216856903
		-2.9489498293123755 6.2561940436228878e-32 -1.038944445904395e-15
		-2.0852224216856921 -1.276830482113838e-16 2.0852224216856898
		-8.8857613562568408e-16 -1.8057109846567667e-16 2.9489498293123764
		2.0852224216856889 -1.2768304821138385e-16 2.0852224216856903
		2.9489498293123755 -8.67481355991061e-32 1.3994741436724598e-15
		2.0852224216856956 1.2768304821138377e-16 -2.0852224216856889
		-3.3643991481498132e-16 1.8057109846567665e-16 -2.9489498293123755
		-2.0852224216856903 1.2768304821138385e-16 -2.0852224216856903
		;
createNode nurbsCurve -n "Position__name_FK_Lower__Axis_Y_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "A5B91373-5642-3421-3242-15A447E0713A";
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
createNode nurbsCurve -n "Position__name_FK_Lower__Axis_Z_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "D0C9AD51-4A43-2544-1109-2D96F12E5C98";
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
createNode nurbsCurve -n "Position__name_FK_Lower__Axis_X_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "2313478D-F049-0BBB-673C-69B922F82394";
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
createNode nurbsCurve -n "Position__name_FK_Lower__outline2_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "7FF8365F-4A40-739D-3C36-059DED1D7450";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.64954017883380966 -0.64953983421211525 1.7259950994488994e-07
		0.91858828652867486 2.4368435447286174e-07 2.0800663191645937e-07
		0.6495398342121036 0.64954017883383131 1.2156628997491492e-07
		-2.4368434557884147e-07 0.91858828652869917 -3.6085935906554123e-08
		-0.64954017883380999 0.64953983421211348 -1.7259950994488999e-07
		-0.91858828652867486 -2.4368435447286174e-07 -2.080066319164594e-07
		-0.6495398342121036 -0.64954017883383131 -1.2156628997491495e-07
		2.436843453456317e-07 -0.9185882865286974 3.608593590655407e-08
		0.64954017883380966 -0.64953983421211525 1.7259950994488994e-07
		0.91858828652867486 2.4368435447286174e-07 2.0800663191645937e-07
		0.6495398342121036 0.64954017883383131 1.2156628997491492e-07
		;
createNode mesh -n "Position__name_FK_Lower__origin2_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "5FA0AF09-D547-1524-5411-4DAE3CD9D023";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".pt[0:31]" -type "float3"  -0.64923012 0.16120529 -0.81043595 
		-0.97164148 -0.16120625 -0.81043595 -1.146129 -0.45907497 -0.68705434 -1.146129 -0.68705463 
		-0.45907506 -0.97164118 -0.81043625 -0.16120565 -0.64922976 -0.8104353 0.16120584 
		-0.22797906 -0.68705368 0.45907509 0.22797954 -0.45907497 0.68705446 0.64923018 -0.16120529 
		0.81043595 0.97164142 0.16120529 0.81043595 1.1461291 0.45907593 0.68705428 1.1461289 
		0.68705368 0.45907483 0.97164124 0.81043625 0.16120568 0.64922959 0.81043625 -0.1612059 
		0.22797871 0.68705368 -0.45907527 -0.22797969 0.45907402 -0.68705451 -0.82631308 
		0 -0.82631326 -1.07963 -0.31621647 -0.76341391 -1.168583 -0.58429146 -0.5842917 -1.0796299 
		-0.76341343 -0.31621635 -0.82631278 -0.82631302 8.2678007e-08 -0.44719714 -0.76341343 
		0.31621647 2.7421089e-07 -0.58429146 0.58429182 0.44719765 -0.31621647 0.76341397 
		0.82631314 0 0.82631326 1.07963 0.31621742 0.76341391 1.168583 0.58429146 0.58429158 
		1.0796298 0.76341438 0.3162162 0.82631278 0.82631302 -1.0778651e-07 0.44719696 0.76341438 
		-0.31621659 -4.5302482e-07 0.58429146 -0.58429193 -0.44719768 0.31621552 -0.76341397;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_Lower__circle2_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "14578ABA-7647-582D-AE47-F993FD929B9A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0852229748561926 -2.0852218685149708 5.5409730654720603e-07
		2.9489498293121961 7.8230143429891541e-07 6.6776501581995693e-07
		2.0852218685149326 2.085222974856265 3.9026503530366031e-07
		-7.8230140712780968e-07 2.9489498293122693 -1.1584690997350496e-07
		-2.0852229748561935 2.0852218685149673 -5.5409730654720614e-07
		-2.948949829312197 -7.8230143429891541e-07 -6.6776501581995714e-07
		-2.0852218685149326 -2.0852229748562632 -3.9026503530366036e-07
		7.8230140676727995e-07 -2.9489498293122693 1.1584690997350488e-07
		2.0852229748561926 -2.0852218685149708 5.5409730654720603e-07
		2.9489498293121961 7.8230143429891541e-07 6.6776501581995693e-07
		2.0852218685149326 2.085222974856265 3.9026503530366031e-07
		;
createNode nurbsCurve -n "Position__name_FK_Lower__outline3_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "B2BD53B6-7E40-F28D-7EE7-988FA7C1F98B";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.7231086246738414e-07 0.64954015580281643 -0.64953985724311913
		-2.4368435802557542e-07 0.91858828652867419 2.1111360351369751e-07
		-1.7231086246738414e-07 0.64953985724309593 0.64954015580283986
		0 -2.1111360314572271e-07 0.91858828652870639
		1.7231086246738414e-07 -0.64954015580281677 0.64953985724311891
		2.4368435980193226e-07 -0.91858828652867419 -2.1111360313210899e-07
		1.7231086246738414e-07 -0.64953985724309593 -0.64954015580283919
		0 2.1111360291251294e-07 -0.91858828652870639
		-1.7231086246738414e-07 0.64954015580281643 -0.64953985724311913
		-2.4368435802557542e-07 0.91858828652867419 2.1111360351369751e-07
		-1.7231086246738414e-07 0.64953985724309593 0.64954015580283986
		;
createNode mesh -n "Position__name_FK_Lower__origin3_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "A07B0A9D-7F43-7F23-9741-63968CA57F6C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".pt[0:31]" -type "float3"  0.16120571 -0.81043625 -0.64923024 
		-0.16120571 -0.81043625 -0.97164166 -0.45907497 -0.68705368 -1.1461294 -0.68705422 
		-0.45907402 -1.1461293 -0.81043577 -0.16120529 -0.97164148 -0.81043577 0.16120625 
		-0.64922994 -0.68705422 0.45907497 -0.22797914 -0.45907485 0.68705463 0.22797959 
		-0.16120559 0.81043625 0.64923036 0.16120571 0.8104353 0.97164166 0.45907509 0.68705368 
		1.1461294 0.68705434 0.45907497 1.1461291 0.81043577 0.16120529 0.97164148 0.81043565 
		-0.16120529 0.64922976 0.68705404 -0.45907593 0.22797878 0.4590748 -0.68705368 -0.22797973 
		0 -0.82631302 -0.82631326 -0.31621635 -0.76341438 -1.0796303 -0.58429158 -0.58429146 
		-1.1685833 -0.76341373 -0.31621552 -1.0796301 -0.82631308 0 -0.82631302 -0.76341373 
		0.31621647 -0.44719729 -0.58429152 0.58429146 2.5349354e-07 -0.31621623 0.76341343 
		0.44719774 5.9604645e-08 0.82631302 0.82631332 0.31621635 0.76341343 1.0796303 0.5842917 
		0.58429146 1.1685833 0.76341379 0.31621552 1.07963 0.82631308 0 0.82631302 0.76341367 
		-0.31621742 0.44719711 0.58429146 -0.58429146 -4.323075e-07 0.3162162 -0.76341438 
		-0.44719777;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_Lower__circle3_Shape" -p "Position__name_FK_IK_Lower__trs";
	rename -uid "DF7EFB89-B642-4708-F7C4-B9AD682897CD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-5.5317066127713588e-07 2.0852229009196481 -2.085221942451553
		-7.8230145561519748e-07 2.9489498293121943 6.7773934653560031e-07
		-5.5317066127713588e-07 2.0852219424514744 2.0852229009197227
		0 -6.7773934516021595e-07 2.9489498293122978
		5.5317066482984956e-07 -2.085222900919649 2.0852219424515495
		7.8230145383884064e-07 -2.9489498293121952 -6.7773934531058452e-07
		5.5317066482984956e-07 -2.0852219424514744 -2.0852229009197214
		0 6.7773934479968622e-07 -2.9489498293122978
		-5.5317066127713588e-07 2.0852229009196481 -2.085221942451553
		-7.8230145561519748e-07 2.9489498293121943 6.7773934653560031e-07
		-5.5317066127713588e-07 2.0852219424514744 2.0852229009197227
		;
createNode transform -n "Position__name_FK_IK_End__trs";
	rename -uid "43ADF733-FB45-0957-6516-48870F674824";
	addAttr -ci true -sn "Line_Width_Circle" -ln "Line_Width_Circle" -at "double";
	addAttr -ci true -sn "Line_Width_Outline" -ln "Line_Width_Outline" -at "double";
	addAttr -ci true -sn "Line_Width_Axes" -ln "Line_Width_Axes" -at "double";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 0.73710018 0 ;
	setAttr ".t" -type "double3" -5.2802215932956642e-09 5.8175686490358203e-13 -5.9806076535551256e-08 ;
	setAttr ".r" -type "double3" 1.2974149852041134e-05 -2.2508145078329992e-06 -89.99998480049797 ;
	setAttr -cb on ".Line_Width_Circle" -1;
	setAttr -cb on ".Line_Width_Outline" 8;
	setAttr -cb on ".Line_Width_Axes" 8;
createNode nurbsCurve -n "Position__name_FK_End__outline1_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "5F674B50-DD43-2AA1-58CE-5CAFF1FC7EDD";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.64954000652299693 3.9772854495326871e-17 -0.64954000652299582
		-1.0479993989651161e-16 5.6247310241583062e-17 -0.9185882865287307
		-0.64954000652299648 3.9772854495326908e-17 -0.64954000652299648
		-0.9185882865287307 1.4357197466220823e-32 -2.6317484459166608e-16
		-0.6495400065229967 -3.9772854495326878e-17 0.64954000652299615
		-2.7678857800881757e-16 -5.6247310241583086e-17 0.9185882865287307
		0.64954000652299582 -3.9772854495326915e-17 0.64954000652299648
		0.9185882865287307 -3.2152405899514894e-32 4.9638462019634506e-16
		0.64954000652299693 3.9772854495326871e-17 -0.64954000652299582
		-1.0479993989651161e-16 5.6247310241583062e-17 -0.9185882865287307
		-0.64954000652299648 3.9772854495326908e-17 -0.64954000652299648
		;
createNode mesh -n "Position__name_FK_End__origin1_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "69E4B9B0-0245-B200-0AA6-F0B5A4F9A932";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_End__circle1_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "15ACD7BF-3944-8085-4D7F-55B7DF94FE31";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0852224216856956 1.2768304821138377e-16 -2.0852224216856889
		-3.3643991481498132e-16 1.8057109846567665e-16 -2.9489498293123755
		-2.0852224216856903 1.2768304821138385e-16 -2.0852224216856903
		-2.9489498293123755 6.2561940436228878e-32 -1.038944445904395e-15
		-2.0852224216856921 -1.276830482113838e-16 2.0852224216856898
		-8.8857613562568408e-16 -1.8057109846567667e-16 2.9489498293123764
		2.0852224216856889 -1.2768304821138385e-16 2.0852224216856903
		2.9489498293123755 -8.67481355991061e-32 1.3994741436724598e-15
		2.0852224216856956 1.2768304821138377e-16 -2.0852224216856889
		-3.3643991481498132e-16 1.8057109846567665e-16 -2.9489498293123755
		-2.0852224216856903 1.2768304821138385e-16 -2.0852224216856903
		;
createNode nurbsCurve -n "Position__name_FK_End__Axis_Y_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "31703AA8-F749-98B0-87BA-D49B9FA973F1";
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
createNode nurbsCurve -n "Position__name_FK_End__Axis_Z_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "03BC2711-AC47-2282-E494-6BAAEB99E2C5";
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
createNode nurbsCurve -n "Position__name_FK_End__Axis_X_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "3D92DD88-404F-10CA-E7F2-55B3F157637B";
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
createNode nurbsCurve -n "Position__name_FK_End__outline2_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "CD788BB2-E740-6F21-7571-8EB45C830F5A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.64954017883380966 -0.64953983421211525 1.7259950994488994e-07
		0.91858828652867486 2.4368435447286174e-07 2.0800663191645937e-07
		0.6495398342121036 0.64954017883383131 1.2156628997491492e-07
		-2.4368434557884147e-07 0.91858828652869917 -3.6085935906554123e-08
		-0.64954017883380999 0.64953983421211348 -1.7259950994488999e-07
		-0.91858828652867486 -2.4368435447286174e-07 -2.080066319164594e-07
		-0.6495398342121036 -0.64954017883383131 -1.2156628997491495e-07
		2.436843453456317e-07 -0.9185882865286974 3.608593590655407e-08
		0.64954017883380966 -0.64953983421211525 1.7259950994488994e-07
		0.91858828652867486 2.4368435447286174e-07 2.0800663191645937e-07
		0.6495398342121036 0.64954017883383131 1.2156628997491492e-07
		;
createNode mesh -n "Position__name_FK_End__origin2_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "B8698472-1743-C08F-1C1A-5682ED4C5253";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".pt[0:31]" -type "float3"  -0.64923012 0.16120529 -0.81043595 
		-0.97164148 -0.16120625 -0.81043595 -1.146129 -0.45907497 -0.68705434 -1.146129 -0.68705463 
		-0.45907506 -0.97164118 -0.81043625 -0.16120565 -0.64922976 -0.8104353 0.16120584 
		-0.22797906 -0.68705368 0.45907509 0.22797954 -0.45907497 0.68705446 0.64923018 -0.16120529 
		0.81043595 0.97164142 0.16120529 0.81043595 1.1461291 0.45907593 0.68705428 1.1461289 
		0.68705368 0.45907483 0.97164124 0.81043625 0.16120568 0.64922959 0.81043625 -0.1612059 
		0.22797871 0.68705368 -0.45907527 -0.22797969 0.45907402 -0.68705451 -0.82631308 
		0 -0.82631326 -1.07963 -0.31621647 -0.76341391 -1.168583 -0.58429146 -0.5842917 -1.0796299 
		-0.76341343 -0.31621635 -0.82631278 -0.82631302 8.2678007e-08 -0.44719714 -0.76341343 
		0.31621647 2.7421089e-07 -0.58429146 0.58429182 0.44719765 -0.31621647 0.76341397 
		0.82631314 0 0.82631326 1.07963 0.31621742 0.76341391 1.168583 0.58429146 0.58429158 
		1.0796298 0.76341438 0.3162162 0.82631278 0.82631302 -1.0778651e-07 0.44719696 0.76341438 
		-0.31621659 -4.5302482e-07 0.58429146 -0.58429193 -0.44719768 0.31621552 -0.76341397;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_End__circle2_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "6455C447-6445-FBF8-8DB3-729610BE667F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0852229748561926 -2.0852218685149708 5.5409730654720603e-07
		2.9489498293121961 7.8230143429891541e-07 6.6776501581995693e-07
		2.0852218685149326 2.085222974856265 3.9026503530366031e-07
		-7.8230140712780968e-07 2.9489498293122693 -1.1584690997350496e-07
		-2.0852229748561935 2.0852218685149673 -5.5409730654720614e-07
		-2.948949829312197 -7.8230143429891541e-07 -6.6776501581995714e-07
		-2.0852218685149326 -2.0852229748562632 -3.9026503530366036e-07
		7.8230140676727995e-07 -2.9489498293122693 1.1584690997350488e-07
		2.0852229748561926 -2.0852218685149708 5.5409730654720603e-07
		2.9489498293121961 7.8230143429891541e-07 6.6776501581995693e-07
		2.0852218685149326 2.085222974856265 3.9026503530366031e-07
		;
createNode nurbsCurve -n "Position__name_FK_End__outline3_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "8851528B-024B-3F88-F593-60B9D941AC39";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.7231086246738414e-07 0.64954015580281643 -0.64953985724311913
		-2.4368435802557542e-07 0.91858828652867419 2.1111360351369751e-07
		-1.7231086246738414e-07 0.64953985724309593 0.64954015580283986
		0 -2.1111360314572271e-07 0.91858828652870639
		1.7231086246738414e-07 -0.64954015580281677 0.64953985724311891
		2.4368435980193226e-07 -0.91858828652867419 -2.1111360313210899e-07
		1.7231086246738414e-07 -0.64953985724309593 -0.64954015580283919
		0 2.1111360291251294e-07 -0.91858828652870639
		-1.7231086246738414e-07 0.64954015580281643 -0.64953985724311913
		-2.4368435802557542e-07 0.91858828652867419 2.1111360351369751e-07
		-1.7231086246738414e-07 0.64953985724309593 0.64954015580283986
		;
createNode mesh -n "Position__name_FK_End__origin3_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "BD9D0ECB-2A4C-5BFD-AEB1-24ABE32C61FC";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 32 ".uvst[0].uvsp[0:31]" -type "float2" 0.40245482 0.0096073449
		 0.59754521 0.0096073449 0.77778512 0.084265202 0.91573477 0.22221488 0.99039268 0.40245485
		 0.99039268 0.59754521 0.91573477 0.77778512 0.77778506 0.91573489 0.59754515 0.99039268
		 0.40245482 0.99039268 0.22221482 0.91573477 0.084265113 0.77778494 0.0096073449 0.59754515
		 0.0096073747 0.40245476 0.084265292 0.22221476 0.222215 0.084265113 0.5 0 0.69134176
		 0.038060248 0.85355341 0.14644662 0.96193975 0.3086583 1 0.50000006 0.96193975 0.69134176
		 0.85355335 0.85355341 0.69134164 0.96193981 0.49999997 1 0.30865824 0.96193975 0.14644653
		 0.8535533 0.038060188 0.69134164 0 0.49999994 0.038060278 0.30865818 0.1464467 0.1464465
		 0.30865836 0.038060218;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr -s 32 ".pt[0:31]" -type "float3"  0.16120571 -0.81043625 -0.64923024 
		-0.16120571 -0.81043625 -0.97164166 -0.45907497 -0.68705368 -1.1461294 -0.68705422 
		-0.45907402 -1.1461293 -0.81043577 -0.16120529 -0.97164148 -0.81043577 0.16120625 
		-0.64922994 -0.68705422 0.45907497 -0.22797914 -0.45907485 0.68705463 0.22797959 
		-0.16120559 0.81043625 0.64923036 0.16120571 0.8104353 0.97164166 0.45907509 0.68705368 
		1.1461294 0.68705434 0.45907497 1.1461291 0.81043577 0.16120529 0.97164148 0.81043565 
		-0.16120529 0.64922976 0.68705404 -0.45907593 0.22797878 0.4590748 -0.68705368 -0.22797973 
		0 -0.82631302 -0.82631326 -0.31621635 -0.76341438 -1.0796303 -0.58429158 -0.58429146 
		-1.1685833 -0.76341373 -0.31621552 -1.0796301 -0.82631308 0 -0.82631302 -0.76341373 
		0.31621647 -0.44719729 -0.58429152 0.58429146 2.5349354e-07 -0.31621623 0.76341343 
		0.44719774 5.9604645e-08 0.82631302 0.82631332 0.31621635 0.76341343 1.0796303 0.5842917 
		0.58429146 1.1685833 0.76341379 0.31621552 1.07963 0.82631308 0 0.82631302 0.76341367 
		-0.31621742 0.44719711 0.58429146 -0.58429146 -4.323075e-07 0.3162162 -0.76341438 
		-0.44719777;
	setAttr -s 32 ".vt[0:31]"  -0.16120571 0 0.81043577 0.16120572 0 0.81043577
		 0.45907497 0 0.68705422 0.68705422 0 0.45907497 0.81043577 0 0.16120565 0.81043577 0 -0.16120577
		 0.68705422 0 -0.45907497 0.45907485 0 -0.68705428 0.16120562 0 -0.81043577 -0.16120571 0 -0.81043577
		 -0.45907506 0 -0.68705416 -0.68705434 0 -0.45907474 -0.81043577 0 -0.16120568 -0.81043565 0 0.16120583
		 -0.68705404 0 0.45907515 -0.45907477 0 0.68705434 1.2554252e-08 0 0.82631308 0.31621635 0 0.76341373
		 0.58429158 0 0.58429158 0.76341373 0 0.31621632 0.82631308 0 -5.0217007e-08 0.76341373 0 -0.31621638
		 0.58429152 0 -0.58429164 0.31621623 0 -0.76341379 -3.7662751e-08 0 -0.82631308 -0.31621638 0 -0.76341373
		 -0.5842917 0 -0.58429146 -0.76341379 0 -0.31621617 -0.82631308 0 7.5325502e-08 -0.76341367 0 0.3162165
		 -0.58429146 0 0.58429176 -0.3162162 0 0.76341379;
	setAttr -s 32 ".ed[0:31]"  31 0 0 0 16 0 16 1 0 1 17 0 17 2 0 2 18 0
		 18 3 0 3 19 0 19 4 0 4 20 0 20 5 0 5 21 0 21 6 0 6 22 0 22 7 0 7 23 0 23 8 0 8 24 0
		 24 9 0 9 25 0 25 10 0 10 26 0 26 11 0 11 27 0 27 12 0 12 28 0 28 13 0 13 29 0 29 14 0
		 14 30 0 30 15 0 15 31 0;
	setAttr -ch 32 ".fc[0]" -type "polyFaces" 
		f 32 30 31 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29
		mu 0 32 30 15 31 0 16 1 17 2 18 3 19 4 20 5 21 6 22 7 23 8 24 9 25 10 26 11 27 12 28 13
		 29 14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode nurbsCurve -n "Position__name_FK_End__circle3_Shape" -p "Position__name_FK_IK_End__trs";
	rename -uid "B8D27C5B-DB4F-BDD7-5568-AAA4FBB17DB5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 3 3 3 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-5.5317066127713588e-07 2.0852229009196481 -2.085221942451553
		-7.8230145561519748e-07 2.9489498293121943 6.7773934653560031e-07
		-5.5317066127713588e-07 2.0852219424514744 2.0852229009197227
		0 -6.7773934516021595e-07 2.9489498293122978
		5.5317066482984956e-07 -2.085222900919649 2.0852219424515495
		7.8230145383884064e-07 -2.9489498293121952 -6.7773934531058452e-07
		5.5317066482984956e-07 -2.0852219424514744 -2.0852229009197214
		0 6.7773934479968622e-07 -2.9489498293122978
		-5.5317066127713588e-07 2.0852229009196481 -2.085221942451553
		-7.8230145561519748e-07 2.9489498293121943 6.7773934653560031e-07
		-5.5317066127713588e-07 2.0852219424514744 2.0852229009197227
		;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "12F6163F-3942-7879-197E-EDA65CAC05F0";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "65AF30A9-EF43-7A94-97A3-C5B58565F7AD";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "0511167F-5343-30E9-8FE8-ECA272DD61CF";
createNode displayLayerManager -n "layerManager";
	rename -uid "EC254724-5B45-230F-B464-BA8EF97B101B";
	setAttr ".cdl" 1;
	setAttr -s 3 ".dli[1:2]"  1 2;
createNode displayLayer -n "defaultLayer";
	rename -uid "E76B2F26-A049-A9FE-6919-3D9A492B700E";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "E3F57450-934E-C7F7-E268-24BFA7B90561";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "BB8BDD5A-DF47-9BCD-1E3E-E89BD7683AD0";
	setAttr ".g" yes;
createNode ikRPsolver -n "ikRPsolver";
	rename -uid "B64CD71A-094E-8DEA-BD7E-F4ADD3BDD75B";
createNode objectSet -n "Viewer__FK_IK__NodeGroup";
	rename -uid "31900C73-2049-0BB8-1C80-EEB1D7A500F0";
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
createNode multMatrix -n "Viewer__name_FK_Upper_L__MultMatrix";
	rename -uid "90A3F07B-A748-8EE1-462E-2AA69F4915EF";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name_FK_Lower_L_MultMatrix";
	rename -uid "5B7DD279-0045-4751-2039-E297C2B57DAD";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name_FK_End_L__MultMatrix";
	rename -uid "3CCD185D-3249-37E4-3FC9-B5934AA867DE";
	setAttr -s 2 ".i";
createNode composeMatrix -n "Viewer__name_FK_Offset__ComposeMatrix";
	rename -uid "F70A578F-C545-6700-98B2-E1A32B6B5B3B";
createNode composeMatrix -n "Viewer__name_IK_Offset__ComposeMatrix";
	rename -uid "EBE8EC38-0040-58D0-B3A6-E6A8AE6C339C";
createNode multMatrix -n "Viewer__name_IK_Upper_L__MultMatrix";
	rename -uid "BED1605A-AF45-1E16-EECC-45AEF7EFB3BB";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name_IK_Lower_L_MultMatrix";
	rename -uid "7260A13F-004F-5728-732B-4CAB4A566431";
	setAttr -s 2 ".i";
createNode multMatrix -n "Viewer__name_IK_End_L__MultMatrix";
	rename -uid "0B095533-184F-C3D7-0E65-808A1FBA54B5";
	setAttr -s 2 ".i";
createNode parentMatrix -n "PRN_name_FK_IK_Upper_L__ParentMatrix";
	rename -uid "9BDDB48A-8944-4086-403E-2FB2371540B8";
	setAttr -s 2 ".tgt";
	setAttr ".tgt[1].ofm" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999989 0 0
		 0 0 0.99999999999999978 0 0 0 0 1;
createNode parentMatrix -n "PRN_name_FK_IK_Lower_L__ParentMatrix";
	rename -uid "B49B5485-C440-3A5C-1304-F982908339B2";
	setAttr -s 2 ".tgt";
createNode multMatrix -n "DRV_name_IK_Lower_L__MultMatrix";
	rename -uid "027FD6B2-E845-1B92-9307-12B3275E5F8D";
	setAttr -s 2 ".i";
createNode multMatrix -n "DRV_name_FK_Lower_L__MultMatrix";
	rename -uid "A98B46E1-7342-A3CE-776E-69BCE7350804";
	setAttr -s 2 ".i";
createNode setRange -n "CTR__name_Properties__SetRange";
	rename -uid "DD03E95B-9F42-51D4-F552-BD8486FCC884";
	setAttr ".n" -type "float3" 1 0 0 ;
	setAttr ".m" -type "float3" 0 1 0 ;
	setAttr ".om" -type "float3" 10 10 0 ;
createNode parentMatrix -n "PRN_name_FK_IK_End_L__ParentMatrix";
	rename -uid "F1DDC055-CB49-2E0C-98A3-16A59941B27A";
	setAttr -s 2 ".tgt";
createNode multMatrix -n "DRV_name_FK_End_L_MultMatrix";
	rename -uid "C76DFF39-5240-A034-73F1-3A8EC2BC512C";
	setAttr -s 2 ".i";
createNode multMatrix -n "DRV_name_IK_End_L_MultMatrix";
	rename -uid "A8825917-2649-8F95-F761-2AB7A68550FF";
	setAttr -s 2 ".i";
createNode hyperLayout -n "hyperLayout2";
	rename -uid "1E5F1D7D-1747-25BE-9218-3DAD777EB4F7";
	setAttr ".ihi" 0;
createNode objectSet -n "System__name_FK_IK_NodeGroup";
	rename -uid "E9CA2955-274C-9AEF-23A9-099022C77D9E";
	setAttr ".ihi" 0;
	setAttr -s 25 ".dsm";
	setAttr -s 10 ".dnsm";
createNode multMatrix -n "Offset_CTR_name_FK_Lower_L__MultMatrix";
	rename -uid "CEE7A41C-5847-23FF-DCAE-54A69718BB87";
	setAttr -s 2 ".i";
createNode multMatrix -n "Offset_CTR_name_FK_End_L__MultMatrix";
	rename -uid "3D30D896-A342-859D-8F6E-9282F3E0F493";
	setAttr -s 3 ".i";
createNode hyperLayout -n "hyperLayout3";
	rename -uid "996F855E-1549-DC46-6ABF-44A47639D4AD";
	setAttr ".ihi" 0;
	setAttr -s 3 ".hyp";
createNode objectSet -n "Component__name_FK_IK__All_Nodes";
	rename -uid "5673A7A5-CB4F-CFA3-3AD6-9680319CA01E";
	setAttr ".ihi" 0;
	setAttr -s 59 ".dsm";
	setAttr -s 18 ".dnsm";
createNode multMatrix -n "multMatrix1";
	rename -uid "76F9AF1B-3B41-3822-2639-21B5514BF23B";
createNode skinCluster -n "skinCluster1";
	rename -uid "72A5F19F-ED4C-2ABC-3093-6FA2F7057690";
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
createNode dagPose -n "bindPose1";
	rename -uid "778D9A76-5946-E155-7034-38A75EBF6918";
	setAttr -s 5 ".wm";
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 7.7715611723760958e-16 -1 0 0 1 7.7715611723760958e-16 0 0
		 0 0 1 0 3.1427308044840174e-07 8 11 1;
	setAttr -s 5 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 -1.5707963267948959 0 3.1427308044840174e-07
		 8 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr -s 4 ".g[1:4]" yes yes yes no;
	setAttr ".bp" yes;
createNode multMatrix -n "multMatrix2";
	rename -uid "7E6A8E10-D54F-4378-241C-DCB5075D5B0A";
	setAttr -s 2 ".i";
createNode shadingEngine -n "lambert1SG";
	rename -uid "0D3C6BDA-E642-58D2-3ACD-06AE8E55B32B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "A6F70DD9-734F-1D96-4444-739F7C13DAF3";
createNode standardSurface -n "M_Pivot";
	rename -uid "D2BB24B0-E741-F833-DA44-E5B0DBC03CE9";
	setAttr ".sr" 1;
	setAttr ".t" 1;
	setAttr ".e" 0.20000000298023224;
	setAttr ".ec" -type "float3" 1 0.9684 0 ;
createNode shadingEngine -n "standardSurface2SG";
	rename -uid "F71F7BAE-AB48-8BC7-25DD-F7AE0858BE9C";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "B1164D80-3743-502C-EB78-BE8E41DC77E1";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "E57215E8-CD49-A8CC-E047-EDAC6B6FF7B1";
	setAttr -s 2 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -3027.5639822595117 -888.09520280550555 ;
	setAttr ".tgi[0].vh" -type "double2" -3.3882782536329614 -69.04761630391323 ;
	setAttr -s 13 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -2094.871826171875;
	setAttr ".tgi[0].ni[0].y" -273.00289916992188;
	setAttr ".tgi[0].ni[0].nvs" 18306;
	setAttr ".tgi[0].ni[1].x" -2260;
	setAttr ".tgi[0].ni[1].y" -708.5714111328125;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -1608.5714111328125;
	setAttr ".tgi[0].ni[2].y" -92.857139587402344;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -1756.0606689453125;
	setAttr ".tgi[0].ni[3].y" -192.76112365722656;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -2110.090087890625;
	setAttr ".tgi[0].ni[4].y" -433.83090209960938;
	setAttr ".tgi[0].ni[4].nvs" 18305;
	setAttr ".tgi[0].ni[5].x" -2509.12890625;
	setAttr ".tgi[0].ni[5].y" -970.9652099609375;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -2495.294189453125;
	setAttr ".tgi[0].ni[6].y" -651.037109375;
	setAttr ".tgi[0].ni[6].nvs" 18305;
	setAttr ".tgi[0].ni[7].x" -1952.857177734375;
	setAttr ".tgi[0].ni[7].y" -708.5714111328125;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -1728.39111328125;
	setAttr ".tgi[0].ni[8].y" -436.59786987304688;
	setAttr ".tgi[0].ni[8].nvs" 18306;
	setAttr ".tgi[0].ni[9].x" -2522.963623046875;
	setAttr ".tgi[0].ni[9].y" -252.25071716308594;
	setAttr ".tgi[0].ni[9].nvs" 18305;
	setAttr ".tgi[0].ni[10].x" -994.28570556640625;
	setAttr ".tgi[0].ni[10].y" -445.71429443359375;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" -1297.142822265625;
	setAttr ".tgi[0].ni[11].y" -185.71427917480469;
	setAttr ".tgi[0].ni[11].nvs" 18306;
	setAttr ".tgi[0].ni[12].x" -2169.579833984375;
	setAttr ".tgi[0].ni[12].y" -944.67913818359375;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -4157.4544352818657 2735.7141770067724 ;
	setAttr ".tgi[1].vh" -type "double2" -599.68823282912649 4591.6664842102346 ;
	setAttr -s 39 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -1211.4285888671875;
	setAttr ".tgi[1].ni[0].y" 4245.71435546875;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" -2538.571533203125;
	setAttr ".tgi[1].ni[1].y" 3048.571533203125;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" -1211.4285888671875;
	setAttr ".tgi[1].ni[2].y" 4372.85693359375;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" -2538.571533203125;
	setAttr ".tgi[1].ni[3].y" 3175.71435546875;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" -1472.6533203125;
	setAttr ".tgi[1].ni[4].y" 3765.4150390625;
	setAttr ".tgi[1].ni[4].nvs" 18306;
	setAttr ".tgi[1].ni[5].x" -2538.571533203125;
	setAttr ".tgi[1].ni[5].y" 3557.142822265625;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" -2551.428466796875;
	setAttr ".tgi[1].ni[6].y" 4320;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" -2538.571533203125;
	setAttr ".tgi[1].ni[7].y" 3430;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[1].ni[8].x" -1211.4285888671875;
	setAttr ".tgi[1].ni[8].y" 4500;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" -556.40533447265625;
	setAttr ".tgi[1].ni[9].y" 4114.40771484375;
	setAttr ".tgi[1].ni[9].nvs" 18305;
	setAttr ".tgi[1].ni[10].x" -2542.857177734375;
	setAttr ".tgi[1].ni[10].y" 3938.571533203125;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" -2542.857177734375;
	setAttr ".tgi[1].ni[11].y" 3811.428466796875;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" -1485.2100830078125;
	setAttr ".tgi[1].ni[12].y" 3933.40966796875;
	setAttr ".tgi[1].ni[12].nvs" 18306;
	setAttr ".tgi[1].ni[13].x" -1840.6385498046875;
	setAttr ".tgi[1].ni[13].y" 4125.5439453125;
	setAttr ".tgi[1].ni[13].nvs" 18306;
	setAttr ".tgi[1].ni[14].x" -1462.3612060546875;
	setAttr ".tgi[1].ni[14].y" 3519.90576171875;
	setAttr ".tgi[1].ni[14].nvs" 18306;
	setAttr ".tgi[1].ni[15].x" -3025.671875;
	setAttr ".tgi[1].ni[15].y" 3873.154052734375;
	setAttr ".tgi[1].ni[15].nvs" 18306;
	setAttr ".tgi[1].ni[16].x" -537.65399169921875;
	setAttr ".tgi[1].ni[16].y" 3925.95849609375;
	setAttr ".tgi[1].ni[16].nvs" 18305;
	setAttr ".tgi[1].ni[17].x" -1497.778076171875;
	setAttr ".tgi[1].ni[17].y" 4145.38671875;
	setAttr ".tgi[1].ni[17].nvs" 18306;
	setAttr ".tgi[1].ni[18].x" -735.02496337890625;
	setAttr ".tgi[1].ni[18].y" 4189.26513671875;
	setAttr ".tgi[1].ni[18].nvs" 18305;
	setAttr ".tgi[1].ni[19].x" -2538.571533203125;
	setAttr ".tgi[1].ni[19].y" 3684.28564453125;
	setAttr ".tgi[1].ni[19].nvs" 18304;
	setAttr ".tgi[1].ni[20].x" -2551.428466796875;
	setAttr ".tgi[1].ni[20].y" 4192.85693359375;
	setAttr ".tgi[1].ni[20].nvs" 18304;
	setAttr ".tgi[1].ni[21].x" -2538.571533203125;
	setAttr ".tgi[1].ni[21].y" 3302.857177734375;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" -2551.428466796875;
	setAttr ".tgi[1].ni[22].y" 4447.14306640625;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" -548.87750244140625;
	setAttr ".tgi[1].ni[23].y" 3762.252197265625;
	setAttr ".tgi[1].ni[23].nvs" 18305;
	setAttr ".tgi[1].ni[24].x" -748.1016845703125;
	setAttr ".tgi[1].ni[24].y" 4145.36279296875;
	setAttr ".tgi[1].ni[24].nvs" 18305;
	setAttr ".tgi[1].ni[25].x" -2542.857177734375;
	setAttr ".tgi[1].ni[25].y" 4065.71435546875;
	setAttr ".tgi[1].ni[25].nvs" 18304;
	setAttr ".tgi[1].ni[26].x" -3691.428466796875;
	setAttr ".tgi[1].ni[26].y" 2928.571533203125;
	setAttr ".tgi[1].ni[26].nvs" 18304;
	setAttr ".tgi[1].ni[27].x" -3755.71435546875;
	setAttr ".tgi[1].ni[27].y" 4200;
	setAttr ".tgi[1].ni[27].nvs" 18304;
	setAttr ".tgi[1].ni[28].x" -3747.142822265625;
	setAttr ".tgi[1].ni[28].y" 3818.571533203125;
	setAttr ".tgi[1].ni[28].nvs" 18304;
	setAttr ".tgi[1].ni[29].x" -3742.857177734375;
	setAttr ".tgi[1].ni[29].y" 3310;
	setAttr ".tgi[1].ni[29].nvs" 18304;
	setAttr ".tgi[1].ni[30].x" -3742.857177734375;
	setAttr ".tgi[1].ni[30].y" 3055.71435546875;
	setAttr ".tgi[1].ni[30].nvs" 18304;
	setAttr ".tgi[1].ni[31].x" -3742.857177734375;
	setAttr ".tgi[1].ni[31].y" 3182.857177734375;
	setAttr ".tgi[1].ni[31].nvs" 18304;
	setAttr ".tgi[1].ni[32].x" -3742.857177734375;
	setAttr ".tgi[1].ni[32].y" 3437.142822265625;
	setAttr ".tgi[1].ni[32].nvs" 18304;
	setAttr ".tgi[1].ni[33].x" -3755.71435546875;
	setAttr ".tgi[1].ni[33].y" 4327.14306640625;
	setAttr ".tgi[1].ni[33].nvs" 18304;
	setAttr ".tgi[1].ni[34].x" -3747.142822265625;
	setAttr ".tgi[1].ni[34].y" 3945.71435546875;
	setAttr ".tgi[1].ni[34].nvs" 18304;
	setAttr ".tgi[1].ni[35].x" -3742.857177734375;
	setAttr ".tgi[1].ni[35].y" 3564.28564453125;
	setAttr ".tgi[1].ni[35].nvs" 18304;
	setAttr ".tgi[1].ni[36].x" -3755.71435546875;
	setAttr ".tgi[1].ni[36].y" 4454.28564453125;
	setAttr ".tgi[1].ni[36].nvs" 18304;
	setAttr ".tgi[1].ni[37].x" -3747.142822265625;
	setAttr ".tgi[1].ni[37].y" 4072.857177734375;
	setAttr ".tgi[1].ni[37].nvs" 18304;
	setAttr ".tgi[1].ni[38].x" -3742.857177734375;
	setAttr ".tgi[1].ni[38].y" 3691.428466796875;
	setAttr ".tgi[1].ni[38].nvs" 18304;
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
	setAttr -s 4 ".st";
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
	setAttr -s 15 ".u";
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
connectAttr "Viewer__name_FK_Upper_L__MultMatrix.o" "Viewer__name_FK_Upper_L__crv.opm"
		;
connectAttr "Viewer__name_FK_IK__Asset.Line_Width" "Viewer__name_FK_Upper_L__crvShape.ls"
		;
connectAttr "Viewer__name_FK_Lower_L_MultMatrix.o" "Viewer__name_FK_Lower_L__crv.opm"
		;
connectAttr "Viewer__name_FK_IK__Asset.Line_Width" "Viewer__name_FK_Lower_L__crvShape.ls"
		;
connectAttr "Viewer__name_FK_End_L__MultMatrix.o" "Viewer__name_FK_End_L__crv.opm"
		;
connectAttr "Viewer__name_FK_IK__Asset.Line_Width" "Viewer__name_FK_End_L__crvShape.ls"
		;
connectAttr "Viewer__name_IK_Upper_L__MultMatrix.o" "Viewer__name_IK_Upper_L__crv.opm"
		;
connectAttr "Viewer__name_FK_IK__Asset.Line_Width" "Viewer__name_IK_Upper_L__crvShape.ls"
		;
connectAttr "Viewer__name_IK_Lower_L_MultMatrix.o" "Viewer__name_IK_Lower_L__crv.opm"
		;
connectAttr "Viewer__name_FK_IK__Asset.Line_Width" "Viewer__name_IK_Lower_L__crvShape.ls"
		;
connectAttr "Viewer__name_IK_End_L__MultMatrix.o" "Viewer__name_IK_End_L__crv.opm"
		;
connectAttr "Viewer__name_FK_IK__Asset.Line_Width" "Viewer__name_IK_End_L__crvShape.ls"
		;
connectAttr "CTR__name_Properties__SetRange.ox" "Controls__name_FK__grp.v";
connectAttr "Offset_CTR_name_FK_Lower_L__MultMatrix.o" "Offset_CTR_name_FK_Lower_L_trs.opm"
		;
connectAttr "Offset_CTR_name_FK_End_L__MultMatrix.o" "Offset_CTR_name_FK_End_L_trs.opm"
		;
connectAttr "CTR__name_Properties__SetRange.oy" "Controls__name_IK__grp.v";
connectAttr "skinCluster1.og[0]" "CTR_name_IK_Pole_L_crvShape.cr";
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.ctx" "DRV_name_FK_Upper_L_jnt.tx"
		;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.cty" "DRV_name_FK_Upper_L_jnt.ty"
		;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.ctz" "DRV_name_FK_Upper_L_jnt.tz"
		;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.crx" "DRV_name_FK_Upper_L_jnt.rx"
		;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.cry" "DRV_name_FK_Upper_L_jnt.ry"
		;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.crz" "DRV_name_FK_Upper_L_jnt.rz"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.s" "DRV_name_FK_Lower_L_jnt.is";
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.ctx" "DRV_name_FK_Lower_L_jnt.tx"
		;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.cty" "DRV_name_FK_Lower_L_jnt.ty"
		;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.ctz" "DRV_name_FK_Lower_L_jnt.tz"
		;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.crx" "DRV_name_FK_Lower_L_jnt.rx"
		;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.cry" "DRV_name_FK_Lower_L_jnt.ry"
		;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.crz" "DRV_name_FK_Lower_L_jnt.rz"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.s" "DRV_name_FK_End_L_jnt.is";
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.ctx" "DRV_name_FK_End_L_jnt.tx"
		;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.cty" "DRV_name_FK_End_L_jnt.ty"
		;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.ctz" "DRV_name_FK_End_L_jnt.tz"
		;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.crx" "DRV_name_FK_End_L_jnt.rx"
		;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.cry" "DRV_name_FK_End_L_jnt.ry"
		;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.crz" "DRV_name_FK_End_L_jnt.rz"
		;
connectAttr "DRV_name_FK_End_L_jnt.ro" "DRV_name_FK_End_L_jnt_parentConstraint1.cro"
		;
connectAttr "DRV_name_FK_End_L_jnt.pim" "DRV_name_FK_End_L_jnt_parentConstraint1.cpim"
		;
connectAttr "DRV_name_FK_End_L_jnt.rp" "DRV_name_FK_End_L_jnt_parentConstraint1.crp"
		;
connectAttr "DRV_name_FK_End_L_jnt.rpt" "DRV_name_FK_End_L_jnt_parentConstraint1.crt"
		;
connectAttr "DRV_name_FK_End_L_jnt.jo" "DRV_name_FK_End_L_jnt_parentConstraint1.cjo"
		;
connectAttr "CTR_name_FK_End_L_jnt.t" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "CTR_name_FK_End_L_jnt.rp" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "CTR_name_FK_End_L_jnt.rpt" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "CTR_name_FK_End_L_jnt.r" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "CTR_name_FK_End_L_jnt.ro" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "CTR_name_FK_End_L_jnt.s" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "CTR_name_FK_End_L_jnt.pm" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "CTR_name_FK_End_L_jnt.jo" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tjo"
		;
connectAttr "CTR_name_FK_End_L_jnt.ssc" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tsc"
		;
connectAttr "CTR_name_FK_End_L_jnt.is" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tis"
		;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.w0" "DRV_name_FK_End_L_jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.ro" "DRV_name_FK_Lower_L_jnt_parentConstraint1.cro"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.pim" "DRV_name_FK_Lower_L_jnt_parentConstraint1.cpim"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.rp" "DRV_name_FK_Lower_L_jnt_parentConstraint1.crp"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.rpt" "DRV_name_FK_Lower_L_jnt_parentConstraint1.crt"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.jo" "DRV_name_FK_Lower_L_jnt_parentConstraint1.cjo"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.t" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.rp" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.rpt" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.r" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.ro" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.s" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.pm" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.jo" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tjo"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.ssc" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tsc"
		;
connectAttr "CTR_name_FK_Lower_L_jnt.is" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tis"
		;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.w0" "DRV_name_FK_Lower_L_jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.ro" "DRV_name_FK_Upper_L_jnt_parentConstraint1.cro"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.pim" "DRV_name_FK_Upper_L_jnt_parentConstraint1.cpim"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.rp" "DRV_name_FK_Upper_L_jnt_parentConstraint1.crp"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.rpt" "DRV_name_FK_Upper_L_jnt_parentConstraint1.crt"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.jo" "DRV_name_FK_Upper_L_jnt_parentConstraint1.cjo"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.t" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.rp" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.rpt" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.r" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.ro" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.s" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.pm" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.jo" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tjo"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.ssc" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tsc"
		;
connectAttr "CTR_name_FK_Upper_L_jnt.is" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tis"
		;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.w0" "DRV_name_FK_Upper_L_jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "DRV_name_IK_Upper_L_jnt.s" "DRV_name_IK_Lower_L_jnt.is";
connectAttr "DRV_name_IK_Lower_L_jnt.s" "DRV_name_IK_End_L_jnt.is";
connectAttr "DRV_name_IK_End_L_jnt.tx" "name_effector.tx";
connectAttr "DRV_name_IK_End_L_jnt.ty" "name_effector.ty";
connectAttr "DRV_name_IK_End_L_jnt.tz" "name_effector.tz";
connectAttr "DRV_name_IK_End_L_jnt.opm" "name_effector.opm";
connectAttr "PRN_name_FK_IK_Upper_L__ParentMatrix.omat" "PRN_name_FK_IK_Upper_L_jnt.opm"
		;
connectAttr "PRN_name_FK_IK_Upper_L_jnt.s" "PRN_name_FK_IK_Lower_L_jnt.is";
connectAttr "PRN_name_FK_IK_Lower_L__ParentMatrix.omat" "PRN_name_FK_IK_Lower_L_jnt.opm"
		;
connectAttr "PRN_name_FK_IK_Lower_L_jnt.s" "PRN_name_FK_IK_End_L_jnt.is";
connectAttr "PRN_name_FK_IK_End_L__ParentMatrix.omat" "PRN_name_FK_IK_End_L_jnt.opm"
		;
connectAttr "CTR_name_IK_L_jnt.wm" "DRV_name_IK_Handle_L_jnt.opm";
connectAttr "DRV_name_IK_Upper_L_jnt.msg" "name_ikHandle.hsj";
connectAttr "name_effector.hp" "name_ikHandle.hee";
connectAttr "ikRPsolver.msg" "name_ikHandle.hsv";
connectAttr "name_ikHandle_poleVectorConstraint1.ctx" "name_ikHandle.pvx";
connectAttr "name_ikHandle_poleVectorConstraint1.cty" "name_ikHandle.pvy";
connectAttr "name_ikHandle_poleVectorConstraint1.ctz" "name_ikHandle.pvz";
connectAttr "name_ikHandle.pim" "name_ikHandle_poleVectorConstraint1.cpim";
connectAttr "DRV_name_IK_Upper_L_jnt.pm" "name_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "DRV_name_IK_Upper_L_jnt.t" "name_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.t" "name_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.rp" "name_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.rpt" "name_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.pm" "name_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "name_ikHandle_poleVectorConstraint1.w0" "name_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "multMatrix2.o" "DRV_name_IK_Pole_L_jnt.opm";
connectAttr "DRV_name_IK_Pole_L_jnt_aimConstraint1.crx" "DRV_name_IK_Pole_L_jnt.rx"
		;
connectAttr "DRV_name_IK_Pole_L_jnt_aimConstraint1.cry" "DRV_name_IK_Pole_L_jnt.ry"
		;
connectAttr "DRV_name_IK_Pole_L_jnt_aimConstraint1.crz" "DRV_name_IK_Pole_L_jnt.rz"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.pim" "DRV_name_IK_Pole_L_jnt_aimConstraint1.cpim"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.t" "DRV_name_IK_Pole_L_jnt_aimConstraint1.ct"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.rp" "DRV_name_IK_Pole_L_jnt_aimConstraint1.crp"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.rpt" "DRV_name_IK_Pole_L_jnt_aimConstraint1.crt"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.ro" "DRV_name_IK_Pole_L_jnt_aimConstraint1.cro"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.jo" "DRV_name_IK_Pole_L_jnt_aimConstraint1.cjo"
		;
connectAttr "DRV_name_IK_Pole_L_jnt.is" "DRV_name_IK_Pole_L_jnt_aimConstraint1.is"
		;
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.t" "DRV_name_IK_Pole_L_jnt_aimConstraint1.tg[0].tt"
		;
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.rp" "DRV_name_IK_Pole_L_jnt_aimConstraint1.tg[0].trp"
		;
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.rpt" "DRV_name_IK_Pole_L_jnt_aimConstraint1.tg[0].trt"
		;
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.pm" "DRV_name_IK_Pole_L_jnt_aimConstraint1.tg[0].tpm"
		;
connectAttr "DRV_name_IK_Pole_L_jnt_aimConstraint1.w0" "DRV_name_IK_Pole_L_jnt_aimConstraint1.tg[0].tw"
		;
connectAttr "DRV_name_IK_Lower_L_jnt.wm" "DRV_name_IK_Shape_Line_Start_L_jnt.opm"
		;
connectAttr "hyperLayout3.msg" "Component_name_FK_IK__Asset.hl";
connectAttr "hyperLayout1.msg" "Viewer__name_FK_IK__Asset.hl";
connectAttr "hyperLayout2.msg" "System__name_FK_IK__Asset.hl";
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Outline" "Position__name_FK_Upper__outline1_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Circle" "Position__name_FK_Upper__circle1_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Axes" "Position__name_FK_Upper__Axis_Y_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Axes" "Position__name_FK_Upper__Axis_Z_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Axes" "Position__name_FK_Upper__Axis_X_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Outline" "Position__name_FK_Upper__outline2_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Circle" "Position__name_FK_Upper__circle2_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Outline" "Position__name_FK_Upper__outline3_Shape.ls"
		;
connectAttr "Position__name_FK_IK_Upper__trs.Line_Width_Circle" "Position__name_FK_Upper__circle3_Shape.ls"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "standardSurface2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "standardSurface2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "Viewer_Curves__name_FK_IK__grp.iog" "Viewer__FK_IK__NodeGroup.dsm" 
		-na;
connectAttr "Viewer__name_FK_Upper_L__crv.iog" "Viewer__FK_IK__NodeGroup.dsm" -na
		;
connectAttr "Viewer__name_FK_Lower_L__crv.iog" "Viewer__FK_IK__NodeGroup.dsm" -na
		;
connectAttr "Viewer__name_FK_End_L__crv.iog" "Viewer__FK_IK__NodeGroup.dsm" -na;
connectAttr "Viewer__name_IK_Upper_L__crv.iog" "Viewer__FK_IK__NodeGroup.dsm" -na
		;
connectAttr "Viewer__name_IK_Lower_L__crv.iog" "Viewer__FK_IK__NodeGroup.dsm" -na
		;
connectAttr "Viewer__name_IK_End_L__crv.iog" "Viewer__FK_IK__NodeGroup.dsm" -na;
connectAttr "Viewer__name_FK_Upper_L__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name_FK_Lower_L__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name_IK_Upper_L__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name_IK_Lower_L__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name_IK_End_L__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name_FK_End_L__crvShape.iog" "Viewer__FK_IK__NodeGroup.dsm"
		 -na;
connectAttr "Viewer__name_FK_Upper_L__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_IK_Offset__ComposeMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_FK_Offset__ComposeMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_FK_End_L__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_IK_Upper_L__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_FK_Lower_L_MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_IK_Lower_L_MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__name_IK_End_L__MultMatrix.msg" "Viewer__FK_IK__NodeGroup.dnsm"
		 -na;
connectAttr "Viewer__FK_IK__NodeGroup.msg" "hyperLayout1.hyp[0].dn";
connectAttr "DRV_name_FK_Upper_L_jnt.wm" "Viewer__name_FK_Upper_L__MultMatrix.i[0]"
		;
connectAttr "Viewer__name_FK_Offset__ComposeMatrix.omat" "Viewer__name_FK_Upper_L__MultMatrix.i[1]"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.wm" "Viewer__name_FK_Lower_L_MultMatrix.i[0]"
		;
connectAttr "Viewer__name_FK_Offset__ComposeMatrix.omat" "Viewer__name_FK_Lower_L_MultMatrix.i[1]"
		;
connectAttr "DRV_name_FK_End_L_jnt.wm" "Viewer__name_FK_End_L__MultMatrix.i[0]";
connectAttr "Viewer__name_FK_Offset__ComposeMatrix.omat" "Viewer__name_FK_End_L__MultMatrix.i[1]"
		;
connectAttr "Viewer__name_FK_IK__Asset.FK_Offset" "Viewer__name_FK_Offset__ComposeMatrix.it"
		;
connectAttr "Viewer__name_FK_IK__Asset.IK_Offset" "Viewer__name_IK_Offset__ComposeMatrix.it"
		;
connectAttr "DRV_name_IK_Upper_L_jnt.wm" "Viewer__name_IK_Upper_L__MultMatrix.i[0]"
		;
connectAttr "Viewer__name_IK_Offset__ComposeMatrix.omat" "Viewer__name_IK_Upper_L__MultMatrix.i[1]"
		;
connectAttr "DRV_name_IK_Lower_L_jnt.wm" "Viewer__name_IK_Lower_L_MultMatrix.i[0]"
		;
connectAttr "Viewer__name_IK_Offset__ComposeMatrix.omat" "Viewer__name_IK_Lower_L_MultMatrix.i[1]"
		;
connectAttr "DRV_name_IK_End_L_jnt.wm" "Viewer__name_IK_End_L__MultMatrix.i[0]";
connectAttr "Viewer__name_IK_Offset__ComposeMatrix.omat" "Viewer__name_IK_End_L__MultMatrix.i[1]"
		;
connectAttr "DRV_name_FK_Upper_L_jnt.wm" "PRN_name_FK_IK_Upper_L__ParentMatrix.tgt[0].tmat"
		;
connectAttr "CTR__name_Properties__SetRange.ox" "PRN_name_FK_IK_Upper_L__ParentMatrix.tgt[0].wgt"
		;
connectAttr "DRV_name_IK_Upper_L_jnt.wm" "PRN_name_FK_IK_Upper_L__ParentMatrix.tgt[1].tmat"
		;
connectAttr "CTR__name_Properties__SetRange.oy" "PRN_name_FK_IK_Upper_L__ParentMatrix.tgt[1].wgt"
		;
connectAttr "DRV_name_FK_Lower_L__MultMatrix.o" "PRN_name_FK_IK_Lower_L__ParentMatrix.tgt[0].tmat"
		;
connectAttr "CTR__name_Properties__SetRange.ox" "PRN_name_FK_IK_Lower_L__ParentMatrix.tgt[0].wgt"
		;
connectAttr "DRV_name_IK_Lower_L__MultMatrix.o" "PRN_name_FK_IK_Lower_L__ParentMatrix.tgt[1].tmat"
		;
connectAttr "CTR__name_Properties__SetRange.oy" "PRN_name_FK_IK_Lower_L__ParentMatrix.tgt[1].wgt"
		;
connectAttr "DRV_name_IK_Lower_L_jnt.wm" "DRV_name_IK_Lower_L__MultMatrix.i[0]";
connectAttr "DRV_name_IK_Lower_L_jnt.pim" "DRV_name_IK_Lower_L__MultMatrix.i[1]"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.wm" "DRV_name_FK_Lower_L__MultMatrix.i[0]";
connectAttr "DRV_name_FK_Lower_L_jnt.pim" "DRV_name_FK_Lower_L__MultMatrix.i[1]"
		;
connectAttr "CTR__name_Properties__crv.FK_IK_Switch" "CTR__name_Properties__SetRange.vx"
		;
connectAttr "CTR__name_Properties__crv.FK_IK_Switch" "CTR__name_Properties__SetRange.vy"
		;
connectAttr "DRV_name_FK_End_L_MultMatrix.o" "PRN_name_FK_IK_End_L__ParentMatrix.tgt[0].tmat"
		;
connectAttr "CTR__name_Properties__SetRange.ox" "PRN_name_FK_IK_End_L__ParentMatrix.tgt[0].wgt"
		;
connectAttr "DRV_name_IK_End_L_MultMatrix.o" "PRN_name_FK_IK_End_L__ParentMatrix.tgt[1].tmat"
		;
connectAttr "CTR__name_Properties__SetRange.oy" "PRN_name_FK_IK_End_L__ParentMatrix.tgt[1].wgt"
		;
connectAttr "DRV_name_FK_End_L_jnt.wm" "DRV_name_FK_End_L_MultMatrix.i[0]";
connectAttr "DRV_name_FK_End_L_jnt.pim" "DRV_name_FK_End_L_MultMatrix.i[1]";
connectAttr "DRV_name_IK_End_L_jnt.wm" "DRV_name_IK_End_L_MultMatrix.i[0]";
connectAttr "DRV_name_IK_End_L_jnt.pim" "DRV_name_IK_End_L_MultMatrix.i[1]";
connectAttr "System__name_FK_IK_NodeGroup.msg" "hyperLayout2.hyp[0].dn";
connectAttr "DRV_name_FK_Upper_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "DRV_name_FK_Lower_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "DRV_name_FK_End_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "DRV_name_IK_Upper_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "DRV_name_IK_Lower_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "DRV_name_IK_End_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "name_effector.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "Offset_DRV_name_IK_Pole_L_trs.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV_name_IK_Pole_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "Offset_DRV_name_IK_Handle_L_trs.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "DRV_name_IK_Handle_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "Offset_name_ikHandle_trs.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "name_ikHandle.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "name_ikHandle_poleVectorConstraint1.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "PRN_name_FK_IK_Upper_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" 
		-na;
connectAttr "PRN_name_FK_IK_Lower_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" 
		-na;
connectAttr "PRN_name_FK_IK_End_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "Properties__name_FK_IK__grp.iog" "System__name_FK_IK_NodeGroup.dsm"
		 -na;
connectAttr "CTR__name_Properties__crv.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "Controls__name_FK__grp.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "CTR_name_FK_Upper_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "CTR_name_FK_Lower_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na
		;
connectAttr "CTR_name_FK_End_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "CTR_name_IK_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "CTR_name_IK_Pole_L_jnt.iog" "System__name_FK_IK_NodeGroup.dsm" -na;
connectAttr "DRV_name_FK_End_L_MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "DRV_name_FK_Lower_L__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "DRV_name_IK_End_L_MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "DRV_name_IK_Lower_L__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "PRN_name_FK_IK_End_L__ParentMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "PRN_name_FK_IK_Lower_L__ParentMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "PRN_name_FK_IK_Upper_L__ParentMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "CTR__name_Properties__SetRange.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "Offset_CTR_name_FK_Lower_L__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "Offset_CTR_name_FK_End_L__MultMatrix.msg" "System__name_FK_IK_NodeGroup.dnsm"
		 -na;
connectAttr "CTR_name_FK_Upper_L_crv.pim" "Offset_CTR_name_FK_Lower_L__MultMatrix.i[0]"
		;
connectAttr "CTR_name_FK_Upper_L_crv.wm" "Offset_CTR_name_FK_Lower_L__MultMatrix.i[1]"
		;
connectAttr "Offset_CTR_name_FK_Lower_L__MultMatrix.o" "Offset_CTR_name_FK_End_L__MultMatrix.i[1]"
		;
connectAttr "CTR_name_FK_Lower_L_crv.pim" "Offset_CTR_name_FK_End_L__MultMatrix.i[3]"
		;
connectAttr "CTR_name_FK_Lower_L_crv.wm" "Offset_CTR_name_FK_End_L__MultMatrix.i[4]"
		;
connectAttr "Viewer__name_FK_IK__Asset.msg" "hyperLayout3.hyp[0].dn";
connectAttr "System__name_FK_IK__Asset.msg" "hyperLayout3.hyp[1].dn";
connectAttr "Component__name_FK_IK__All_Nodes.msg" "hyperLayout3.hyp[2].dn";
connectAttr "Viewer__name_FK_Offset__ComposeMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_FK_End_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_FK_Lower_L_MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_IK_Upper_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_IK_Offset__ComposeMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_IK_Lower_L_MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_IK_End_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_FK_Upper_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "CTR__name_Properties__SetRange.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "PRN_name_FK_IK_End_L__ParentMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "DRV_name_IK_Lower_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Offset_CTR_name_FK_End_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Offset_CTR_name_FK_Lower_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "PRN_name_FK_IK_Lower_L__ParentMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "DRV_name_IK_End_L_MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "DRV_name_FK_Lower_L__MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "DRV_name_FK_End_L_MultMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "PRN_name_FK_IK_Upper_L__ParentMatrix.msg" "Component__name_FK_IK__All_Nodes.dnsm"
		 -na;
connectAttr "Viewer__name_FK_Upper_L__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer_Curves__name_FK_IK__grp.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_FK_End_L__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_IK_Upper_L__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_FK_Lower_L__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_FK_Lower_L__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_IK_Lower_L__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_IK_Upper_L__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_FK_End_L__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_IK_End_L__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_IK_End_L__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_IK_Lower_L__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_FK_Upper_L__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Offset_name_ikHandle_trs.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "name_ikHandle_poleVectorConstraint1.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "name_ikHandle.iog" "Component__name_FK_IK__All_Nodes.dsm" -na;
connectAttr "CTR_name_FK_Upper_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Controls__name_FK__grp.iog" "Component__name_FK_IK__All_Nodes.dsm" 
		-na;
connectAttr "DRV_name_IK_End_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm" -na
		;
connectAttr "DRV_name_FK_End_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm" -na
		;
connectAttr "DRV_name_FK_Upper_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_IK_Upper_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_IK_Lower_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_FK_Lower_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "name_effector.iog" "Component__name_FK_IK__All_Nodes.dsm" -na;
connectAttr "CTR__name_Properties__crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Properties__name_FK_IK__grp.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "PRN_name_FK_IK_End_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_End_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm" -na
		;
connectAttr "CTR_name_FK_Lower_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "PRN_name_FK_IK_Lower_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "PRN_name_FK_IK_Upper_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Offset_DRV_name_IK_Pole_L_trs.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_IK_Handle_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_IK_Pole_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm" 
		-na;
connectAttr "Offset_DRV_name_IK_Handle_L_trs.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_End_L_crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_End_L_crv.iog" "Component__name_FK_IK__All_Nodes.dsm" -na
		;
connectAttr "Offset_CTR_name_FK_End_L_trs.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_Lower_L_crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_Lower_L_crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Offset_CTR_name_FK_Lower_L_trs.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_Upper_L_crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_FK_Upper_L_crv.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Offset_CTR_name_FK_Upper_L_trs.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Controls__name_IK__grp.iog" "Component__name_FK_IK__All_Nodes.dsm" 
		-na;
connectAttr "CTR__name_Properties__crvShape2.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name_Properties__crvShape1.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR__name_Properties__crvShape.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_FK_Upper_L_jnt_parentConstraint1.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_FK_Lower_L_jnt_parentConstraint1.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "DRV_name_FK_End_L_jnt_parentConstraint1.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "System__name_FK_IK__grp.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "System__name_FK_IK__Asset.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Viewer__name_FK_IK__Asset.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Component_name_FK_IK__Asset.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "Component__name_FK_IK__grp.iog" "Component__name_FK_IK__All_Nodes.dsm"
		 -na;
connectAttr "CTR_name_IK_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm" -na;
connectAttr "CTR_name_IK_Pole_L_jnt.iog" "Component__name_FK_IK__All_Nodes.dsm" 
		-na;
connectAttr "CTR_name_IK_L_jnt.pim" "multMatrix1.i[0]";
connectAttr "CTR_name_IK_Pole_L_crvShapeOrig.ws" "skinCluster1.ip[0].ig";
connectAttr "CTR_name_IK_Pole_L_crvShapeOrig.l" "skinCluster1.orggeom[0]";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.wm" "skinCluster1.ma[0]";
connectAttr "DRV_name_IK_Pole_L_jnt.wm" "skinCluster1.ma[1]";
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.liw" "skinCluster1.lw[0]";
connectAttr "DRV_name_IK_Pole_L_jnt.liw" "skinCluster1.lw[1]";
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.obcc" "skinCluster1.ifcl[0]";
connectAttr "DRV_name_IK_Pole_L_jnt.obcc" "skinCluster1.ifcl[1]";
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.msg" "bindPose1.m[0]";
connectAttr "Component__name_FK_IK__grp.msg" "bindPose1.m[1]";
connectAttr "System__name_FK_IK__grp.msg" "bindPose1.m[2]";
connectAttr "Offset_DRV_name_IK_Pole_L_trs.msg" "bindPose1.m[3]";
connectAttr "DRV_name_IK_Pole_L_jnt.msg" "bindPose1.m[4]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.w" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "DRV_name_IK_Shape_Line_Start_L_jnt.bps" "bindPose1.wm[0]";
connectAttr "DRV_name_IK_Pole_L_jnt.bps" "bindPose1.wm[4]";
connectAttr "CTR_name_IK_Pole_L_jnt.wm" "multMatrix2.i[0]";
connectAttr "CTR_name_IK_Pole_L_crv.pim" "multMatrix2.i[1]";
connectAttr ":lambert1.oc" "lambert1SG.ss";
connectAttr "lambert1SG.msg" "materialInfo1.sg";
connectAttr ":lambert1.msg" "materialInfo1.m";
connectAttr "M_Pivot.oc" "standardSurface2SG.ss";
connectAttr "Position__name_FK_Upper__origin1_Shape.iog" "standardSurface2SG.dsm"
		 -na;
connectAttr "Position__name_FK_Upper__origin2_Shape.iog" "standardSurface2SG.dsm"
		 -na;
connectAttr "Position__name_FK_Upper__origin3_Shape.iog" "standardSurface2SG.dsm"
		 -na;
connectAttr "Position__name_FK_Lower__origin1_Shape.iog" "standardSurface2SG.dsm"
		 -na;
connectAttr "Position__name_FK_Lower__origin2_Shape.iog" "standardSurface2SG.dsm"
		 -na;
connectAttr "Position__name_FK_Lower__origin3_Shape.iog" "standardSurface2SG.dsm"
		 -na;
connectAttr "Position__name_FK_End__origin1_Shape.iog" "standardSurface2SG.dsm" 
		-na;
connectAttr "Position__name_FK_End__origin2_Shape.iog" "standardSurface2SG.dsm" 
		-na;
connectAttr "Position__name_FK_End__origin3_Shape.iog" "standardSurface2SG.dsm" 
		-na;
connectAttr "standardSurface2SG.msg" "materialInfo2.sg";
connectAttr "M_Pivot.msg" "materialInfo2.m";
connectAttr "DRV_name_FK_Lower_L__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "hyperLayout3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "System__name_FK_IK__grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "PRN_name_FK_IK_Upper_L_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "DRV_name_IK_Lower_L__MultMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "CTR__name_Properties__crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "DRV_name_IK_Lower_L_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "Component_name_FK_IK__Asset.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "PRN_name_FK_IK_Lower_L__ParentMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "DRV_name_FK_Lower_L_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "Controls__name_IK__grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "PRN_name_FK_IK_Lower_L_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "CTR__name_Properties__SetRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "Position__name_FK_Upper__origin1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "Position__name_FK_Lower__circle1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "Position__name_FK_Upper__origin3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "Position__name_FK_Lower__circle3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "Position__name_FK_Upper__Axis_Z_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "Position__name_FK_Lower__circle2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "Position__name_FK_Lower__outline2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "Position__name_FK_Lower__Axis_Z_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "Position__name_FK_Upper__origin2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "Position__name_FK_Upper__outline1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "Position__name_FK_Lower__origin3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "Position__name_FK_Lower__origin2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "Position__name_FK_Upper__circle3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "Position__name_FK_IK_Upper__trs.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn"
		;
connectAttr "Position__name_FK_Upper__circle2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn"
		;
connectAttr "Position__name_FK_IK_Lower__trs.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn"
		;
connectAttr "Position__name_FK_Upper__outline3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "Position__name_FK_Upper__circle1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn"
		;
connectAttr "Position__name_FK_Upper__Axis_Y_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn"
		;
connectAttr "Position__name_FK_Lower__Axis_Y_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn"
		;
connectAttr "Position__name_FK_Lower__outline1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "Position__name_FK_Lower__Axis_X_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn"
		;
connectAttr "Position__name_FK_Lower__outline3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "Position__name_FK_Upper__outline2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn"
		;
connectAttr "Position__name_FK_Upper__Axis_X_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn"
		;
connectAttr "Position__name_FK_Lower__origin1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn"
		;
connectAttr "Position__name_FK_IK_End__trs.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn"
		;
connectAttr "Position__name_FK_End__outline1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn"
		;
connectAttr "Position__name_FK_End__origin1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn"
		;
connectAttr "Position__name_FK_End__circle1_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn"
		;
connectAttr "Position__name_FK_End__Axis_Y_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[30].dn"
		;
connectAttr "Position__name_FK_End__Axis_Z_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[31].dn"
		;
connectAttr "Position__name_FK_End__Axis_X_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[32].dn"
		;
connectAttr "Position__name_FK_End__outline2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[33].dn"
		;
connectAttr "Position__name_FK_End__origin2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[34].dn"
		;
connectAttr "Position__name_FK_End__circle2_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[35].dn"
		;
connectAttr "Position__name_FK_End__outline3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[36].dn"
		;
connectAttr "Position__name_FK_End__origin3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[37].dn"
		;
connectAttr "Position__name_FK_End__circle3_Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[38].dn"
		;
connectAttr "lambert1SG.pa" ":renderPartition.st" -na;
connectAttr "standardSurface2SG.pa" ":renderPartition.st" -na;
connectAttr "M_Pivot.msg" ":defaultShaderList1.s" -na;
connectAttr "Viewer__name_FK_Upper_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name_FK_Lower_L_MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name_FK_End_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name_IK_Upper_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name_IK_Lower_L_MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Viewer__name_IK_End_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV_name_IK_Lower_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "DRV_name_FK_Lower_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CTR__name_Properties__SetRange.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "DRV_name_FK_End_L_MultMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "DRV_name_IK_End_L_MultMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "Offset_CTR_name_FK_Lower_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Offset_CTR_name_FK_End_L__MultMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "multMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
// End of Component__FK_IK.ma
