-----------------------------------------
--    ID: 4697
--    Scroll of Barblindra
--    Teaches the white magic Barblindra
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(89);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(89);
end;