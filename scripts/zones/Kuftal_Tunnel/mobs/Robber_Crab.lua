-----------------------------------
-- Area: Kuftal Tunnel
-- Mob: Robber Crab
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/settings");
-----------------------------------

function onMobInitialize(mob)
    if (mob:getID() == CANCER + 1) then
        mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
    end
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,735,1);
    checkGoVregime(player,mob,736,1);
    checkGoVregime(player,mob,738,1);
end;

function onMobDespawn(mob)
    if (mob:getID() == CANCER + 1) then
        GetNPCByID(CANCER_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;
