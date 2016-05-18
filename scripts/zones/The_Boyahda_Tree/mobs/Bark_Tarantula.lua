-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Bark Tarantula
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,725,2);
end;