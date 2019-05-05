-----------------------------------------
-- ID: 4
-- Item: Mahogany Bed
-----------------------------------------
require("scripts/globals/common");
require("scripts/globals/quests");
-----------------------------------------

function onFurniturePlaced(player)
    if player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC) == QUEST_AVAILABLE then
        player:setVar("[MS2]NextTally", getConquestTally())
    end
end

function onFurnitureRemoved(player)
    player:setVar("[MS2]NextTally", 0)
end