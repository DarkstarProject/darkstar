-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.regime.bookOnTrigger(player, dsp.regime.type.GROUNDS)
end

function onEventUpdate(player, csid, option)
    dsp.regime.bookOnEventUpdate(player, option, dsp.regime.type.GROUNDS)
end

function onEventFinish(player, csid, option)
    dsp.regime.bookOnEventFinish(player, option, dsp.regime.type.GROUNDS)
end