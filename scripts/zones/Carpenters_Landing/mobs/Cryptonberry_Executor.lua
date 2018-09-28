-----------------------------------
-- Area: Carpenters' Landing
--  MOB: Cryptonberry_Executor
-----------------------------------

function onMobSpawn(mob)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("Cryptonberry_Executor_KILL") == 0) then
        player:setVar("Cryptonberry_Executor_KILL",1);
    end
end;
