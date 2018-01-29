-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
--  MOB: Ashu Talif Crew
-----------------------------------
require("scripts/globals/status");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    local allies = mob:getInstance():getAllies();
    for i,v in pairs(allies) do
        if (v:isAlive()) then
            v:setLocalVar("ready",1);
        end
    end

    local mobs = mob:getInstance():getMobs();
    for i,v in pairs(mobs) do
        if(v:isAlive()) then
            v:setLocalVar("ready",1);
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;
