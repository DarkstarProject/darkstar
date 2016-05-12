-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Boulder Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,770,1);
end;