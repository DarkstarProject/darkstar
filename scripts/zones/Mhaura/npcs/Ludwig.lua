-----------------------------------
-- Area: Mhaura
-- NPC: Ludwig
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local mapVar = 0;
	if player:hasKeyItem(MAP_OF_THE_SAN_DORIA_AREA) then
		mapVar = mapVar + 4;
	end
	if player:hasKeyItem(MAP_OF_THE_BASTOK_AREA) then
		mapVar = mapVar + 8;
	end
	if player:hasKeyItem(MAP_OF_THE_WINDURST_AREA) then
		mapVar = mapVar + 16;
	end
	if player:hasKeyItem(MAP_OF_THE_JEUNO_AREA) then
		mapVar = mapVar + 32;
	end
	if player:hasKeyItem(MAP_OF_THE_LITELOR_REGION) then
		mapVar = mapVar + 64;
	end
	if player:hasKeyItem(MAP_OF_BIBIKI_BAY) then
		mapVar = mapVar + 128;
	end
    player:startEvent(0x01f4, mapVar);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x01f4 and option ~= 1073741824) then
        local gil = 0;
        if option == MAP_OF_THE_SAN_DORIA_AREA then
            gil = 200;
        elseif option == MAP_OF_THE_BASTOK_AREA then
            gil = 200;
        elseif option == MAP_OF_THE_WINDURST_AREA then
            gil = 200;
        elseif option == MAP_OF_THE_JEUNO_AREA then
            gil = 600;
        elseif option == MAP_OF_THE_LITELOR_REGION then
            gil = 3000;
        elseif option == MAP_OF_BIBIKI_BAY then
            gil = 3000;
        end
        if (gil > 0 and player:delGil(gil)) then
            player:addKeyItem(option);
            player:messageSpecial(KEYITEM_OBTAINED,option); 
        else
            player:messageSpecial(NOT_HAVE_ENOUGH_GIL);
        end
    end
end;




