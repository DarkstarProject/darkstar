-----------------------------------
-- Area: Grauberg[S]
--  MOB: Migratory_Hippogryph
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function OnMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==3) then
        player:setVar("QuestStatus_DNC_AF1", 4);
    end
end;