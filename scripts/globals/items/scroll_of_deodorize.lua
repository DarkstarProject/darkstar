-----------------------------------------
--    ID: 4746
--    Scroll of Deodorize
--    Teaches the white magic Deodorize
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(138);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(138);
end;