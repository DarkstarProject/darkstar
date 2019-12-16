-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Ogrefly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 114, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 115, 2, dsp.regime.type.FIELDS)
end
