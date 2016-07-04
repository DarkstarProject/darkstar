-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,667,3);
end;