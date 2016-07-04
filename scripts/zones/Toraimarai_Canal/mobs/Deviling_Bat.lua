-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Deviling Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,622,2);
end;
