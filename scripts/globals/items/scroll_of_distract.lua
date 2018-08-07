-----------------------------------------
-- ID: 4912
-- Scroll of Distract
-- Teaches the black magic Distract
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(841)
end

function onItemUse(target)
    target:addSpell(841)
end
