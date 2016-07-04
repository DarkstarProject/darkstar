-----------------------------------
-- Area: Outer Horutoto
--  MOB: Five of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,664,2);
end;