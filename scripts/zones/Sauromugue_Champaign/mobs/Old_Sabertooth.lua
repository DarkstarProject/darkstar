-----------------------------------
-- Area: Sauromuge Champaign
-- NPC:  Old Sabertooth
-- Involved in Quest: The Fanged One
-- !pos 676 -10 -366 120
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

    if (player == nil) then

        local players = mob:getZone():getPlayers();
        for i, person in pairs(players) do -- can't use the variable name "player" because it's already being used

            if (person:getQuestStatus(WINDURST,THE_FANGED_ONE) == QUEST_ACCEPTED) then

            local playerDistance = person:checkDistance(mob);
                if (playerDistance < 32) then

                    person:setVar("TheFangedOneCS", 2);
                end;
            end;
        end;
    end;
end;
