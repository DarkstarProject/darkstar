-----------------------------------------
--    ID: 4653
--    Scroll of Protect III
--    Teaches the white magic Protect III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(45);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(45);
end;