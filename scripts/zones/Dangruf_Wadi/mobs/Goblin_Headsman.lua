-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Headsman
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,1);
    checkGoVregime(player,mob,643,2);
end;