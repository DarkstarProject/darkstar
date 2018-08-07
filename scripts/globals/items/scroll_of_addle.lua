-----------------------------------------
-- ID: Unknown
-- Scroll of Addle
-- Teaches the magic Addle
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(286)
end

function onItemUse(target)
    target:addSpell(286)
end
