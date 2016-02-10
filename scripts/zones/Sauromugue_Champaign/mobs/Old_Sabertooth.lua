-----------------------------------
-- Area: Sauromuge Champaign
-- NPC:  Old Sabertooth
-- Involved in Quest: The Fanged One
-- @pos 676 -10 -366 120
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    local players = mob:getZone():getPlayers();
    
    for i, player in pairs(players) do

        --check to see if the player has accepted this quest.
        if (player:getQuestStatus(WINDURST,THE_FANGED_ONE) == QUEST_ACCEPTED) then

        --check to see if the player's x,y,z coordinates are near enough to the cave where the RNG quest mob dies.
        --point 1: 690, -15, -338
        --point 2: 654, -9, -383
        --these are outside the playable space but used to form a box around the cave where this quest takes place
            local playerX = player:getXPos();
            --local playerY = player:getYPos(); we shouldn't really care about the y axis for this
            local playerZ = player:getZPos();

            if (playerX < 690 and playerX > 654 and
                playerZ < -338 and playerZ > -383) then

                player:setVar("TheFangedOneCS", 2);
            end;
        end;
    end;
end;
