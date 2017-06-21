-----------------------------------------
--    ID: 4741
--    Scroll of Shellra IV
--    Teaches the white magic Shellra IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(133);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(133);
end;