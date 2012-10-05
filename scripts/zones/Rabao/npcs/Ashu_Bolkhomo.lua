-----------------------------------
-- Area: Rabao
-- NPC: Ashu Bolkhomo
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Rabao/TextIDs");

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
	if player:hasKeyItem(MAP_OF_THE_KUZOTZ_REGION) then
		mapVar = mapVar + 4;
	end
	if player:hasKeyItem(MAP_OF_THE_VOLLBOW_REGION) then
		mapVar = mapVar + 8;
	end
	if player:hasKeyItem(MAP_OF_THE_KORROLOKA_TUNNEL) then
		mapVar = mapVar + 16;
	end
    player:startEvent(0x03ee, mapVar);
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
    if (csid == 0x03ee and option ~= 1073741824) then
        local gil = 0;
        if option == MAP_OF_THE_KUZOTZ_REGION then
            gil = 3000;
        elseif option == MAP_OF_THE_VOLLBOW_REGION then
            gil = 3000;
        elseif option == MAP_OF_THE_KORROLOKA_TUNNEL then
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




