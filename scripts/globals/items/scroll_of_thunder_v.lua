
-----------------------------------------
-- ID: 4776
-- Scroll of thunder v
-- Teaches the black magic thunder v
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(168)
end

function onItemUse(target)
    target:addSpell(168)
end
