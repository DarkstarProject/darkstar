-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Wyrmfly
-- Involved in Eco Warrior (Windurst)
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.POISON)
end

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(WINDURST, dsp.quest.id.windurst.ECO_WARRIOR) ~= QUEST_AVAILABLE and player:getCharVar("ECO_WARRIOR_ACTIVE") == 238 and player:hasStatusEffect(dsp.effect.LEVEL_RESTRICTION) then
        local allFliesDead = true
        for i = ID.mob.WYRMFLY_OFFSET, ID.mob.WYRMFLY_OFFSET + 2 do
            if i ~= mob:getID() and GetMobByID(i):isAlive() then
                allFliesDead = false
            end
        end
        if allFliesDead then
            player:setCharVar("ECOR_WAR_WIN-NMs_killed", 1)
        end
    end
end