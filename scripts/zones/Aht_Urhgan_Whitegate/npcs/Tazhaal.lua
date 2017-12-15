-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Tazhaal
-- Admits players to the dock in Aht Urhgan
-- !pos -5.195 -1 -98.966 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(221,player:getGil(),100);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 221 and option == 333) then
        player:delGil(100);
    end

end;