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
function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS) == QUEST_ACCEPTED and not player:hasKeyItem(MOONDROP)) then
        printf("Agas successfully killed!");
        player:setVar("Searching_AgasKilled", 1);
    end
end;