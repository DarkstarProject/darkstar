-----------------------------------
-- Area: Xarcabard
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.regime.bookOnTrigger(player, dsp.regime.type.FIELDS)
end

function onEventUpdate(player, csid, option)
    dsp.regime.bookOnEventUpdate(player, option, dsp.regime.type.FIELDS)
end

function onEventFinish(player, csid, option)
    dsp.regime.bookOnEventFinish(player, option, dsp.regime.type.FIELDS)
end