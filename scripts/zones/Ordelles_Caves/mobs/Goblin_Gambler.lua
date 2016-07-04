-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goblin Gambler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,657,1);
end;