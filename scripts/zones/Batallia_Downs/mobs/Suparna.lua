-----------------------------------
-- Area: Batallia Downs
--  MOB: Suparna
-- Involved in Mission: San d'Orian 9-1
-----------------------------------
require("scripts/zones/Batallia_Downs/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR, 1);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
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
    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 3
        and GetMobByID(SUPARNA):isDead() and GetMobByID(SUPARNA_FLEDGLING):isDead()) then
        player:setVar("Mission9-1Kills", 1);
    end
end
