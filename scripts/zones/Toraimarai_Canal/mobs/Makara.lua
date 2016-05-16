-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Makara
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,618,2);
end;
