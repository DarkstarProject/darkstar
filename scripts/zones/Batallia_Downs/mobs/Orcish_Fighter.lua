-----------------------------------
-- Area: Batallia Downs
--  Mob: Orcish Fighter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 74, 3, dsp.regime.type.FIELDS)
end;
