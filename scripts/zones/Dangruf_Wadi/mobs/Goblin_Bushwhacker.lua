-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Bushwhacker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,1);
    checkGoVregime(player,mob,645,3);
end;