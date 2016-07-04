-----------------------------------------
--    ID: 4641
--    Scroll of Diaga
--    Teaches the white magic Diaga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(33);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(33);
end;