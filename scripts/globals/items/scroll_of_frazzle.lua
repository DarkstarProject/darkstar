-----------------------------------------
-- ID: 4914
-- Scroll of Frazzle
-- Teaches the black magic Frazzle
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(843)
end

function onItemUse(target)
    target:addSpell(843)
end
