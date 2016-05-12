-----------------------------------
-- Area: Outer Horutoto
--  MOB: Six of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,665,3);
end;