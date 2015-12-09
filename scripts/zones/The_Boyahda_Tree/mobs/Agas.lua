-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Agas
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer, ally)
    if (ally:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS) == QUEST_ACCEPTED and not ally:hasKeyItem(MOONDROP)) then
        printf("Agas successfully killed!");
        ally:setVar("Searching_AgasKilled", 1);
    end
end;