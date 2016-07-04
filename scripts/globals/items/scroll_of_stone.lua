-----------------------------------------
--    ID: 4607,4767
--    Scroll of Stone
--    Teaches the black magic Stone
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(159);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(159);
end;