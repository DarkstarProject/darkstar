-----------------------------------------
--    ID: 4792
--    Scroll of Aeroga
--    Teaches the black magic Aeroga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(184);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(184);
end;