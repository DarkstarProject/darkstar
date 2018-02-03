-----------------------------------
-- Area: Al'Taieu
--  MOB: Ru_aern
-----------------------------------
require("scripts/zones/AlTaieu/MobIDs");
require("scripts/globals/missions");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 2) then
        local aernKills =
        {
            [AERNS_TOWER_SOUTH + 0] = "Ru_aern_1-1KILL",
            [AERNS_TOWER_SOUTH + 1] = "Ru_aern_1-2KILL",
            [AERNS_TOWER_SOUTH + 2] = "Ru_aern_1-3KILL",
            [AERNS_TOWER_WEST  + 0] = "Ru_aern_2-1KILL",
            [AERNS_TOWER_WEST  + 1] = "Ru_aern_2-2KILL",
            [AERNS_TOWER_WEST  + 2] = "Ru_aern_2-3KILL",
            [AERNS_TOWER_EAST  + 0] = "Ru_aern_3-1KILL",
            [AERNS_TOWER_EAST  + 1] = "Ru_aern_3-2KILL",
            [AERNS_TOWER_EAST  + 2] = "Ru_aern_3-3KILL",
        }

        local varToSet = aernKills[mob:getID()];

        if (varToSet ~= nil) then
            player:setVar(varToSet, 1);
        end

        if (player:getVar("Ru_aern_1-1KILL") == 1 and player:getVar("Ru_aern_1-2KILL") == 1 and player:getVar("Ru_aern_1-3KILL") == 1) then
            player:setVar("[SEA][AlTieu]SouthTower",1);
            clearTowerVars(player, 1);
        end

        if (player:getVar("Ru_aern_2-1KILL") == 1 and player:getVar("Ru_aern_2-2KILL") == 1 and player:getVar("Ru_aern_2-3KILL") == 1) then
            player:setVar("[SEA][AlTieu]WestTower",1);
            clearTowerVars(player, 2);
        end

        if (player:getVar("Ru_aern_3-1KILL") == 1 and player:getVar("Ru_aern_3-2KILL") == 1 and player:getVar("Ru_aern_3-3KILL") == 1) then
            player:setVar("[SEA][AlTieu]EastTower",1);
            clearTowerVars(player, 3);
        end
    end
end;

function clearTowerVars (player, towerNum)
    player:setVar("Ru_aern_"..towerNum.."-1KILL",0);
    player:setVar("Ru_aern_"..towerNum.."-2KILL",0);
    player:setVar("Ru_aern_"..towerNum.."-3KILL",0);
end
