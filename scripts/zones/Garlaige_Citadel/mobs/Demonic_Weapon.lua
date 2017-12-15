-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Demonic Weapon
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,705,1);
end;