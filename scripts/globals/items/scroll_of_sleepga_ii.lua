-----------------------------------------
--    ID: 4882
--    Scroll of Sleepga II
--    Teaches the black magic Sleepga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(274);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:delSpell(364);
    target:addSpell(274);
end;