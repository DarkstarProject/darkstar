-----------------------------------
-- Area: Windurst Woods
-- NPC: Pehki Machumaht
-- Map Seller NPC
-----------------------------------
--package.loaded ["scripts/globals/magicmaps"]=nil;
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
--require("scripts/globals/magicmaps");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Woods/TextIDs");

local mapVar = 0;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player, npc) 
	--mapVar = MagicMapsCheck(player, npc, mapVar);
	if player:hasKeyItem(MAP_OF_THE_SAN_DORIA_AREA) then
        mapVar = mapVar + 1;
    end

    if player:hasKeyItem(MAP_OF_THE_BASTOK_AREA) then
        mapVar = mapVar + 2;
    end

    if player:hasKeyItem(MAP_OF_THE_WINDURST_AREA) then
        mapVar = mapVar + 4;
    end

    if player:hasKeyItem(MAP_OF_THE_JEUNO_AREA) then
        mapVar = mapVar + 8;
    end

    if player:hasKeyItem(MAP_OF_ORDELLES_CAVES) then
        mapVar = mapVar + 16;
    end

    if player:hasKeyItem(MAP_OF_GHELSBA) then
        mapVar = mapVar + 32;
    end

    if player:hasKeyItem(MAP_OF_DAVOI) then
        mapVar = mapVar + 64;
    end

    if player:hasKeyItem(MAP_OF_CARPENTERS_LANDING) then
        mapVar = mapVar + 128;
    end

    if player:hasKeyItem(MAP_OF_THE_ZERUHN_MINES) then
        mapVar = mapVar + 256;
    end

    if player:hasKeyItem(MAP_OF_THE_PALBOROUGH_MINES) then
        mapVar = mapVar + 512;
    end

    if player:hasKeyItem(MAP_OF_BEADEAUX) then
        mapVar = mapVar + 1024;
    end

    if player:hasKeyItem(MAP_OF_GIDDEUS) then
        mapVar = mapVar + 2048;
    end

    if player:hasKeyItem(MAP_OF_CASTLE_OZTROJA) then
        mapVar = mapVar + 4096;
    end

    if player:hasKeyItem(MAP_OF_THE_MAZE_OF_SHAKHRAMI) then
        mapVar = mapVar + 8192;
    end
   
    if player:hasKeyItem(MAP_OF_THE_LITELOR_REGION) then
        mapVar = mapVar + 16384;
    end
   
    if player:hasKeyItem(MAP_OF_BIBIKI_BAY) then
        mapVar = mapVar + 32768;
    end

   if player:hasKeyItem(MAP_OF_QUFIM_ISLAND) then
        mapVar = mapVar + 65536;
    end
   
   if player:hasKeyItem(MAP_OF_THE_ELDIEME_NECROPOLIS) then
        mapVar = mapVar + 131072;
    end
   
   if player:hasKeyItem(MAP_OF_THE_GARLAIGE_CITADEL) then
        mapVar = mapVar + 262144;
    end
   
   if player:hasKeyItem(MAP_OF_THE_ELSHIMO_REGIONS) then
        mapVar = mapVar + 524288;
    end
   
   if player:hasKeyItem(MAP_OF_THE_NORTHLANDS_AREA) then
        mapVar = mapVar + 1048576;
    end

   if player:hasKeyItem(MAP_OF_KING_RANPERRES_TOMB) then
        mapVar = mapVar + 2097152;
    end

   if player:hasKeyItem(MAP_OF_THE_DANGRUF_WADI) then
        mapVar = mapVar + 4194304;
    end

   if player:hasKeyItem(MAP_OF_THE_HORUTOTO_RUINS) then
        mapVar = mapVar + 8388608;
    end

   if player:hasKeyItem(MAP_OF_BOSTAUNIEUX_OUBLIETTE) then
        mapVar = mapVar + 16777216;
    end

   if player:hasKeyItem(MAP_OF_THE_TORAIMARAI_CANAL) then
        mapVar = mapVar + 33554432;
    end

   if player:hasKeyItem(MAP_OF_THE_GUSGEN_MINES) then
        mapVar = mapVar + 67108864;
    end

   if player:hasKeyItem(MAP_OF_THE_CRAWLERS_NEST) then
        mapVar = mapVar + 134217728;
    end

   if player:hasKeyItem(MAP_OF_THE_RANGUEMONT_PASS) then
        mapVar = mapVar + 268435456;
    end

   if player:hasKeyItem(MAP_OF_DELKFUTTS_TOWER) then
        mapVar = mapVar + 536870912;
    end

   if player:hasKeyItem(MAP_OF_FEIYIN) then
        mapVar = mapVar + 1073741824;
    end

   if player:hasKeyItem(MAP_OF_CASTLE_ZVAHL) then
       mapVar = mapVar + 2147483648;
   --Why is this one STILL showing on list??
   --Exceeded max value size in Darkstar??
    end

   --player:PrintToPlayer( string.format( " mapVar: '%u' ", mapVar ) );
   player:startEvent(0x2710, mapVar);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player, csid, option)
	--mapVar = MagicMapsSells(player, csid, option, mapVar);
	
	local price = 0;
	local MadePurchase = false;
	local KI = 0;
	if (csid == 0x2710) then
		if (option == 1) then -- San d'Oria
			price = 200;
			MadePurchase = true;
			mapVar = mapVar + 1;
			KI = MAP_OF_THE_SAN_DORIA_AREA;
			--player:PrintToPlayer( string.format( " mapVar: '%u' ", mapVar ) );
			--player:PrintToPlayer( string.format( " Price:'%u' (San d'Oria)", price ) );
		elseif (option == 65537) then -- Bastok
			price = 200;
			MadePurchase = true;
			mapVar = mapVar + 2;
			KI = MAP_OF_THE_BASTOK_AREA;
			--player:PrintToPlayer( string.format( " mapVar: '%u' ", mapVar ) );
			--player:PrintToPlayer( string.format( " Price:'%u' (Bastok) ", price ) );
		elseif (option == 131073) then
			price = 200;
			MadePurchase = true;
			mapVar = mapVar + 4;
			KI = MAP_OF_THE_WINDURST_AREA;
		elseif (option == 196609) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 8;
			KI = MAP_OF_THE_JEUNO_AREA;
		elseif (option == 262145) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 16;
			KI = MAP_OF_ORDELLES_CAVES;
		elseif (option == 327681) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 32;
			KI = MAP_OF_GHELSBA;
		elseif (option == 393217) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 64;
			KI = MAP_OF_DAVOI;
		elseif (option == 458753) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 128;
			KI = MAP_OF_CARPENTERS_LANDING;
		elseif (option == 524289) then
			price = 200;
			MadePurchase = true;
			mapVar = mapVar + 256;
			KI = MAP_OF_THE_ZERUHN_MINES;
		elseif (option == 589825) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 512;
			KI = MAP_OF_THE_PALBOROUGH_MINES;
		elseif (option == 655361) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 1024;
			KI = MAP_OF_BEADEAUX;
		elseif (option == 720897) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 2048;
			KI = MAP_OF_GIDDEUS;
		elseif (option == 786433) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 4096;
			KI = MAP_OF_CASTLE_OZTROJA;
		elseif (option == 851969) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 8192;
			KI = MAP_OF_THE_MAZE_OF_SHAKHRAMI;
		elseif (option == 917505) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 16384;
			KI = MAP_OF_THE_LITELOR_REGION;
		elseif (option == 983041) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 32768;
			KI = MAP_OF_BIBIKI_BAY;
		elseif (option == 1048577) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 65536;
			KI = MAP_OF_QUFIM_ISLAND;
		elseif (option == 1114113) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 131072;
			KI = MAP_OF_THE_ELDIEME_NECROPOLIS;
		elseif (option == 1179649) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 262144;
			KI = MAP_OF_THE_GARLAIGE_CITADEL;
		elseif (option == 1245185) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 524288;
			KI = MAP_OF_THE_ELSHIMO_REGIONS;
		elseif (option == 1310721) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 1048576;
			KI = MAP_OF_THE_NORTHLANDS_AREA;
		elseif (option == 1376257) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 2097152;
			KI = MAP_OF_KING_RANPERRES_TOMB;
		elseif (option == 1441793) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 4194304;
			KI = MAP_OF_THE_DANGRUF_WADI;
		elseif (option == 1507329) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 8388608;
			KI = MAP_OF_THE_HORUTOTO_RUINS;
		elseif (option == 1572865) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 16777216;
			KI = MAP_OF_BOSTAUNIEUX_OUBLIETTE;
		elseif (option == 1638401) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 33554432;
			KI = MAP_OF_THE_TORAIMARAI_CANAL;
		elseif (option == 1703937) then
			price = 600;
			MadePurchase = true;
			mapVar = mapVar + 67108864;
			KI = MAP_OF_THE_GUSGEN_MINES;
		elseif (option == 1769473) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 134217728;
			KI = MAP_OF_THE_CRAWLERS_NEST;
		elseif (option == 1835009) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 268435456;
			KI = MAP_OF_THE_RANGUEMONT_PASS;
		elseif (option == 1900545) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 536870912;
			KI = MAP_OF_DELKFUTTS_TOWER;
		elseif (option == 1966081) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 1073741824;
			KI = MAP_OF_FEIYIN;
		elseif (option == 2031617) then
			price = 3000;
			MadePurchase = true;
			mapVar = mapVar + 2147483648;
			KI = MAP_OF_CASTLE_ZVAHL;
			--player:PrintToPlayer( string.format( " mapVar: '%u' ", mapVar ) ); 
			-- Why is this one STILL showing on list??
			-- Exceeded max value size in Darkstar??
			--player:PrintToPlayer( string.format( " Price:'%u'(Castle Zvahl) ", price ) );
		end
	  
	  player:PrintToPlayer( string.format( " Player has '%u' gil.", player:getGil() ) );
	  
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
	  printf("RESULT: %u",option);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
end;


