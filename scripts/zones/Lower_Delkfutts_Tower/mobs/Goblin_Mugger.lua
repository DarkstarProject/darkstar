-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Goblin Mugger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,777,2);
end;