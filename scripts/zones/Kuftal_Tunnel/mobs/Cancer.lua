-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Cancer
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(CANCER_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
