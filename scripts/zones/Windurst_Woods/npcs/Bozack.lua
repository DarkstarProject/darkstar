-----------------------------------
-- Area: Windurst Woods
--   NPC: Bozack
-- Type: Event Replayer
-- !pos 92.591 -5.58 -31.529 241
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:startEvent(612)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
