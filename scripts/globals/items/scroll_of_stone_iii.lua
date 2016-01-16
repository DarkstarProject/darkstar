-----------------------------------------
--    ID: 4769
--    Scroll of Stone III
--    Teaches the black magic Stone III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(161);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(161);
end;