-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Ice Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 750, 1, dsp.regime.type.GROUNDS)
end;