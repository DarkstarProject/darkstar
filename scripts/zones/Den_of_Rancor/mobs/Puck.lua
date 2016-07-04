-----------------------------------
-- Area: Den of Rancor
--  MOB: Puck
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,802,2);
end;