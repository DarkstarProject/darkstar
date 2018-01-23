-----------------------------------
-- Area: West Ronfaure
--  MOB: Marauder Dvogzog
-----------------------------------
require("scripts/globals/fieldsofvalor");
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR, 1);
end;

function onMobSpawn(mob)
    mob:setLocalVar("2HOUR_HPP", math.random(35,60));
end;

function onMobFight(mob, target)
    if (mob:getLocalVar("2HOUR_USED") == 0 and mob:getHPP() <= mob:getLocalVar("2HOUR_HPP")) then
        mob:setLocalVar("2HOUR_USED", 1);
        mob:useMobAbility(jobSpec.HUNDRED_FISTS);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("2HOUR_USED", 0);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == PRESTIGE_OF_THE_PAPSQUE and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission7-1MobKilled",1);
        player:needToZone(true);
    end
    checkRegime(player,mob,4,1);
end;
