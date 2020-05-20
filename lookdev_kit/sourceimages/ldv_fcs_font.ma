//Maya ASCII 2020 scene
//Name: ldv_fcs_font.ma
//Last modified: Wed, May 20, 2020 09:56:47 PM
//Codeset: 1252
requires maya "2020";
requires "mtoa" "4.0.4.beta15";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "202002251615-329d215872";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18363)\n";
fileInfo "UUID" "08D85443-41A7-DBD8-9E74-0197C48D0306";
createNode transform -n "focusPlane_txtShape";
	rename -uid "C1F91AF7-4F05-4C4B-1E1A-898A29C24608";
createNode transform -n "curve5" -p "focusPlane_txtShape";
	rename -uid "1D874F5A-4271-6C92-5A18-C1B30F98C325";
	setAttr ".rp" -type "double3" 1.8072281901041667 0 0 ;
	setAttr ".sp" -type "double3" 1.8072281901041667 0 0 ;
createNode nurbsCurve -n "curveShape5" -p "curve5";
	rename -uid "0443917C-4796-BD6D-5D59-C88791407BB5";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 35 1 no 3
		38 0 0 1 2 2 3 4 4 4.4480691189236108 4.4480691189236108 4.5435671657986108
		 4.5435671657986108 4.9916362847222215 4.9916362847222215 5.9916362847222215 6.9916362847222215
		 6.9916362847222215 7.9916362847222215 8.9916362847222224 8.9916362847222224 9.9916362847222224
		 10.991636284722222 10.991636284722222 11.991636284722222 12.991636284722222 12.991636284722222
		 13.442116970486111 13.442116970486111 13.537615017361112 13.537615017361112 13.985684136284723
		 13.985684136284723 14.985684136284723 15.985684136284723 15.985684136284723 16.985684136284725
		 17.985684136284725 17.985684136284725
		37
		2.1308604600694445 -0.014951714409722223 0
		2.0676774088541667 -0.014951714409722223 0
		1.9731439887152777 0.018327907986111114 0
		1.9398643663194446 0.051125217013888891 0
		1.9022439236111111 0.088745659722222231 0
		1.8713758680555557 0.19340766059027781 0
		1.8713758680555557 0.27009548611111112 0
		1.8713758680555557 0.49413004557291673 0
		1.8713758680555557 0.71816460503472235 0
		1.9191248914930557 0.71816460503472235 0
		1.9668739149305556 0.71816460503472235 0
		1.9668739149305556 0.49413004557291673 0
		1.9668739149305556 0.27009548611111112 0
		1.9668739149305556 0.22041720920138891 0
		1.9794140625000001 0.15241102430555556 0
		1.9977419704861112 0.12540147569444446 0
		2.0170345052083336 0.096462673611111119 0
		2.0831114366319445 0.066559244791666666 0
		2.1308604600694445 0.066559244791666666 0
		2.1757156032986114 0.066559244791666666 0
		2.2451687282986112 0.096462673611111119 0
		2.2644612630208334 0.12540147569444446 0
		2.282306857638889 0.15289333767361113 0
		2.295329318576389 0.2194525824652778 0
		2.295329318576389 0.26768391927083335 0
		2.295329318576389 0.49292426215277779 0
		2.295329318576389 0.71816460503472224 0
		2.343078342013889 0.71816460503472224 0
		2.390827365451389 0.71816460503472224 0
		2.390827365451389 0.49413004557291673 0
		2.390827365451389 0.27009548611111112 0
		2.390827365451389 0.19533691406250001 0
		2.3604416232638892 0.088263346354166675 0
		2.3223388671874998 0.051125217013888891 0
		2.2880946180555557 0.017845594618055557 0
		2.1969373914930554 -0.014951714409722223 0
		2.1308604600694445 -0.014951714409722223 0
		;
createNode transform -n "curve4" -p "focusPlane_txtShape";
	rename -uid "3B676675-486F-B062-4607-D59874EC9FCA";
	setAttr ".rp" -type "double3" 1.2139827473958333 0 0 ;
	setAttr ".sp" -type "double3" 1.2139827473958333 0 0 ;
