-----------------------------------------
-- ID: 5
-- Item: Bronze Bed
-----------------------------------------
require("scripts/globals/common");
require("scripts/globals/quests");
-----------------------------------------

function onFurniturePlaced(player)
    if player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK) == QUEST_AVAILABLE then
        player:setVar("[MS1]NextTally", getConquestTally())
    end
end

function onFurnitureRemoved(player)
    player:setVar("[MS1]NextTally", 0)
end