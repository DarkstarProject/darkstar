-----------------------------------
-- Area: Outer Horutoto
--  MOB: Four of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,663,3);
end;