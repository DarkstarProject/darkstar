-----------------------------------------
--    ID: 4854
--    Scroll of Drain II
--    Teaches the black magic Drain II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(246);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(246);
end;