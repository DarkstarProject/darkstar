-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Miuseloir B Enchelles
-- @zone 80
-- !pos 120 0 104
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
------------------------------------
function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(154);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;