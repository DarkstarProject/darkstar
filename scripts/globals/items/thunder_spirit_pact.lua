-----------------------------------------
-- ID: 4900
-- Thunder Spirit Pact
-- Teaches the summoning magic Thunder Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(292)
end

function onItemUse(target)
    target:addSpell(292)
end
