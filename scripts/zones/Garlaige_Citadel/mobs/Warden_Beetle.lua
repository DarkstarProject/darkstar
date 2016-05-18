-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Warden Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,710,2);
end;