-----------------------------------------
-- ID: 4825
-- Scroll of Gravity II
-- Teaches the black magic Gravity II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(217)
end

function onItemUse(target)
    target:addSpell(217)
end
