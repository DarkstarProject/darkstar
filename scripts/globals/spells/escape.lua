-----------------------------------------
-- Spell: Escape
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	spell:setMsg(93);
	Escape(target, target:getZone());

	return 0;
end;

-----------------------------------------
-- Escape
-----------------------------------------

function Escape(player, zone)
	if(zone == 139 or zone == 140 or zone == 141 or zone == 142) then 		-- From Ghelsba Outpost, Fort Ghelsba, Yughott Grotto, Horlais Peak
		player:setPos(-732,-64,611,45,100); 								-- To West Ronfaure at E-4
	elseif(zone == 157 or zone == 158 or zone == 184 or zone == 179) then 	-- From Delkfutt's Tower - Middle, Upper, Lower or Stellar Fulcrum
		player:setPos(-286,-20,320,255,126); 								-- To Qufim Island at F-6
	elseif(zone == 169 or zone == 192 or zone == 194 or zone == 170) then 	-- From Toraimarai Canal or Inner Horutoto Ruins or Outer Horutoto Ruins or Full Moon Fountain
		player:setPos(360,-13,99,128,116); 									-- To East Sarutabaruta at J-7
	elseif(zone == 16 or zone == 20 or zone == 18) then 					-- From Promyvion - Holla or Promyvion - Mea or Promyvion - Dem
		player:setPos(280,-80,-58,0,14); 									-- To Hall of Transference
	elseif(zone == 17 or zone == 19 or zone == 21) then						-- From Spire of Holla or Spire of Mea or Spire of Dem
		player:setPos(280,-80,-58,0,14);									-- To Hall of Transference
	elseif(zone == 162 or zone == 161 or zone == 165) then 					-- From Castle Zvahl Keep or Castle Zvahl Baileys or Throne Room
		player:setPos(-412,-43,19,254,112); 								-- To Xarcabard at G-7
	elseif(zone == 149 or zone == 150) then 								-- From Davoi or Monastic Cavern
		player:setPos(-239,-7,-591,187,104); 								-- To Jugner Forest at G-12
	elseif(zone == 148 or zone == 147) then 								-- From Qulun Dome or Beadeaux
		player:setPos(553,25,-380,120,109); 								-- To Pashhow Marshlands at K-11
	elseif(zone == 177 or zone == 178 or zone == 180 or zone == 181) then	-- From Ve'Lugannon Palace or Shrine of Ru'Avitau or LaLoff Amphitheater or The Celestial Nexus
		player:setPos(0,-34,-471,185,130); 									-- To Ru'Aun Gardens at H-11
	elseif(zone == 152 or zone == 151) then 								-- From Altar Room or Castle Oztroja
		player:setPos(752,-32,-40,129,119); 								-- To Meriphataud Mountains at L-8
	elseif(zone == 159 or zone == 160 or zone == 163) then 					-- From Temple of Uggalepih or Den of Rancor or Sacrificial Chamber
		player:setPos(300,-4,-586,193,124); 								-- To Yhoator Jungle at J-11
	elseif(zone == 12 or zone == 11) then 									-- From Newton Movalpolos or Oldton Movalpolos
		player:setPos(552,-12,660,124,106); 								-- To North Gustaberg at K-6
	elseif(zone == 29 or zone == 30 or zone == 31) then						-- From Riverne - Site B01 or Riverne - Site A01 or Monarch Linn
		player:setPos(-516,-32,359,6,25); 									-- To Misareaux Coast at D-6
	elseif(zone == 32) then													-- From Sealion's Den
		player:setPos(0,-7,-39,192,26);										-- To Tavnazian Safehold
	elseif(zone == 155 or zone == 138) then 								-- Fromn Castle Zvahl Keep (S) or Castle Zvahl Baileys (S)
		player:setPos(-418,-44,20,0,137); 									-- To Xarcabard (S) at G-7
	elseif(zone == 167) then 												-- From Bostaunieux Oubliette
		player:setPos(-663,-27,19,6,100); 									-- To West Ronfaure at F-8
	elseif(zone == 190) then 												-- From King Ranperre's Tomb
		player:setPos(200,0,-536,187,101); 									-- To East Ronfaure at H-11
	elseif(zone == 173) then 												-- From Korroloka Tunnel
		player:setPos(-72,0,20,255,172); 									-- To Zeruhn Mines at H-7
	elseif(zone == 195) then 												-- From The Eldieme Necropolis
		player:setPos(-403,-15,-128,187,105); 								-- To Batallia Downs at F-8
	elseif(zone == 166) then 												-- From Ranguemont Pass
		player:setPos(809,-63,649,98,101); 									-- To East Ronfaure at K-4
	elseif(zone == 9 or zone == 10 or zone == 22 or zone == 23) then		-- From Pso'Xja or The Shrouded Maw or Promyvion-Vahzl or Spire of Vahzl
		player:setPos(-414,-39,-420,255,111); 								-- To Beaucedine Glacier at E-11
	elseif(zone == 204 or zone == 206) then 								-- From Fei'Yin or Qu'Bia Arena
		player:setPos(280,20,568,61,111); 									-- To Beaucedine Glacier at J-4
	elseif(zone == 197) then 												-- From Crawlers' Nest
		player:setPos(-372,-28,-772,0,110); 								-- To Rolanberry Fields at F-13
	elseif(zone == 153 or zone == 154) then 								-- From The Boyahda Tree or Dragon's Aery
		player:setPos(508,2,-577,133,121); 									-- To The Sanctuary of Zi'Tah at K-12
	elseif(zone == 200) then 												-- From Garlaige Citadel
		player:setPos(-104,-24,-408,189,120); 								-- To Sauromugue Champaign at H-10
	elseif(zone == 213) then 												-- From Labyrinth of Onzozo
		player:setPos(446,18,192,48,118); 									-- To Buburimu Peninsula at K-6
	elseif(zone == 198) then 												-- From Maze of Shakhrami
		player:setPos(445,47,485,79,117); 									-- To Tahrongi Canyon at K-5
	elseif(zone == 145 or zone == 146) then 								-- From Giddeus or Balgas Dais
		player:setPos(-369,-21,68,220,115); 								-- To West Sarutabaruta at F-8
	elseif(zone == 205) then 												-- From Ifrit's Cauldron
		player:setPos(97,0,341,110,124); 									-- To Yhoator Jungle at I-6
	elseif(zone == 176) then 												-- From Sea Serpent Grotto
		player:setPos(-492,17,-376,10,123);									-- To Yuhtunga Jungle at E-11
	elseif(zone == 191) then 												-- From Dangruf Wadi
		player:setPos(-596,39,-520,4,107); 									-- To South Gustaberg at D-9
	elseif(zone == 143 or zone == 144) then									-- From Palborough Mines or Waughroon Shrine
		player:setPos(484,-32,1166,106,106); 								-- To North Gustaberg at K-3
	elseif(zone == 208 or zone == 168) then 								-- From Quicksand Caves or Chamber of Oracles
		player:setPos(408,-9,-16,131,114); 									-- To Eastern Altepa Desert at J-8
	elseif(zone == 174) then 												-- From Kuftal Tunnel
		player:setPos(-65,-3,454,79,125); 									-- To Western Altepa Desert at H-4
	elseif(zone == 212) then 												-- From Gustav Tunnel
		player:setPos(-783,-8,20,130,103); 									-- To Valkurm Dunes at B-8
	elseif(zone == 196) then 												-- From Gusgen Mines
		player:setPos(686,21,204,101,108); 									-- To Konschtat Highlands at L-7
	elseif(zone == 193) then 												-- From Ordelle's Caves
		player:setPos(-259,23,111,190,102); 								-- To La Theine Plateau at F-7
	elseif(zone == 28) then 												-- From Sacrarium
		player:setPos(23,-24,732,74,25);	 								-- To Misareaux Coast at G-4
	elseif(zone == 27) then 												-- From Phomiuna Aqueducts
		player:setPos(566,-15,279,125,25) 									-- To Misareaux Coast at K-7
	elseif(zone == 68) then 												-- From Aydeewa Subterrane
		player:setPos(87,-12,418,5,51); 									-- To Wajaom Woodlands at I-6
	elseif(zone == 65) then 												-- From Mamook
		player:setPos(-459,-1,-535,191,51); 								-- To Wajaom Woodlands at E-12
	elseif(zone == 62) then 												-- From Halvung
		player:setPos(868,-10,179,128,61); 									-- To Mount Zhayolm at L-7
	elseif(zone == 54) then 												-- From Arrapago Reef
		player:setPos(166,-12,-59,249,79); 									-- To Caedarva Mire Azouph Isle at I-6
	elseif(zone == 55) then													-- From Ilrusi Atoll
		player:setPos(27,-7,619,0,54);										-- To Arrapago Reef/Ilrusi Atoll Staging Point
	elseif(zone == 72) then 												-- From Alzadaal Undersea Ruins
		player:setPos(20,-28,590,62,52); 									-- To Bhaflau Thickets at F-6
	elseif(zone == 85) then 												-- From La Vaule (S)
		player:setPos(-200,-7,-502,197,82); 								-- To Jugner Forest (S) at G-12
	elseif(zone == 92) then 												-- From Beadeaux (S)
		player:setPos(540,25,-347,191,90); 									-- To Pashhow Marshlands (S) at K-11
	elseif(zone == 99) then 												-- From Castle Oztroja (S)
		player:setPos(730,-32,-39,127,97); 									-- To Meriphataud Mountains (S) at L-8
	elseif(zone == 164) then 												-- From Garlaige Citadel (S)
		player:setPos(-102,-23,-400,204,98); 								-- To Sauromugue Champaign (S) at H-10
	elseif(zone == 175) then 												-- From The Eldieme Necropolis (S)
		player:setPos(-401,-8,-197,185,84); 								-- To Batallia Downs (S) F-9
	elseif(zone == 171) then 												-- From Crawlers' Nest (S)
		player:setPos(-376,-28,-776,222,91); 								-- To Rolanberry Field (S) F-13
	elseif(zone == 34 or zone == 35 or zone == 36) then						-- From Grand Palace of HuXzoi or The Garden of RuHmet or Empyreal Paradox
		player:setPos(0,-8,-490,63,33);										-- To Al'Taieu (H-12)
	end;

end;