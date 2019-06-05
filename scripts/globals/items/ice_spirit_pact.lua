-----------------------------------------
-- ID: 4897
-- Ice Spirit Pact
-- Teaches the summoning magic ice Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(289)
end

function onItemUse(target)
    target:addSpell(289)
end
