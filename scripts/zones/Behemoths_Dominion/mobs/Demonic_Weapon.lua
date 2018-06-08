-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Demonic Weapon
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,102,2);
end;
