-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Strange Apparatus
-- !pos 255 0 19 200
-----------------------------------
require("scripts/globals/strangeapparatus")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.strangeApparatus.onTrade(player, trade, 22)
end

function onTrigger(player,npc)
    dsp.strangeApparatus.onTrigger(player, 20)
end

function onEventUpdate(player,csid,option)
    if csid == 20 then
        dsp.strangeApparatus.onEventUpdate(player, option)
    end
end

function onEventFinish(player,csid,option)
    if csid == 22 then
        dsp.strangeApparatus.onEventFinish(player)
    end
end
