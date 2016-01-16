-----------------------------------------
--    ID: 4651
--    Scroll of Protect
--    Teaches the white magic Protect
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(43);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(43);
end;