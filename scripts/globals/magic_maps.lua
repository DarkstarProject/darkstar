---------------------------------------------
--
--	Function that all map NPCS use.
--	SE updated the map NPCs to sell maps from the normal areas, RoZ, and CoP areas (Update was in Nov 5, 2013)
---------------------------------------------

require("scripts/globals/keyitems");

local Maps = {MAP_OF_THE_SAN_DORIA_AREA, MAP_OF_THE_BASTOK_AREA, MAP_OF_THE_WINDURST_AREA, MAP_OF_THE_JEUNO_AREA, MAP_OF_ORDELLES_CAVES, MAP_OF_GHELSBA, MAP_OF_DAVOI, MAP_OF_CARPENTERS_LANDING, MAP_OF_THE_ZERUHN_MINES,
	MAP_OF_THE_PALBOROUGH_MINES, MAP_OF_BEADEAUX, MAP_OF_GIDDEUS, MAP_OF_CASTLE_OZTROJA, MAP_OF_THE_MAZE_OF_SHAKHRAMI, MAP_OF_THE_LITELOR_REGION, MAP_OF_BIBIKI_BAY, MAP_OF_QUFIM_ISLAND, MAP_OF_THE_ELDIEME_NECROPOLIS,
	MAP_OF_THE_GARLAIGE_CITADEL, MAP_OF_THE_ELSHIMO_REGIONS, MAP_OF_THE_NORTHLANDS_AREA, MAP_OF_KING_RANPERRES_TOMB, MAP_OF_THE_DANGRUF_WADI, MAP_OF_THE_HORUTOTO_RUINS, MAP_OF_BOSTAUNIEUX_OUBLIETTE,
	MAP_OF_THE_TORAIMARAI_CANAL, MAP_OF_THE_GUSGEN_MINES, MAP_OF_THE_CRAWLERS_NEST, MAP_OF_THE_RANGUEMONT_PASS, MAP_OF_DELKFUTTS_TOWER, MAP_OF_FEIYIN, MAP_OF_CASTLE_ZVAHL};

local Uoption = {	--User option selected.
	1,			--SanDoria Area
	65537,		--Bastok Area
	131073,		--Windurst Area
	196609,		--Jeuno Area
	262145,		--Ordelles Caves
	327681,		--Ghelsba
	393217,		--Davoi
	458753,		--Carpenters Landing
	524289,		--Zeruhn Mines
	589825,		--Palborough Mines
	655361,		--Beadeaux
	720897,		--Giddeus
	786433,		--Castle Oztroja
	851969,		--Maze of Shakhrami
	917505,		--Li'Telor Region
	983041,		--Bibiki Bay
	1048577,	--Qufim Island
	1114113,	--Eldieme Necropolis
	1179649,	--Garlaige Citadel
	1245185,	--Elshimo Regions
	1310721,	--Northlands Area
	1376257,	--King Ranperres Tomb
	1441793,	--Dangruf Wadi
	1507329,	--Horutoto Ruins
	1572865,	--Bostaunieux Oubliette
	1638401,	--Toraimarai Canal
	1703937,	--Gusgen Mines
	1769473,	--Crawlers Nest
	1835009,	--Ranguemont Pass
	1900545,	--Delkfutts Tower
	1966081,	--Feiyin
	2031617		--Castle Zvahl
	};
--Groups maps by price, based off the user option.
local p2 = { --Maps that are price at 200 gil
	Uoption[1],		--SanDoria Area
	Uoption[2],		--Bastok Area
	Uoption[3],		--Windurst Area
	Uoption[9]		--Zeruhn Mines
	};
local p6 = { --Maps that are price at 600 gil
	Uoption[4],		--Jeuno Area
	Uoption[5],		--Ordelles Caves
	Uoption[6],		--Ghelsba
	Uoption[10],	--Palborough Mines
	Uoption[11],	--Beadeaux
	Uoption[12],	--Giddeus
	Uoption[14],	--Maze of Shakhrami
	Uoption[22],	--King Ranperres Tomb
	Uoption[23],	--Dangruf Wadi
	Uoption[24],	--Horutoto Ruins
	Uoption[27]		--Gusgen Mines
	};
local p3 = {	--Maps that are price at 3000 gil
	Uoption[7],		--Davoi
	Uoption[8],		--Carpenters Landing
	Uoption[13],	--Castle Oztroja
	Uoption[15],	--Li'Telor Region
	Uoption[16],	--Bibiki Bay
	Uoption[17],	--Qufim Island
	Uoption[18],	--Eldieme Necropolis
	Uoption[19],	--Garlaige Citadel
	Uoption[20],	--Elshimo Regions
	Uoption[21],	--Northlands Area
	Uoption[25],	--Bostaunieux Oubliette
	Uoption[26],	--Toraimarai Canal
	Uoption[28],	--Crawlers Nest
	Uoption[29],	--Ranguemont Pass
	Uoption[30],	--Delkfutts Tower
	Uoption[31],	--Feiyin
	Uoption[32]		--Castle Zvahl
	}

function CheckMaps(player, npc, csid)
	local i = 0;
	local mapVar = 0;

	while i <= 31 do
		if player:hasKeyItem(Maps[i+1]) then
			mapVar = bit.bor(mapVar, bit.lshift(1,i));
		end
		i = i + 1; 
	end

	player:startEvent(csid, mapVar);
end;

function CheckMapsUpdate (player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED)
	local price = 0;
	local MadePurchase = false;
	local KI = 0;
	local i = 0;
	local mapVar = 0; 

	while i <= 31 do
		if (option == Uoption[i+1]) then
			local x =1;
			while x <= 17 do
				if (x <= 4 and option == p2[x]) then
					price = 200;
				elseif (x <= 11 and option == p6[x]) then
					price = 600;
				elseif (x <= 17 and option == p3[x]) then
					price = 3000;
				end
				x=x+1;
			end
			MadePurchase = true;
			KI = Maps[i+1];
		end
		i = i + 1;
	end

	if (price > player:getGil()) then
		player:messageSpecial(NOT_HAVE_ENOUGH_GIL);
		MadePurchase = false;
		price = 0;
	elseif (price > 0 and MadePurchase == true) then
		player:delGil(price);
		MadePurchase = false;
		player:addKeyItem(KI);
		player:messageSpecial(KEYITEM_OBTAINED, KI);
	end
	i=0;
	while i <= 31 do
		if player:hasKeyItem(Maps[i+1]) then
			mapVar = bit.bor(mapVar, bit.lshift(1,i));
		end
		i = i + 1;
	end
	player:updateEvent(mapVar);
end;