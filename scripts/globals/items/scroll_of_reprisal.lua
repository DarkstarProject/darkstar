-----------------------------------------
--    ID: 4715
--    Scroll of Reprisal
--    Teaches the white magic Reprisal
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(97);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(97);
end;