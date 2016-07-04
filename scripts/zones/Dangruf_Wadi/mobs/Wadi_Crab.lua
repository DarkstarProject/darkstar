-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,2);
end;
