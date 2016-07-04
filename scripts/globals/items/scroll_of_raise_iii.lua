-----------------------------------------
--    ID: 4748
--    Scroll of Raise II
--    Teaches the white magic Raise III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(140);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(140);
end;