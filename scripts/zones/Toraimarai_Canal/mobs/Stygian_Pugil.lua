-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Stygian Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,621,2);
end;
