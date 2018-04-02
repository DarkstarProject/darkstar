-----------------------------------------
-- ID: 15320
-- Powder Boots
--  Enchantment: "Flee"
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:delStatusEffect(dsp.effects.FLEE);
    target:addStatusEffect(dsp.effects.FLEE,100,0,30);
end;
