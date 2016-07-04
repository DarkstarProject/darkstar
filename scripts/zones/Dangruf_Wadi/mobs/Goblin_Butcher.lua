-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,1);
end;
