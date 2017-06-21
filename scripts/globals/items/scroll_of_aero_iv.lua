-----------------------------------------
--    ID: 4765
--    Scroll of Aero IV
--    Teaches the black magic Aero IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(157);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(157);
end;