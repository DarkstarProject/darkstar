-----------------------------------------
--    ID: 4740
--    Scroll of Shellra III
--    Teaches the white magic Shellra III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(132);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(132);
end;