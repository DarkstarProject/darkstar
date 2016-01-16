-----------------------------------------
--    ID: 4709
--    Scroll of Enblizzard
--    Teaches the white magic Enblizzard
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(101);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(101);
end;