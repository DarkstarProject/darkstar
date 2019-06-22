-----------------------------------------
-- ID: 4824
-- Scroll of Gravity
-- Teaches the black magic Gravity
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(216)
end

function onItemUse(target)
    target:addSpell(216)
end
