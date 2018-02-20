-----------------------------------
-- Area: Port Windurst
--  NPC: Jack of Clubs
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
        player:startEvent(10008,GIL_RATE*50);
        player:addGil(GIL_RATE*50);
        player:tradeComplete();
    end
end;

function onTrigger(player,npc)
    player:startEvent(10007,0,3);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
