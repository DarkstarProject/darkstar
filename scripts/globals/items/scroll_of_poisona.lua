-----------------------------------------
--    ID: 4622
--    Scroll of Poisona
--    Teaches the white magic Poisona
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(14);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(14);
end;