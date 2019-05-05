-----------------------------------------
-- ID: 6
-- Item: Noble's Bed
-----------------------------------------
require("scripts/globals/common");
require("scripts/globals/quests");
-----------------------------------------

function onFurniturePlaced(player)
    if player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.MOOGLES_IN_THE_WILD) == QUEST_AVAILABLE and
       player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC) == QUEST_COMPLETED then
            player:setVar("[MS3]NextTally", getConquestTally())
    end
end

function onFurnitureRemoved(player)
    player:setVar("[MS3]NextTally", 0)
end