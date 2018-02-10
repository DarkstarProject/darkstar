-----------------------------------
-- Area: RoMaeve
--  MOB: Mokkurkalfi
-----------------------------------
require("scripts/zones/RoMaeve/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/settings");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission7-1MobKilled",1);
    end
end;

function onMobDespawn(mob)
    if (GetMobByID(MOKKURKALFI_I):isDead() and GetMobByID(MOKKURKALFI_II):isDead()) then
        GetNPCByID(BASTOK_7_1_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;
