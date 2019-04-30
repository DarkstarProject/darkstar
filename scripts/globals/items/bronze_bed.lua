-----------------------------------------
-- ID: 5
-- Item: Bronze Bed
-----------------------------------------

function onFurniturePlaced(player)
    if player:getQuestStatus(OTHER_AREAS_LOG,GIVE_A_MOOGLE_A_BREAK) == QUEST_AVAILABLE then
        player:setVar("MogSafe1Time", os.time())
    end
end

function onFurnitureRemoved(player)
    player:setVar("MogSafe1Time", 0)
end