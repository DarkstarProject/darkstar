-----------------------------------
-- Area: Windurst Waters
--  NPC: Jack of Hearts
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
        player:startEvent(10012,GIL_RATE*50);
        player:addGil(GIL_RATE*50);
        player:tradeComplete();
    end
end;

function onTrigger(player,npc)
    player:startEvent(10011,0,1);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;



