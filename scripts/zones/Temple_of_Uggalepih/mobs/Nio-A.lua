-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Nio A
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
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
    mob:addMod(MOD_STUNRES, 50);
    mob:addMod(MOD_DMGMAGIC, 80);
    mob:setLocalVar("2HOUR_HPP", math.random(35,60));
end;

function onMobFight(mob,target)
    if (mob:getLocalVar("2HOUR_USED") == 0 and mob:getHPP() <= mob:getLocalVar("2HOUR_HPP")) then
        mob:setLocalVar("2HOUR_USED", 1);
        mob:useMobAbility(jobSpec.MIGHTY_STRIKES);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("2HOUR_USED", 0);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 5
        and GetMobByID(NIO_A):isDead() and GetMobByID(NIO_HUM):isDead()) then
        player:setVar("Mission8-2Kills", 1);
    end
end;
