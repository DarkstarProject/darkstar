-----------------------------------------
-- ID: 4901
-- Water Spirit Pact
-- Teaches the summoning magic Water Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(293)
end

function onItemUse(target)
    target:addSpell(293)
end
