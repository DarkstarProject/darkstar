-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Roiloux, R.K.
-- Type: Campaign Arbiter
-- !pos 70.493 -0.602 -9.185 82
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Jugner_Forest_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(450);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

