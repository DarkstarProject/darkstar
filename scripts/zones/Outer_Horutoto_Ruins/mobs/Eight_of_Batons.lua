-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,667,2);
end;