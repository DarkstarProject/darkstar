-----------------------------------------
--    ID: 4629
--    Scroll of Holy
--    Teaches the white magic Holy
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(21);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(21);
end;