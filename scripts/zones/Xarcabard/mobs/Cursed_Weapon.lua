-----------------------------------
-- Area: Xarcabard
--  MOB: Cursed Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 52, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 53, 3, dsp.regime.type.FIELDS)
end
