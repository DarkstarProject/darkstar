-----------------------------------
-- NPC:  Treasure Casket
-----------------------------------
require("scripts/globals/caskets")
-----------------------------------

function onTrigger(player, npc)
    dsp.caskets.onTrigger(player, npc)
end

function onTrade(player, npc, trade)
    dsp.caskets.onTrade(player, npc, trade)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.caskets.onEventFinish(player, csid, option)
end