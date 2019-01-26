-----------------------------------------
-- ID: 15320
-- Powder Boots
--  Enchantment: "Flee"
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:delStatusEffect(dsp.effect.FLEE)
    target:addStatusEffect(dsp.effect.FLEE,100,0,30)
end
