-----------------------------------
-- Area: Grauberg[S]
--  MOB: Migratory_Hippogryph
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and ally:getVar("QuestStatus_DNC_AF1")==3) then
        ally:setVar("QuestStatus_DNC_AF1", 4);
    end
end;