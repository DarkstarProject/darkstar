-----------------------------------------
--    ID: 4768
--    Scroll of Stone II
--    Teaches the black magic Stone II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(160);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(160);
end;