createNode nurbsCurve -n "curveShape4" -p "curve4";
	rename -uid "FE6CDAAA-4CE4-9E6E-82E6-70AC43765F00";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 55 1 no 3
		58 0 0 1 2 2 3 4 4 5 6 6 7 8 8 9 10 10 11 12 12 12.115272894965278 12.115272894965278
		 12.122989908854167 12.122989908854167 13.122989908854167 14.122989908854167 14.122989908854167
		 15.122989908854167 16.122989908854166 16.122989908854166 17.122989908854166 18.122989908854166
		 18.122989908854166 19.122989908854166 20.122989908854166 20.122989908854166 21.122989908854166
		 22.122989908854166 22.122989908854166 23.122989908854166 24.122989908854166 24.122989908854166
		 25.122989908854166 26.122989908854166 26.122989908854166 27.122989908854166 28.122989908854166
		 28.122989908854166 28.130224609374999 28.130224609374999 28.244050564236108 28.244050564236108
		 29.244050564236108 30.244050564236108 30.244050564236108 31.244050564236108 32.244050564236105
		 32.244050564236105
		57
		1.5675184461805556 -0.013022460937500001 0
		1.4971006944444445 -0.013022460937500001 0
		1.3789339192708334 0.034244249131944446 0
		1.336008029513889 0.081028645833333343 0
		1.2930821397569445 0.12781304253472223 0
		1.2458154296874999 0.26768391927083335 0
		1.2458154296874999 0.35835883246527783 0
		1.2458154296874999 0.44855143229166672 0
		1.2916351996527777 0.58263454861111119 0
		1.3355257161458334 0.63231282552083334 0
		1.3784516059027778 0.68054416232638892 0
		1.4961360677083333 0.73118706597222227 0
		1.5689653862847224 0.73118706597222227 0
		1.6051388888888889 0.73118706597222227 0
		1.6683219401041667 0.72057617187500012 0
		1.6953314887152779 0.71237684461805562 0
		1.7184825303819444 0.70514214409722231 0
		1.7671961805555556 0.68343804253472229 0
		1.7908295355902779 0.67041558159722225 0
		1.7908295355902777 0.6127791341145834 0
		1.7908295355902777 0.55514268663194444 0
		1.7869710286458333 0.55514268663194455 0
		1.7831125217013888 0.55514268663194455 0
		1.7705723741319446 0.56671820746527779 0
		1.7310226779513891 0.59951551649305557 0
		1.7025661892361112 0.61543185763888897 0
		1.6750743272569446 0.63038357204861117 0
		1.6104443359375 0.64967610677083343 0
		1.5680007595486112 0.64967610677083343 0
		1.5221809895833334 0.64967610677083343 0
		1.440187717013889 0.6120556640625 0
		1.4093196614583334 0.57539984809027778 0
		1.3789339192708334 0.53874403211805555 0
		1.3451719835069444 0.42781195746527784 0
		1.3451719835069444 0.35835883246527783 0
		1.3451719835069444 0.28456488715277778 0
		1.3808631727430556 0.1779736328125 0
		1.4117312282986112 0.14131781684027778 0
		1.4416346571180556 0.10562662760416668 0
		1.522663302951389 0.069453125000000004 0
		1.5680007595486112 0.069453125000000004 0
		1.6094797092013891 0.069453125000000004 0
		1.6798974609375001 0.089710286458333344 0
		1.7073893229166668 0.10514431423611112 0
		1.7339165581597222 0.12009602864583334 0
		1.7725016276041667 0.15144639756944445 0
		1.7835948350694446 0.16253960503472223 0
		1.787212185329861 0.16253960503472223 0
		1.7908295355902779 0.16253960503472223 0
		1.7908295355902779 0.10562662760416668 0
		1.7908295355902779 0.048713650173611116 0
		1.7671961805555556 0.037620442708333333 0
		1.7252349175347224 0.017363281250000001 0
		1.6953314887152779 0.0077170138888888896 0
		1.6639811197916667 -0.0024115668402777779 0
		1.6104443359375 -0.013022460937500001 0
		1.5675184461805556 -0.013022460937500001 0
		;
