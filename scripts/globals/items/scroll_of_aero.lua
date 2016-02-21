-----------------------------------------
--    ID: 4762
--    Scroll of Aero
--    Teaches the black magic Aero
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(154);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(154);
end;