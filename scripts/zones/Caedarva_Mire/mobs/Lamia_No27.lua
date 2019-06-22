-----------------------------------
-- Area: Caedarva Mire
--   NM: Lamia No 27
-- Note: Spawned during quest: "Not Meant to Be"
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.NOT_MEANT_TO_BE) == QUEST_ACCEPTED and player:getVar("notmeanttobeCS") == 3 and player:getVar("notmeanttobeLamia27Killed") < 1 then
        player:setVar("notmeanttobeLamia27Killed", 1)
    end
end