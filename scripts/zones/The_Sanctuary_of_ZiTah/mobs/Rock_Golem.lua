-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Rock Golem
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 118, 1, dsp.regime.type.FIELDS)
end
