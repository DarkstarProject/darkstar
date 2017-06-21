-----------------------------------------
--    ID: 4621
--    Scroll of Raise II
--    Teaches the white magic Raise II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(13);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(13);
end;