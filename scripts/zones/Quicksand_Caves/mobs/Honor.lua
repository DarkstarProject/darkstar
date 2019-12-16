-----------------------------------
-- Area: Quicksand Caves
--  Mob: Honor
-- Coming of Age (San dOria Mission 8-1)
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
    mob:addMod(dsp.mod.SLEEPRES, 50);
    mob:addMod(dsp.mod.LULLABYRES, 50);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.COMING_OF_AGE and player:getCharVar("MissionStatus") == 2) then
        player:setCharVar("MissionStatus",3);
    end
end;
