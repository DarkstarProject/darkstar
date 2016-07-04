-----------------------------------
-- Area: Outer Horutoto
--  MOB: Six of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,665,2);
end;