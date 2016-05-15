-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Fallen Knight
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,619,1);
end;
