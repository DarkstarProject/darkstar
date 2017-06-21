-----------------------------------------
--    ID: 4618
--    Scroll of Curaga IV
--    Teaches the white magic Curaga IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(10);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(10);
end;