
-----------------------------------------
-- ID: 4891
-- Scroll of blizzaja
-- Teaches the black magic blizzaja
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(497)
end

function onItemUse(target)
    target:addSpell(497)
end
