-----------------------------------------
--    ID: 4739
--    Scroll of Shellra II
--    Teaches the white magic Shellra II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(131);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(131);
end;