-----------------------------------------
-- ID: 4899
-- Earth Spirit Pact
-- Teaches the summoning magic Earth Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(291)
end

function onItemUse(target)
    target:addSpell(291)
end
