-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Goobbue Parasite
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 116, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 117, 2, dsp.regime.type.FIELDS)
end
