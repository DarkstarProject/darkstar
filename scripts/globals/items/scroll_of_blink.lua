-----------------------------------------
--    ID: 4661
--    Scroll of Blink
--    Teaches the white magic Blink
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(53);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(53);
end;