-----------------------------------------
-- ID: 5
-- Item: Bronze Bed
-----------------------------------------

function onFurniturePlaced(player)
    player:setVar("MogSafe1Time", os.time())
end

function onFurnitureRemoved(player)
    player:setVar("MogSafe1Time", 0)
end