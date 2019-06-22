-----------------------------------
-- Area: Caedarva Mire
--   NM: Moshdahn
-- Note: Spawned during quest: "Not Meant to Be"
-----------------------------------
mixins = {require("scripts/mixins/families/qutrub")}
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.NOT_MEANT_TO_BE) == QUEST_ACCEPTED and player:getVar("notmeanttobeCS") == 3 and player:getVar("notmeanttobeMoshdahnKilled") < 1 then
        player:setVar("notmeanttobeMoshdahnKilled", 1)
    end
end