-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Hell Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,618,1);
end;
