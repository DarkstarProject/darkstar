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

function onMobDeath(mob, killer, ally)
    if (ally:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and ally:getVar("Cryptonberry_Executor_KILL") == 0) then
        ally:setVar("Cryptonberry_Executor_KILL",1);
    end
end;
