-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Bloodsucker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,620,2);
end;
