-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Demonic Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 705, 1, dsp.regime.type.GROUNDS)
end;