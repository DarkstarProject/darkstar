-----------------------------------
-- Area:
--  MOB: Armored_Chariot
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    
    player:addTitle(dsp.title.SUN_CHARIOTEER);
end;

function onMobDespawn(mob)
--[[    local instance = mob:getInstance()
    if (instance:getStage() == 8 and instance:getProgress() == 0) then
        instance:setProgress(10)
    end]]
end;