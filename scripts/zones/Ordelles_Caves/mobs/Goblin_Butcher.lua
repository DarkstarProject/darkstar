-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,657,1);
end;