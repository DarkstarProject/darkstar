-----------------------------------
-- Area: Sauromuge Champaign
--  Mob: Old Sabertooth
-- Involved in Quest: The Fanged One
-- !pos 676 -10 -366 120
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
    if player == nil then
        local players = mob:getZone():getPlayers()

        for i, person in pairs(players) do -- can't use the variable name "player" because it's already being used
            if person:getQuestStatus(WINDURST, dsp.quest.id.windurst.THE_FANGED_ONE) == QUEST_ACCEPTED and person:checkDistance(mob) < 32 then
                person:setVar("TheFangedOneCS", 2)
            end
        end
    end
end
