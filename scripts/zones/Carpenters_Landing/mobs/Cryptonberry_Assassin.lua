-----------------------------------
-- Area: Carpenters' Landing
--  MOB: Cryptonberry_Assassin
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

    local mobID = mob:getID();

    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("Cryptonberry_Executor_KILL")~= 2) then
        switch (mobID) : caseof
        {
            [16785711] = function (x)
                if (player:getVar("Cryptonberry_Assassins-1_KILL") == 0) then
                    player:setVar("Cryptonberry_Assassins-1_KILL",1);
                end
            end,
            [16785712] = function (x)
                if (player:getVar("Cryptonberry_Assassins-2_KILL") == 0) then
                    player:setVar("Cryptonberry_Assassins-2_KILL",1);
                end
            end,
            [16785713] = function (x)
                if (player:getVar("Cryptonberry_Assassins-3_KILL") == 0) then
                    player:setVar("Cryptonberry_Assassins-3_KILL",1);
                end
            end,
        }
    end
end;