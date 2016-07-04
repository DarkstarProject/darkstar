-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,720,2);
end;