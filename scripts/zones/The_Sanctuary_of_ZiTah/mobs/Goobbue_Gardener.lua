-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Goobbue Gardener
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 114, 2, dsp.regime.type.FIELDS)
end;
