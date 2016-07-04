-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Starborer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,622,1);
end;
