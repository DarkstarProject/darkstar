-----------------------------------------
--  ID: 15320
--  Powder Boots
--  Enchantment: "Flee"
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:delStatusEffect(EFFECT_SNEAK);
    target:addStatusEffect(EFFECT_SNEAK,1,0,180);
end;
