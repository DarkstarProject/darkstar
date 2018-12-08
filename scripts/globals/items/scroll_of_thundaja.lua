-----------------------------------------
-- ID: 4894
-- Scroll of Thundaj
-- Teaches the black magic Thundaj
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(500)
end

function onItemUse(target)
    target:addSpell(500)
end
