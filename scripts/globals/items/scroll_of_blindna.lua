-----------------------------------------
--    ID: 4624
--    Scroll of Blindna
--    Teaches the white magic Blindna
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(16);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(16);
end;