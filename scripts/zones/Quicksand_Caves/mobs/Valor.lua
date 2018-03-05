-----------------------------------
-- Area: Quicksand Caves
--  MOB: Valor
-- Coming of Age (San dOria Mission 8-1)
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 2
        and GetMobByID(VALOR):isDead() and GetMobByID(HONOR):isDead()
    ) then
        player:setVar("MissionStatus",3);
    end
end;
