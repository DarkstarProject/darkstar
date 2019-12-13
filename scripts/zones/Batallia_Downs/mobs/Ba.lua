-----------------------------------
-- Area: Batallia Downs
--  Mob: Ba
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 15, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 73, 2, dsp.regime.type.FIELDS)
end;
