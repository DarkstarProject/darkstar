-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Boyahda Sapling
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,725,1);
end;