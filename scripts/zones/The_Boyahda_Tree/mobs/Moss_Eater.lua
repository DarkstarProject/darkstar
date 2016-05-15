-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Moss Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,721,2);
end;