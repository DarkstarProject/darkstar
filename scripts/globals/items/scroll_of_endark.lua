-----------------------------------------
--    ID: 4707
--    Scroll of Endark
--    Teaches the white magic Endark
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(311);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(311);
end;