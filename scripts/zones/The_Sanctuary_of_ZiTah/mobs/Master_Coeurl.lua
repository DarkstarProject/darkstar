-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Master Coeurl
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 117, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 118, 2, dsp.regime.type.FIELDS)
end
