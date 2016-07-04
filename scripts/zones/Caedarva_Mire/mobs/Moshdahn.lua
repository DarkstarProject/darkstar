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

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE) == QUEST_ACCEPTED and player:getVar("notmeanttobeCS") == 3 and player:getVar("notmeanttobeMoshdahnKilled") < 1) then
        player:setVar("notmeanttobeMoshdahnKilled",1);
    end

end;
