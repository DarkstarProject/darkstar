-----------------------------------------
-- ID: 4903
-- Dark Spirit Pact
-- Teaches the summoning magic Dark Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(295)
end

function onItemUse(target)
    target:addSpell(295)
end
