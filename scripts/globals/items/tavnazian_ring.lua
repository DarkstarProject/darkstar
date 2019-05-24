-----------------------------------------
-- ID: 14672
-- Tavnazian Ring
-- Enchantment: "Teleport-Tavnazia"
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:setPos(0, -23.5, 29.15, 63, 26)
end
