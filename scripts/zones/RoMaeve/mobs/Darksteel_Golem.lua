-----------------------------------
-- Area: RoMaeve
--  Mob: Darksteel Golem
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 122, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 123, 2, dsp.regime.type.FIELDS)
end;
