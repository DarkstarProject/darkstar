-----------------------------------------
-- ID: 15320
-- Powder Boots
--  Enchantment: "Flee"
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:delStatusEffect(EFFECT.FLEE);
    target:addStatusEffect(EFFECT.FLEE,100,0,30);
end;
