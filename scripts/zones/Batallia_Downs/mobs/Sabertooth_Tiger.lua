-----------------------------------
-- Area: Batallia Downs
--  Mob: Sabertooth Tiger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 74, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 75, 1, dsp.regime.type.FIELDS)
end;
