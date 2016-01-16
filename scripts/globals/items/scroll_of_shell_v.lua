-----------------------------------------
--    ID: 4660
--    Scroll of Shell V
--    Teaches the white magic Shell V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(52);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(52);
end;