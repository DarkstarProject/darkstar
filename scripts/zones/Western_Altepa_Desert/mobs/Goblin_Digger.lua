-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Goblin Digger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 137, 1, dsp.regime.type.FIELDS)
end
