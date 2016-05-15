-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Death Cap
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,719,1);
end;