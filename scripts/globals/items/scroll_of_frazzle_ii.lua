-----------------------------------------
-- ID: 4915
-- Scroll of Frazzle II
-- Teaches the black magic Frazzle II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(844)
end

function onItemUse(target)
    target:addSpell(844)
end
