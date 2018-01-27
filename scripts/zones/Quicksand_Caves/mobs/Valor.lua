-----------------------------------
-- Area: Quicksand Caves
--  MOB: Valor
-- Coming of Age (San dOria Mission 8-1)
-----------------------------------
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR, 1);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
    mob:setLocalVar("2HOUR_HPP", math.random(35,60));
end;

function onMobFight(mob,target)
    if (mob:getLocalVar("2HOUR_USED") == 0 and mob:getHPP() <= mob:getLocalVar("2HOUR_HPP")) then
        mob:setLocalVar("2HOUR_USED", 1);
        mob:useMobAbility(jobSpec.HUNDRED_FISTS);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("2HOUR_USED", 0);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 2
        and GetMobByID(VALOR):isDead() and GetMobByID(HONOR):isDead()) then
        player:setVar("MissionStatus",3);
    end
end;
