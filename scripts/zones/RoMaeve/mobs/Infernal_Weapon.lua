-----------------------------------
-- Area: RoMaeve
--  Mob: Infernal Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 123, 1, dsp.regime.type.FIELDS)
end;
