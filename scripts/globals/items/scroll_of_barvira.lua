-----------------------------------------
--    ID: 4700
--    Scroll of Barvira
--    Teaches the white magic Barvira
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(92);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(92);
end;