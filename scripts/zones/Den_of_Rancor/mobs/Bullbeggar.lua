-----------------------------------
-- Area: Den of Rancor
--  MOB: Bullbeggar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,803,2);
end;