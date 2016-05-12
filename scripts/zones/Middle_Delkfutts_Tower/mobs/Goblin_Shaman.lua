-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Goblin Shaman
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,782,1);
    checkGoVregime(player,mob,784,1);
end;