createNode transform -n "curve2" -p "focusPlane_txtShape";
	rename -uid "B4E17456-4AF8-77D3-CFE8-3682D96AC69E";
	setAttr ".rp" -type "double3" 0.51511067708333336 0 0 ;
	setAttr ".sp" -type "double3" 0.51511067708333336 0 0 ;
createNode nurbsCurve -n "curveShape2" -p "curve2";
	rename -uid "9F7ECD70-4E73-EFEA-2386-4AAB1B3BB739";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 23 1 no 3
		26 0 0 1 2 2 3 4 4 5 6 6 7 8 8 9 10 10 11 12 12 13 14 14 15 16 16
		25
		1.0958159722222223 0.63568901909722231 0
		1.1368126085069445 0.58842230902777781 0
		1.1821500651041668 0.44855143229166672 0
		1.1821500651041668 0.35884114583333337 0
		1.1821500651041668 0.2715424262152778 0
		1.1377772352430555 0.13070692274305556 0
		1.0958159722222223 0.082957899305555569 0
		1.0519254557291666 0.032797309027777784 0
		0.93472330729166675 -0.014951714409722223 0
		0.86430555555555566 -0.014951714409722223 0
		0.79147623697916669 -0.014951714409722223 0
		0.6747564019097223 0.034244249131944446 0
		0.63279513888888894 0.082957899305555569 0
		0.59131618923611118 0.13070692274305556 0
		0.54694335937500005 0.27057779947916671 0
		0.54694335937500005 0.35884114583333337 0
		0.54694335937500005 0.4495160590277778 0
		0.59179850260416667 0.58649305555555564 0
		0.63327745225694443 0.63568901909722231 0
		0.6747564019097223 0.68343804253472229 0
		0.79195855034722229 0.73311631944444455 0
		0.86430555555555566 0.73311631944444455 0
		0.93761718750000012 0.73311631944444455 0
		1.0553016493055556 0.68199110243055561 0
		1.0958159722222223 0.63568901909722231 0
		;
createNode transform -n "curve3" -p "focusPlane_txtShape";
	rename -uid "FD85D8C0-483B-985A-34AD-CB9DC7332D24";
	setAttr ".rp" -type "double3" 0.51511067708333336 0 0 ;
	setAttr ".sp" -type "double3" 0.51511067708333336 0 0 ;
createNode nurbsCurve -n "curveShape3" -p "curve3";
	rename -uid "2DE1E978-46C9-C50F-178C-0E90346AC83C";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 17 1 no 3
		20 0 0 1 2 2 3 4 4 5 6 6 7 8 8 9 10 10 11 12 12
		19
		1.0827935112847222 0.35884114583333337 0
		1.0827935112847222 0.4302235243055556 0
		1.0519254557291666 0.54019097222222223 0
		1.0239512803819446 0.57636447482638897 0
		0.99549479166666677 0.61350260416666669 0
		0.91494845920138901 0.65064073350694451 0
		0.86478786892361115 0.65064073350694451 0
		0.81269802517361112 0.65064073350694451 0
		0.73504557291666672 0.61446723090277788 0
		0.70514214409722231 0.57636447482638897 0
		0.67668565538194447 0.53970865885416675 0
		0.64629991319444446 0.42877658420138892 0
		0.64629991319444446 0.35884114583333337 0
		0.64629991319444446 0.21752332899305557 0
		0.76494900173611113 0.067523871527777779 0
		0.86478786892361115 0.067523871527777779 0
		0.96462673611111116 0.067523871527777779 0
		1.0827935112847222 0.21752332899305557 0
		1.0827935112847222 0.35884114583333337 0
		;
createNode transform -n "curve1" -p "focusPlane_txtShape";
	rename -uid "8B34D806-44EA-083A-BE29-8AB0A086EBFC";
createNode nurbsCurve -n "curveShape1" -p "curve1";
	rename -uid "3C47B45C-4A14-A4E7-CF99-B78F5F38E7EB";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 2 no 3
		11 0 0.33424316406249999 0.53681477864583338 0.85707085503472225 0.94195800781250005
		 1.2622140842013889 1.6080327690972223 1.7035308159722222 2.4216954210069446 2.8514366319444444
		 2.9363237847222221
		11
		0.50257052951388892 0.63327745225694454 0
		0.16832736545138891 0.63327745225694454 0
		0.16832736545138891 0.43070583767361115 0
		0.4885834418402778 0.43070583767361115 0
		0.4885834418402778 0.34581868489583334 0
		0.16832736545138891 0.34581868489583334 0
		0.16832736545138891 0 0
		0.072829318576388899 0 0
		0.072829318576388899 0.71816460503472224 0
		0.50257052951388892 0.71816460503472224 0
		0.50257052951388892 0.63327745225694454 0
		;
