-----------------------------------
-- Area: GM Home
--  NPC: Janken
-- Plays "Rock,Paper, Scissors"
-----------------------------------
package.loaded["scripts/zones/GM_Home/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/GM_Home/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(139);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;