-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
--  MOB: Amnaf Psycheflayer
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Nyzul_Isle/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    local allies = mob:getInstance():getAllies();
    for i,v in pairs(allies) do
        v:setLocalVar("ready",1);
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 2);
end;
