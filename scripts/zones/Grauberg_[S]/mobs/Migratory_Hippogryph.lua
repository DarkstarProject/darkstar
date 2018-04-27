-----------------------------------
-- Area: Grauberg[S]
--   NM: Migratory_Hippogryph
-- Note: Spawned for quest "The Unfinished Waltz"
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_EXP_BONUS, -100);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1") == 3) then
        player:setVar("QuestStatus_DNC_AF1", 4);
    end
end;
