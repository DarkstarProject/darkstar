-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Demonic Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 102, 2, dsp.regime.type.FIELDS)
end;
