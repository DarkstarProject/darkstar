-----------------------------------------
-- ID: 4913
-- Scroll of Distract
-- Teaches the black magic Distract II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(842)
end

function onItemUse(target)
    target:addSpell(842)
end
