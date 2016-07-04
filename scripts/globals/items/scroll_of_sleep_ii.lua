-----------------------------------------
--    ID: 4867
--    Scroll of Sleep II
--    Teaches the black magic Sleep II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(259);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(259);
end;