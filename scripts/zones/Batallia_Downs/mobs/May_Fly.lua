-----------------------------------
-- Area: Batallia Downs
--  Mob: May Fly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 15, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 72, 2, dsp.regime.type.FIELDS)
end;
