-----------------------------------------
-- ID: 4896
-- Fire Spirit Pact
-- Teaches the summoning magicFire Spirit
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(288)
end

function onItemUse(target)
    target:addSpell(288)
end
