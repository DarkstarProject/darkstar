-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Corrupted Yorgos
-----------------------------------
require("scripts/zones/King_Ranperres_Tomb/MobIDs");
require("scripts/globals/missions");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
end;

function onMobDeath(mob, player, isKiller)
    if (GetMobByID(CORRUPTED_YORGOS):isDead() and GetMobByID(CORRUPTED_SOFFEIL):isDead() and GetMobByID(CORRUPTED_ULBRIG):isDead()
        and player:getCurrentMission(SANDORIA) == RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission6-2MobKilled",1);
    end
end;
