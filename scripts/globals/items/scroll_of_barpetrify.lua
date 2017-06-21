-----------------------------------------
--    ID: 4685
--    Scroll of Barpetrify
--    Teaches the white magic Barpetrify
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(77);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(77);
end;