createNode transform -n "curve6" -p "focusPlane_txtShape";
	rename -uid "D604AEFB-4D71-528A-BB94-86B79EBD74A7";
	setAttr ".rp" -type "double3" 2.4549750434027779 0 0 ;
	setAttr ".sp" -type "double3" 2.4549750434027779 0 0 ;
createNode nurbsCurve -n "curveShape6" -p "curve6";
	rename -uid "25D094BB-4C72-A0EF-DEE9-B7BC48EA6398";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 55 1 no 3
		58 0 0 1 2 2 2.1196137152777776 2.1196137152777776 2.1263661024305556 2.1263661024305556
		 3.1263661024305556 4.1263661024305556 4.1263661024305556 5.1263661024305556 6.1263661024305556
		 6.1263661024305556 7.1263661024305556 8.1263661024305556 8.1263661024305556 9.1263661024305556
		 10.126366102430556 10.126366102430556 11.126366102430556 12.126366102430556 12.126366102430556
		 13.126366102430556 14.126366102430556 14.126366102430556 15.126366102430556 16.126366102430556
		 16.126366102430556 17.126366102430556 18.126366102430556 18.126366102430556 18.240674370659722
		 18.240674370659722 18.247909071180555 18.247909071180555 19.247909071180555 20.247909071180555
		 20.247909071180555 21.247909071180555 22.247909071180555 22.247909071180555 23.247909071180555
		 24.247909071180555 24.247909071180555 25.247909071180555 26.247909071180555 26.247909071180555
		 27.247909071180555 28.247909071180555 28.247909071180555 29.247909071180555 30.247909071180555
		 30.247909071180555 31.247909071180555 32.247909071180558 32.247909071180558
		57
		2.7279644097222224 -0.013022460937500001 0
		2.6498296440972222 -0.013022460937500001 0
		2.5403445095486115 0.019292534722222223 0
		2.4921131727430557 0.042925889756944446 0
		2.4921131727430557 0.10273274739583334 0
		2.4921131727430557 0.16253960503472223 0
		2.4954893663194446 0.1625396050347222 0
		2.4988655598958336 0.1625396050347222 0
		2.5461322699652778 0.11816677517361113 0
		2.6657459852430558 0.069453125000000004 0
		2.7212120225694445 0.069453125000000004 0
		2.8003114149305559 0.069453125000000004 0
		2.8813400607638893 0.13553005642361113 0
		2.8813400607638893 0.18954915364583336 0
		2.8813400607638893 0.2324750434027778 0
		2.8388964843750002 0.286494140625 0
		2.7925944010416668 0.29951660156250004 0
		2.7593147786458334 0.30916286892361111 0
		2.7043310546875001 0.3217030164930556 0
		2.6628521050347222 0.33231391059027782 0
		2.6257139756944445 0.34196017795138894 0
		2.5668717447916669 0.37186360677083335 0
		2.5442030164930558 0.39597927517361114 0
		2.5220166015625001 0.41961263020833339 0
		2.497418619791667 0.48376030815972226 0
		2.497418619791667 0.52572157118055562 0
		2.497418619791667 0.6130202907986112 0
		2.6334309895833337 0.73118706597222227 0
		2.7390576171875001 0.73118706597222227 0
		2.7993467881944447 0.73118706597222227 0
		2.9069026692708335 0.70707139756944448 0
		2.9527224392361111 0.68488498263888897 0
		2.9527224392361111 0.62773084852430561 0
		2.9527224392361111 0.57057671440972224 0
		2.9491050889756947 0.57057671440972224 0
		2.9454877387152778 0.57057671440972224 0
		2.9112434895833337 0.60192708333333333 0
		2.8041699218750002 0.64871148003472223 0
		2.7453276909722222 0.64871148003472223 0
		2.6787684461805559 0.64871148003472223 0
		2.5967751736111113 0.58649305555555564 0
		2.5967751736111113 0.53585015190972229 0
		2.5967751736111113 0.49003038194444448 0
		2.6450065104166667 0.43601128472222228 0
		2.6908262803819447 0.42347113715277779 0
		2.7212120225694445 0.41527180989583334 0
		2.8089930555555558 0.39453233506944446 0
		2.837931857638889 0.38585069444444448 0
		2.9122081163194444 0.36318196614583337 0
		2.9806966145833336 0.2715424262152778 0
		2.9806966145833336 0.20450086805555556 0
		2.9806966145833336 0.16253960503472223 0
		2.946452365451389 0.080546332465277787 0
		2.9155843098958334 0.052089843750000003 0
		2.8808577473958334 0.020739474826388892 0
		2.793559027777778 -0.013022460937500001 0
		2.7279644097222224 -0.013022460937500001 0
		;
