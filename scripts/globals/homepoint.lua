require("scripts/globals/settings");
function addtohps(player,mask,num)
	if(mask == 1) then
		local hps = player:getVar("hpmask1")
		if (bit.band(hps, bit.lshift(1, (num))) == 0)then
			player:setVar("hpmask1",bit.bor(hps, bit.lshift(1, (num))))
			return 65536
		end
	end
	if(mask == 2) then
		local hps = player:getVar("hpmask2")
		if (bit.band(hps, bit.lshift(1, (num))) == 0)then
			player:setVar("hpmask2",bit.bor(hps, bit.lshift(1, (num))))
			return 65536
		end
	end
	if(mask == 3) then
		local hps = player:getVar("hpmask3")
		if (bit.band(hps, bit.lshift(1, (num))) == 0)then
			player:setVar("hpmask3",bit.bor(hps, bit.lshift(1, (num))))
			return 65536
		end
	end
	return 0;
end
function hpteleport(player,option)
		if(HOMEPOINT_TELEPORT ~= 0)then   
		local hps = player:getVar("hpmask1")
		if(option == 2 and bit.band(hps, bit.lshift(1,0)) ~= 0) then--Southern San dOria 1
			if (player:delGil(500))then
				player:setPos(-85.554, 1.000, -64.554,-45, 230)
			end
		end
		if(option == 65538 and bit.band(hps, bit.lshift(1,1)) ~= 0) then--Southern San dOria 2
			if (player:delGil(500))then
				player:setPos(44.1, 2, -34.5,170, 230)
			end
		end
		if(option == 131074 and bit.band(hps, bit.lshift(1,2)) ~= 0) then--Southern San dOria 3
			if (player:delGil(500))then
				player:setPos(140.5, -2, 121,0, 230)
			end
		end
		if(option == 196610 and bit.band(hps, bit.lshift(1,3)) ~= 0) then--Northern San dOria 1
			if (player:delGil(500))then
				player:setPos(-178, 4, 71,0, 231)
			end
		end
		if(option == 262146 and bit.band(hps, bit.lshift(1,4)) ~= 0) then--Northern San dOria 2
			if (player:delGil(500))then
				player:setPos(10, -0.2, 95,0, 231)
			end
		end
		if(option == 327682 and bit.band(hps, bit.lshift(1,5)) ~= 0) then--Northern San dOria 3
			if (player:delGil(500))then
				player:setPos(70, -0.2, 10,0, 231)
			end
		end
		if(option == 393218 and bit.band(hps, bit.lshift(1,6)) ~= 0) then--Port San dOria 1
			if (player:delGil(500))then
				player:setPos(-68, -4, -105,0, 232)
			end
		end
		if(option == 458754 and bit.band(hps, bit.lshift(1,7)) ~= 0) then--Port San dOria 2
			if (player:delGil(500))then
				player:setPos(48, -12, -105,0, 232)
			end
		end
		if(option == 524290 and bit.band(hps, bit.lshift(1,8)) ~= 0) then--Port San dOria 3 
			if (player:delGil(500))then
				player:setPos(-6, -13, -150,0, 232)
			end
		end
		if(option == 589826 and bit.band(hps, bit.lshift(1,9)) ~= 0) then--Bastok Mine 1
			if (player:delGil(500))then
				player:setPos(39, 0, -43,0, 234)
			end
		end
		if(option == 655362 and bit.band(hps, bit.lshift(1,10)) ~= 0) then--Bastok Mine 2
			if (player:delGil(500))then
				player:setPos(118, 1, -58,0, 234)
			end
		end
		if(option == 720898 and bit.band(hps, bit.lshift(1,11)) ~= 0) then--Bastok Markets 1
			if (player:delGil(500))then
				player:setPos(-293, -10, -102,0, 235)
			end
		end
		if(option == 786434 and bit.band(hps, bit.lshift(1,12)) ~= 0) then--Bastok Markets 2
			if (player:delGil(500))then
				player:setPos(-328, -12, -33,0, 235)
			end
		end
		if(option == 851970 and bit.band(hps, bit.lshift(1,13)) ~= 0) then--Bastok Markets 3
			if (player:delGil(500))then
				player:setPos(-189, -8, 26,0, 235)
			end
		end
		if(option == 917506 and bit.band(hps, bit.lshift(1,14)) ~= 0) then--Bastok port 1
			if (player:delGil(500))then
				player:setPos(58, 7, -28,0, 236)
			end
		end
		if(option == 983042 and bit.band(hps, bit.lshift(1,15)) ~= 0) then--Bastok port 2
			if (player:delGil(500))then
				player:setPos(42, 8.5, -244,0, 236)
			end
		end
		if(option == 1048578 and bit.band(hps, bit.lshift(1,16)) ~= 0) then--Metal works 1
			if (player:delGil(500))then
				player:setPos(46, -14, -19,0, 237)
			end
		end
		if(option == 1114114 and bit.band(hps, bit.lshift(1,17)) ~= 0) then--Windurst Water 1
			if (player:delGil(500))then
				player:setPos(-32, -5, 132,0, 238)
			end
		end
		if(option == 1179650 and bit.band(hps, bit.lshift(1,18)) ~= 0) then--Windurst Water 2
			if (player:delGil(500))then
				player:setPos(138.5, 0, -14,0, 238)
			end
		end
		if(option == 1245186 and bit.band(hps, bit.lshift(1,19)) ~= 0) then--Windurst Walls 1
			if (player:delGil(500))then
				player:setPos(-72, -5, 125,0, 239)
			end
		end
		if(option == 1310722 and bit.band(hps, bit.lshift(1,20)) ~= 0) then--Windurst Walls 2
			if (player:delGil(500))then
				player:setPos(-212, 0, -99,0, 239)
			end
		end
		if(option == 1376258 and bit.band(hps, bit.lshift(1,21)) ~= 0) then--Windurst Walls 3
			if (player:delGil(500))then
				player:setPos(31, -6.5, -40,0, 239)
			end
		end
		if(option == 1441794 and bit.band(hps, bit.lshift(1,22)) ~= 0) then--Port Windurst 1
			if (player:delGil(500))then
				player:setPos(-68, -7, 112,0, 240)
			end
		end
		if(option == 1507330 and bit.band(hps, bit.lshift(1,23)) ~= 0) then--Port Windurst 2
			if (player:delGil(500))then
				player:setPos(-207, -8, 210,0, 240)
			end
		end
		if(option == 1572866 and bit.band(hps, bit.lshift(1,24)) ~= 0) then--Port Windurst 3
			if (player:delGil(500))then
				player:setPos(180, -12, 226,0, 240)
			end
		end
		if(option == 1638402 and bit.band(hps, bit.lshift(1,25)) ~= 0) then--Windurst Woods 1
			if (player:delGil(500))then
				player:setPos(9, -2, 0,0, 241)
			end
		end
		if(option == 1703938 and bit.band(hps, bit.lshift(1,26)) ~= 0) then--Windurst Woods 2
			if (player:delGil(500))then
				player:setPos(107, -5, -56,0, 241)
			end
		end
		if(option == 1769474 and bit.band(hps, bit.lshift(1,27)) ~= 0) then--Windurst Woods 3
			if (player:delGil(500))then
				player:setPos(-92, -5, 62,0, 241)
			end
		end
		if(option == 1835010 and bit.band(hps, bit.lshift(1,28)) ~= 0) then--Windurst Woods 4
			if (player:delGil(500))then
				player:setPos(74, -7, -139,0, 241)
			end
		end
		if(option == 1900546 and bit.band(hps, bit.lshift(1,29)) ~= 0) then--RuLude Gardens 1
			if (player:delGil(500))then
				player:setPos(-6, 3, 0,0, 243)
			end
		end
		if(option == 1966082 and bit.band(hps, bit.lshift(1,30)) ~= 0) then--RuLude Gardens 2
			if (player:delGil(500))then
				player:setPos(53, 9, -57,0, 243)
			end
		end
		if(option == 2031618 and bit.band(hps, bit.lshift(1,31)) ~= 0) then--RuLude Gardens 3
			if (player:delGil(500))then
				player:setPos(-67 ,6 ,-25,0, 243)
			end
		end
		hps = player:getVar("hpmask2")
		if(option == 2097154 and bit.band(hps, bit.lshift(1,0)) ~= 0) then--Upper Jeuno 1
			if (player:delGil(500))then
				player:setPos(-99, 0, 167,0, 244)
			end
		end
		if(option == 2162690 and bit.band(hps, bit.lshift(1,1)) ~= 0) then--Upper Jeuno 2
			if (player:delGil(500))then
				player:setPos(32, -1, -44,0, 244)
			end
		end
		if(option == 2228226 and bit.band(hps, bit.lshift(1,2)) ~= 0) then--Upper Jeuno 3
			if (player:delGil(500))then
				player:setPos(-52, 1, 16,0, 244)
			end
		end
		if(option == 2293762 and bit.band(hps, bit.lshift(1,3)) ~= 0) then--Lower Jeuno 1
			if (player:delGil(500))then
				player:setPos(-99, 0, -183,0, 245)
			end
		end
		if(option == 2359298 and bit.band(hps, bit.lshift(1,4)) ~= 0) then--Lower Jeuno 2
			if (player:delGil(500))then
				player:setPos(18, -1, 54,0, 245)
			end
		end
		if(option == 2424834 and bit.band(hps, bit.lshift(1,5)) ~= 0) then--Port Jeuno 1
			if (player:delGil(500))then
				player:setPos(37, 0, 9,0, 246)
			end
		end
		if(option == 2490370 and bit.band(hps, bit.lshift(1,6)) ~= 0) then--Port Jeuno 2
			if (player:delGil(500))then
				player:setPos(-155, -1, -4,0, 246)
			end
		end
		if(option == 2555906 and bit.band(hps, bit.lshift(1,7)) ~= 0) then--Kazham 1
			if (player:delGil(500))then
				player:setPos(78, -13, -94,0, 250)
			end
		end
		if(option == 2621442 and bit.band(hps, bit.lshift(1,8)) ~= 0) then--Mhaura 1
			if (player:delGil(500))then
				player:setPos(-13, -15, 87,0, 249)
			end
		end
		if(option == 2686978 and bit.band(hps, bit.lshift(1,9)) ~= 0) then--Norg 1
			if (player:delGil(500))then
				player:setPos(-27, 0, -47,0, 252)
			end
		end
		if(option == 2752514 and bit.band(hps, bit.lshift(1,10)) ~= 0) then--Rabao 1
			if (player:delGil(500))then
				player:setPos(-29, 0, -76,0, 247)
			end
		end
		if(option == 2818050 and bit.band(hps, bit.lshift(1,11)) ~= 0) then--Selbina 1
			if (player:delGil(500))then
				player:setPos(36, -11, 35,0, 248)
			end
		end 
		--12 Western Adoulin    2883586 13 Eastern Adoulin       2949122 14 Ceizak Battlegrounds 3014658
		--15 Foret de Hennetiel 3080194 16 Morimar Basalt Fields 3145730 17 Yorcia Weald         3211266
		--18 Marjami Ravine     3276802 19 Kamihr Drifts         3342338
		if(option == 3407874 and bit.band(hps, bit.lshift(1,20)) ~= 0) then--Yughott Grotto 1
			if (player:delGil(1000))then
				player:setPos(434, -40, 171,0, 142)
			end
		end
		if(option == 3473410 and bit.band(hps, bit.lshift(1,21)) ~= 0) then--Palborough Mines 1
			if (player:delGil(1000))then
				player:setPos(109, -38, -147,0, 143)
			end
		end
		if(option == 3538946 and bit.band(hps, bit.lshift(1,22)) ~= 0) then--Giddeus 1
			if (player:delGil(1000))then
				player:setPos(-132, -3, -303,0, 145)
			end
		end
		if(option == 3604482 and bit.band(hps, bit.lshift(1,23)) ~= 0) then--Fayien 1
			if (player:delGil(1000))then
				player:setPos(243, -24, 62,0, 204)
			end
		end
		if(option == 3670018 and bit.band(hps, bit.lshift(1,24)) ~= 0) then--Quicksand Caves 1
			if (player:delGil(1000))then
				player:setPos(-984, 17, -289,0, 208)
			end
		end
		if(option == 3735554 and bit.band(hps, bit.lshift(1,25)) ~= 0) then--Den of Rancor 1
			if (player:delGil(1000))then
				player:setPos(-80, 46, 62,0, 160)
			end
		end
		if(option == 3801090 and bit.band(hps, bit.lshift(1,26)) ~= 0) then--Castle Zvahl Keep 1
			if (player:delGil(1000))then
				player:setPos(-554, -70, 66,0, 162)
			end
		end
		if(option == 3866626 and bit.band(hps, bit.lshift(1,27)) ~= 0) then--RuAun Gardens 1
			if (player:delGil(1000))then
				player:setPos(5, -42, 526,0, 130)
			end
		end
		if(option == 3932162 and bit.band(hps, bit.lshift(1,28)) ~= 0) then--RuAun Gardens 2
			if (player:delGil(1000))then
				player:setPos(-499, -42, 167,0, 130)
			end
		end
		if(option == 3997698 and bit.band(hps, bit.lshift(1,29)) ~= 0) then--RuAun Gardens 3
			if (player:delGil(1000))then
				player:setPos(-312, -42, -422,0, 130)
			end
		end
		if(option == 4063234 and bit.band(hps, bit.lshift(1,30)) ~= 0) then--RuAun Gardens 4
			if (player:delGil(1000))then
				player:setPos(500, -42, 158,0, 130)
			end
		end
		if(option == 4128770 and bit.band(hps, bit.lshift(1,31)) ~= 0) then-- RuAun Gardens 5
			if (player:delGil(1000))then
				player:setPos(305, -42, -427,0, 130)
			end
		end
		hps = player:getVar("hpmask3")
		if(option == 4194306 and bit.band(hps, bit.lshift(1,0)) ~= 0) then--Tavnazian Safehold 1
			if (player:delGil(500))then
				player:setPos(-1, -27, 107,0, 26)
			end
		end
		if(option == 4259842 and bit.band(hps, bit.lshift(1,1)) ~= 0) then--Aht Urhgan Whitegate 1
			if (player:delGil(500))then
				player:setPos(-21, 0, -21,0, 50)
			end
		end
		if(option == 4325378 and bit.band(hps, bit.lshift(1,2)) ~= 0) then--Nashmau 1
			if (player:delGil(500))then
				player:setPos(-20, 0, -25,0, 53)
			end
		end
		if(option == 4390914 and bit.band(hps, bit.lshift(1,3)) ~= 0) then--Al Zahbi 1
			if (player:delGil(500))then
				player:setPos(-38, 0, -55,0, 48)
			end
		end
		if(option == 4456450 and bit.band(hps, bit.lshift(1,4)) ~= 0) then--Southern San_dOria [S] 1
			if (player:delGil(500))then
				player:setPos(-85, 1, 1-66,0, 80)
			end
		end
		if(option == 4521986 and bit.band(hps, bit.lshift(1,5)) ~= 0) then--Bastok Markets [S] 1
			if (player:delGil(500))then
				player:setPos(-293, -10, -102,0, 87)
			end
		end
		if(option == 4587522 and bit.band(hps, bit.lshift(1,6)) ~= 0) then--Windurst Waters [S] 1
			if (player:delGil(500))then
				player:setPos(-32, -5, 131,0, 94)
			end
		end
		if(option == 4653058 and bit.band(hps, bit.lshift(1,7)) ~= 0) then--Upper Delkfutts Tower 1
			if (player:delGil(1000))then
				player:setPos(-365, -176.5, -36,0, 158)
			end
		end
		if(option == 4718594 and bit.band(hps, bit.lshift(1,8)) ~= 0) then--The Shrine of RuAvitau 1
			if (player:delGil(1000))then
				player:setPos(-13, 48, 61,0, 178)
			end
		end
		--9-31Empty
		end
	end
