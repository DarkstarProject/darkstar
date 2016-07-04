-----------------------------------
-- Area: Outer Horutoto
--  MOB: Four of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,663,2);
end;