createNode transform -n "curve12" -p "focusPlane_txtShape";
	rename -uid "9121F8B4-4002-70A6-D19C-028DDA4816EF";
	setAttr ".rp" -type "double3" 4.9422650824652781 0 0 ;
	setAttr ".sp" -type "double3" 4.9422650824652781 0 0 ;
createNode nurbsCurve -n "curveShape12" -p "curve12";
	rename -uid "7C942D6C-4EE4-0CD9-5068-6CA887F1DB93";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 2 no 3
		11 0 0.10707356770833337 0.80294663029252589 1.4222369948758593 1.5114649679661372
		 2.2296295730008593 2.3651596294244706 3.00298910713515 3.5716365680726501 3.6608645411629279
		 4.3790291461976505
		11
		5.5287581380208337 0 0
		5.4216845703125003 0 0
		5.1043223741319448 0.61929036458333342 0
		5.1043223741319448 0 0
		5.0150944010416669 0 0
		5.0150944010416669 0.71816460503472224 0
		5.1506244574652778 0.71816460503472224 0
		5.4395301649305559 0.14951714409722225 0
		5.4395301649305559 0.71816460503472224 0
		5.5287581380208337 0.71816460503472224 0
		5.5287581380208337 0 0
		;
createNode transform -n "curve10" -p "focusPlane_txtShape";
	rename -uid "19A3129D-4C8F-7272-F498-E08AD8D7B322";
	setAttr ".rp" -type "double3" 4.3499842664930561 0 0 ;
	setAttr ".sp" -type "double3" 4.3499842664930561 0 0 ;
createNode nurbsCurve -n "curveShape10" -p "curve10";
	rename -uid "283A6DF1-4CB7-CAA1-FDB9-7D954C56EB11";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 8 2 no 3
		9 0 0.75788068259502583 0.87556514440058142 1.6334458269956071 1.7342493209192182
		 1.9451923684319519 2.2196286748555631 2.4305717223682968 2.5270343959794079
		9
		4.3451611328125006 0 0
		4.5872824435763899 0.71816460503472224 0
		4.7049669053819452 0.71816460503472224 0
		4.9470882161458336 0 0
		4.8462847222222232 0 0
		4.781172417534723 0.20064236111111114 0
		4.5067361111111115 0.20064236111111114 0
		4.4416238064236113 0 0
		4.3451611328125006 0 0
		;
createNode transform -n "curve9" -p "focusPlane_txtShape";
	rename -uid "FE1B885B-4E8D-6594-E2FB-ED86749B4E79";
	setAttr ".rp" -type "double3" 3.8585069444444451 0 0 ;
	setAttr ".sp" -type "double3" 3.8585069444444451 0 0 ;
createNode nurbsCurve -n "curveShape9" -p "curve9";
	rename -uid "132723C5-46E9-B1ED-EC43-50947426B0AD";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 2 no 3
		7 0 0.41623643663194448 1.1344010416666668 1.2298990885416667 1.8631765407986112
		 2.1839149305555559 2.2688020833333336
		7
		4.3475726996527788 0 0
		3.9313362630208339 0 0
		3.9313362630208339 0.71816460503472224 0
		4.0268343098958344 0.71816460503472224 0
		4.0268343098958344 0.08488715277777778 0
		4.3475726996527788 0.08488715277777778 0
		4.3475726996527788 0 0
		;
