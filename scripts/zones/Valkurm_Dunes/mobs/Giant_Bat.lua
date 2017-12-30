-----------------------------------
-- Area: Valkurm Dunes (103)
--  Mob: Giant_Bat
--  PH for Golden Bat
-----------------------------------
require("scripts/zones/Valkurm_Dunes/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,GOLDEN_BAT_PH,5,math.random(3600,18000)); -- 1 to 5 hours
end;
