-----------------------------------
-- Area: Kuftal Tunnel (173)
--  Mob: Phantom Worm
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(PHANTOM_WORM_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
