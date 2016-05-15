-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Ancient Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,659,1);
end;