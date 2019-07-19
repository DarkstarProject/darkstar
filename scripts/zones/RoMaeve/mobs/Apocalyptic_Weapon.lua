-----------------------------------
-- Area: RoMaeve
--  Mob: Apocalyptic Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 122, 1, dsp.regime.type.FIELDS)
end;
