-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Demonic Rose
-- Note: Placeholder V. Vivian
-----------------------------------
require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,VOLUPTUOUS_VIVIAN_PH,10,math.random(57600,86400)); -- 16 to 24 hours
end;
