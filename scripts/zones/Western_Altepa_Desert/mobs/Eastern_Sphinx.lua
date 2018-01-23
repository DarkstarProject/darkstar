-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Eastern Sphinx
-----------------------------------
require("scripts/globals/missions");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
end;

function onMobDeath(mob, player, isKiller)
    if (GetMobByID(EASTERN_SPHINX):isDead() and GetMobByID(WESTERN_SPHINX):isDead() and
        player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 2) then
        player:setVar("Mission6-1MobKilled",1);
    end
end;
