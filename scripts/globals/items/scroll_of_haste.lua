-----------------------------------------
--    ID: 4665
--    Scroll of Haste
--    Teaches the white magic Haste
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(57);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(57);
end;