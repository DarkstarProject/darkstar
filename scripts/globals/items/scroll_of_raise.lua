-----------------------------------------
--    ID: 4620
--    Scroll of Raise
--    Teaches the white magic Raise
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(12);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(12);
end;