-----------------------------------
-- Area: Bastok Markets
--  NPC: Reet
-- Adventurer's Assistant
-- !pos -237 -12 -41 235
-------------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1 and trade:hasItemQty(536,1) == true) then
        player:startEvent(6);
    end
end;

function onTrigger(player,npc)
    player:startEvent(5);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 6) then
        player:tradeComplete();
        player:addGil(GIL_RATE*50);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
    end
end;
