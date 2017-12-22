-----------------------------------
-- Area: Palborough Mines
--  Mob: Veteran Quadav
-- Note: PH for Zi'Ghi Boneeater
-----------------------------------
require("scripts/zones/Palborough_Mines/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ZI_GHI_BONEEATER_PH,20,3600); -- 1 hour
end;
