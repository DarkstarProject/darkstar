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

function onMobDeath(mob, player, isKiller)

    if (killer == nil) then
    
        local players = mob:getZone():getPlayers();
        for i, player in pairs(players) do

            if (player:getQuestStatus(WINDURST,THE_FANGED_ONE) == QUEST_ACCEPTED) then

            local playerDistance = player:checkDistance(mob);
                if (playerDistance < 32) then

                    player:setVar("TheFangedOneCS", 2);
                end;
            end;
        end;
    end;
end;
