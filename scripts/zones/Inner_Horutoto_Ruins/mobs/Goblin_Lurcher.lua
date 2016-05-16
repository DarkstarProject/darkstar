-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Lurcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,654,1);
end;