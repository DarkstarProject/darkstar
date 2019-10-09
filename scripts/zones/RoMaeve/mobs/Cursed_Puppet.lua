-----------------------------------
-- Area: RoMaeve
--  Mob: Cursed Puppet
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 121, 1, dsp.regime.type.FIELDS)
end;
