-----------------------------------
-- Area: RoMaeve
--  Mob: Ominous Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 119, 2, dsp.regime.type.FIELDS)
end;