createNode transform -n "curve13" -p "focusPlane_txtShape";
	rename -uid "543C7746-41AE-13E5-DBFB-D9862083881E";
	setAttr ".rp" -type "double3" 5.6015874565972226 0 0 ;
	setAttr ".sp" -type "double3" 5.6015874565972226 0 0 ;
createNode nurbsCurve -n "curveShape13" -p "curve13";
	rename -uid "387DF8B9-4FD1-6D2B-7BB1-4E9610BF05BE";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 12 2 no 3
		13 0 0.71816460503472224 1.1671983506944446 1.2520855034722222 1.6056212022569445
		 1.8024050564236112 2.1318250868055557 2.2167122395833334 2.5461322699652778 2.8128515625000001
		 3.1663872612847221 3.2512744140624998 3.7003081597222223
		13
		5.6744167751736114 0 0
		5.6744167751736114 0.71816460503472224 0
		6.1234505208333339 0.71816460503472224 0
		6.1234505208333339 0.63327745225694454 0
		5.7699148220486114 0.63327745225694454 0
		5.7699148220486114 0.43649359809027782 0
		6.0993348524305562 0.43649359809027782 0
		6.0993348524305562 0.35160644531250002 0
		5.7699148220486114 0.35160644531250002 0
		5.7699148220486114 0.08488715277777778 0
		6.1234505208333339 0.08488715277777778 0
		6.1234505208333339 0 0
		5.6744167751736114 0 0
		;
createNode transform -n "curve7" -p "focusPlane_txtShape";
	rename -uid "4BE02CA5-4915-67B4-D1CC-E7AD8A127FCF";
	setAttr ".rp" -type "double3" 3.3139751519097227 0 0 ;
	setAttr ".sp" -type "double3" 3.3139751519097227 0 0 ;
createNode nurbsCurve -n "curveShape7" -p "curve7";
	rename -uid "941B29C9-4F19-B32E-420D-529D154C4734";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 21 1 no 3
		24 0 0 1 2 2 3 4 4 4.0810286458333334 4.0810286458333334 4.3487125651041669
		 4.3487125651041669 4.4442106119791669 4.4442106119791669 5.1623752170138895 5.1623752170138895
		 5.3427604166666676 5.3427604166666676 6.3427604166666676 7.3427604166666676 7.3427604166666676
		 8.3427604166666676 9.3427604166666676 9.3427604166666676
		23
		3.8401790364583337 0.50160590277777783 0
		3.8401790364583337 0.45482150607638894 0
		3.8068994140625003 0.37138129340277781 0
		3.7774782986111117 0.34196017795138894 0
		3.740340169270834 0.30530436197916672 0
		3.6400189887152781 0.26768391927083335 0
		3.5633311631944449 0.26768391927083335 0
		3.5228168402777782 0.26768391927083335 0
		3.4823025173611115 0.26768391927083335 0
		3.4823025173611115 0.13384195963541667 0
		3.4823025173611115 0 0
		3.4345534939236115 0 0
		3.3868044704861116 0 0
		3.3868044704861116 0.35908230251736112 0
		3.3868044704861116 0.71816460503472224 0
		3.4769970703125006 0.71816460503472224 0
		3.5671896701388892 0.71816460503472224 0
		3.6308550347222228 0.71816460503472224 0
		3.7205653211805561 0.69694281684027781 0
		3.7548095703125006 0.67330946180555562 0
		3.7948415798611115 0.64581759982638898 0
		3.8401790364583337 0.56141276041666677 0
		3.8401790364583337 0.50160590277777783 0
		;
createNode transform -n "curve8" -p "focusPlane_txtShape";
	rename -uid "193DDDD7-4ECB-E438-FE94-7FB78A7B7F67";
	setAttr ".rp" -type "double3" 3.3139751519097227 0 0 ;
	setAttr ".sp" -type "double3" 3.3139751519097227 0 0 ;
