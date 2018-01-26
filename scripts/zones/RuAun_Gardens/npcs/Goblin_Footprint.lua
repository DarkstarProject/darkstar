-----------------------------------
-- Area: Ru'Avitau Gate
--  NPC: Goblin Footprint
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(0);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;