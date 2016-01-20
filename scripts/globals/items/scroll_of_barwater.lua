-----------------------------------------
--    ID: 4673
--    Scroll of Barwater
--    Teaches the white magic Barwater
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(65);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(65);
end;