createNode nurbsCurve -n "curveShape8" -p "curve8";
	rename -uid "CD96FEED-4A89-CC19-0E2A-B49AC24D7184";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 17 1 no 3
		20 0 0 1 2 2 3 4 4 4.079099392361111 4.079099392361111 4.3660758463541667 4.3660758463541667
		 4.4311881510416669 4.4311881510416669 5.4311881510416669 6.4311881510416669 6.4311881510416669
		 7.4311881510416669 8.4311881510416669 8.4311881510416669
		19
		3.7408224826388894 0.49919433593750007 0
		3.7408224826388894 0.53633246527777778 0
		3.7152598741319451 0.59131618923611118 0
		3.6892149522569451 0.60867947048611115 0
		3.666546223958334 0.62363118489583336 0
		3.6062570529513893 0.63617133246527779 0
		3.5614019097222229 0.63617133246527779 0
		3.521852213541667 0.63617133246527779 0
		3.4823025173611115 0.63617133246527779 0
		3.4823025173611115 0.49268310546875005 0
		3.4823025173611115 0.34919487847222225 0
		3.5148586697048616 0.34919487847222225 0
		3.5474148220486117 0.34919487847222225 0
		3.6052924262152781 0.34919487847222225 0
		3.6766748046875004 0.3680050998263889 0
		3.7003081597222227 0.39212076822916669 0
		3.7215299479166672 0.41382486979166672 0
		3.7408224826388894 0.46495008680555561 0
		3.7408224826388894 0.49919433593750007 0
		;
createNode transform -n "curve11" -p "focusPlane_txtShape";
	rename -uid "8AD9873A-4B96-9F9E-070F-E9BA31BCDB1A";
	setAttr ".rp" -type "double3" 4.3499842664930561 0 0 ;
	setAttr ".sp" -type "double3" 4.3499842664930561 0 0 ;
createNode nurbsCurve -n "curveShape11" -p "curve11";
	rename -uid "83F1036D-4071-C780-30D5-A0A7D5801DDE";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 2 no 3
		4 0 0.35629347406600054 0.71243707465865813 0.93381891059615807
		4
		4.7546451822916671 0.28215332031250001 0
		4.6437131076388898 0.6207373046875001 0
		4.5332633463541674 0.28215332031250001 0
		4.7546451822916671 0.28215332031250001 0
		;
createNode transform -s -n "persp";
	rename -uid "5B890AF0-4CEE-5A42-985A-7E99DAD47AA0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "807EF627-41DD-6E2C-4603-E49A0F4DACCA";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "C2311F3A-420C-7858-3864-83B9234280A3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "30DA5992-478C-0820-2F43-51BC61061D90";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "AC5BDF2D-44C8-9DA5-6737-DA8798AA845A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "44FA05AC-42DD-3044-CD2E-838764DBEB24";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "43B39716-4276-86A1-01D1-9983999CAE2E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "6EFD9194-4298-8D4B-9C51-68A2AE417D0C";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "50A781ED-43F5-55B3-7470-DE83F63A5D9A";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "E0A42DEA-4F56-A2A0-295B-C792E8585A5D";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "336295C5-4D61-8584-3D35-EFA87916D2F3";
createNode displayLayerManager -n "layerManager";
	rename -uid "B173AD28-482F-EA8A-2E07-2B83B0275E09";
createNode displayLayer -n "defaultLayer";
	rename -uid "2B75AC7C-496F-7CCB-1FBD-02856182C96A";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "B0C64549-4196-CC84-44AB-F38662361183";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "C819ACE7-4FBE-E466-F37A-26AA502B2594";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "0E233FB4-4606-8ABB-C399-89B396FA8F2F";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1874\n            -height 1108\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n"
		+ "            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n"
		+ "            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n"
		+ "            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n"
		+ "                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n"
		+ "                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n"
		+ "\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n"
		+ "                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n"
		+ "                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1874\\n    -height 1108\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1874\\n    -height 1108\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5F186F41-4176-9B31-D43C-9F95213A8F82";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".outf" 51;
	setAttr ".imfkey" -type "string" "exr";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".vtn" -type "string" "ACES RRT v1.0";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES RRT v1.0";
	setAttr ".potn" -type "string" "ACES RRT v1.0";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of ldv_fcs_font.ma
