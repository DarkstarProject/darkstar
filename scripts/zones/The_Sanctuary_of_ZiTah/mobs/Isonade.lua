-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Isonade
-- Involved in Quest: The Sacred Katana
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer, ally)

    if (ally:getQuestStatus(OUTLANDS,THE_SACRED_KATANA) == QUEST_ACCEPTED) then
        ally:setVar("IsonadeKilled",1);
    end

end;