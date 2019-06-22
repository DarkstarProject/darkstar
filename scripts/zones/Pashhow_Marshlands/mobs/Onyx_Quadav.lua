-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Onyx Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 60, 1, dsp.regime.type.FIELDS)
end
