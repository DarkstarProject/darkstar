-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Scavenger Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,621,1);
end;
