-----------------------------------
-- Area: Carpenters' Landing
--  MOB: Cryptonberry_Executor
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
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
    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("Cryptonberry_Executor_KILL") == 0) then
        player:setVar("Cryptonberry_Executor_KILL",1);
    end
end;
