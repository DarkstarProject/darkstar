-----------------------------------
-- Area: Al'Taieu
-- NPC:  Ru_aern
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    if (killer:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and killer:getVar("PromathiaStatus") == 2) then


        switch (mob:getID()) : caseof {
            -- South Tower
            [16912829] = function (x)
            killer:setVar("Ru_aern_1-1KILL",1);
            end,
            [16912830] = function (x)
            killer:setVar("Ru_aern_1-2KILL",1);

            end,
            [16912831] = function (x)
            killer:setVar("Ru_aern_1-3KILL",1);
            end,

            -- West Tower
            [16912832] = function (x)
            killer:setVar("Ru_aern_2-1KILL",1);
            end,
            [16912833] = function (x)
            killer:setVar("Ru_aern_2-2KILL",1);
            end,
            [16912834] = function (x)
            killer:setVar("Ru_aern_2-3KILL",1);
            end,


            -- East Tower
            [16912835] = function (x)
             killer:setVar("Ru_aern_3-1KILL",1);
            end,
            [16912836] = function (x)
             killer:setVar("Ru_aern_3-2KILL",1);
            end,
            [16912837] = function (x)
            killer:setVar("Ru_aern_3-3KILL",1);
            end,
        }


        if (killer:getVar("Ru_aern_1-1KILL") == 1 and killer:getVar("Ru_aern_1-2KILL") == 1 and killer:getVar("Ru_aern_1-3KILL") == 1) then
            killer:setVar("[SEA][AlTieu]SouthTower",1);
            clearTowerVars(killer, 1);
        end
        if (killer:getVar("Ru_aern_2-1KILL") == 1 and killer:getVar("Ru_aern_2-2KILL") == 1 and killer:getVar("Ru_aern_2-3KILL") == 1) then
            killer:setVar("[SEA][AlTieu]WestTower",1);
            clearTowerVars(killer, 2);
        end
        if (killer:getVar("Ru_aern_3-1KILL") == 1 and killer:getVar("Ru_aern_3-2KILL") == 1 and killer:getVar("Ru_aern_3-3KILL") == 1) then
            killer:setVar("[SEA][AlTieu]EastTower",1);
            clearTowerVars(killer, 3);
        end
    end
end;

function clearTowerVars (player, towerNum)
    player:setVar("Ru_aern_"..towerNum.."-1KILL",0);
    player:setVar("Ru_aern_"..towerNum.."-2KILL",0);
    player:setVar("Ru_aern_"..towerNum.."-3KILL",0);
end
