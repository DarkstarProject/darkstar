-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Thug
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,647,2);
end;