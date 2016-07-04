-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Siege Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,704,1);
end;