-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fortalice Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,710,1);
end;