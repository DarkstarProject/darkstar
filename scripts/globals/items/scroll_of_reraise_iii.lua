-----------------------------------------
--    ID: 4750
--    Scroll of Reraise III
--    Teaches the white magic Reraise III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(142);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(142);
end;