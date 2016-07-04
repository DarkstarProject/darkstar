-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Bark Spider
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,719,2);
end;