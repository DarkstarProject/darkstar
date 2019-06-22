-----------------------------------------
-- ID: 4898
-- Air Spirit Pact
-- Teaches the summoning magic Air Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(290)
end

function onItemUse(target)
    target:addSpell(290)
end
