-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Nio A
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
    mob:addMod(MOD_STUNRES, 50);
    mob:addMod(MOD_DMGMAGIC, 80);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 5
        and GetMobByID(NIO_A):isDead() and GetMobByID(NIO_HUM):isDead()
    ) then
        player:setVar("Mission8-2Kills", 1);
    end
end;
