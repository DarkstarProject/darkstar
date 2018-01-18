-----------------------------------
-- Area: Davoi
--  MOB: Davoi Mush
-- Note: PH for Blubbery Bulge
-----------------------------------
require("scripts/zones/Davoi/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,BLUBBERY_BULGE_PH,20,3600); -- 1 hour
end;
