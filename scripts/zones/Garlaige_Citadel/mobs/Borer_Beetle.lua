-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Borer Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,704,2);
end;