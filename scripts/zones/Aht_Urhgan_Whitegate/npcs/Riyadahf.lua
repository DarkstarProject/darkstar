-----------------------------------
-- Area: Aht'Urhgan Whitegate
-- NPC: Riyadahf
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

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
	if (player:hasKeyItem(MAP_OF_AL_ZAHBI)) then
		mapVar = mapVar + 4;
	end
	if (player:hasKeyItem(MAP_OF_NASHMAU)) then
        mapVar = mapVar + 8;
	end
	if (player:hasKeyItem(MAP_OF_WAJAOM_WOODLANDS)) then
        mapVar = mapVar + 16;
	end
	if (player:hasKeyItem(MAP_OF_BHAFLAU_THICKETS)) then
        mapVar = mapVar + 32;
	end
    player:startEvent(0x0233, mapVar);
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
    if (csid == 0x0233 and option ~= 1073741824) then
        local gil = 0;
        if option == MAP_OF_AL_ZAHBI then
            gil = 600;
        elseif option == MAP_OF_NASHMAU then
            gil = 3000;
        elseif option == MAP_OF_WAJAOM_WOODLANDS then
            gil = 3000;
        elseif option == MAP_OF_BHAFLAU_THICKETS then
            gil = 3000;
        end
        if (gil > 0 and player:delGil(gil)) then
            player:addKeyItem(option);
            player:messageSpecial(KEYITEM_OBTAINED,option); 
        else
            player:messageSpecial(220); -- ???
        end
    end
end;




