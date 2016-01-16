-----------------------------------------
--    ID: 4872
--    Scroll of Tractor
--    Teaches the black magic Tractor
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(264);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(264);
end;