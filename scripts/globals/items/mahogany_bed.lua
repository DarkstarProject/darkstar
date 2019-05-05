-----------------------------------------
-- ID: 4
-- Item: Mahogany Bed
-----------------------------------------
require("scripts/globals/common");
require("scripts/globals/quests");
-----------------------------------------

function onFurniturePlaced(player)
    if player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC) == QUEST_AVAILABLE and
       player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK) == QUEST_COMPLETED then
            player:setVar("[MS2]NextTally", getConquestTally())
    end
end

function onFurnitureRemoved(player)
    player:setVar("[MS2]NextTally", 0)
end