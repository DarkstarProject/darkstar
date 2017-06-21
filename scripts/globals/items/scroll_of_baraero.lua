-----------------------------------------
--    ID: 4670
--    Scroll of Baraero
--    Teaches the white magic Baraero
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(62);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(62);
end;