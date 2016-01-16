-----------------------------------------
--    ID: 4664
--    Scroll of Slow
--    Teaches the white magic Slow
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(56);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(56);
end;