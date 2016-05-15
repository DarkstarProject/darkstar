-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Weaver
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,648,2);
end;