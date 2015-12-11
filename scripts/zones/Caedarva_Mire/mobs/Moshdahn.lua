-----------------------------------
-- Area: Caedarva Mire
--  MOB: Moshdahn
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)

    if (player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE) == QUEST_ACCEPTED and ally:getVar("notmeanttobeCS") == 3 and ally:getVar("notmeanttobeMoshdahnKilled") < 1) then
        ally:setVar("notmeanttobeMoshdahnKilled",1);
    end

end;
