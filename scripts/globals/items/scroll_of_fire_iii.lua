-----------------------------------------
--    ID: 4754
--    Scroll of Fire III
--    Teaches the black magic Fire III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(146);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(146);
end;