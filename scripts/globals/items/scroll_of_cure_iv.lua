-----------------------------------------
--    ID: 4612
--    Scroll of Cure IV
--    Teaches the white magic Cure IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(4);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(4);
end;