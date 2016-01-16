-----------------------------------------
--    ID: 4773
--    Scroll of Thunder II
--    Teaches the black magic Thunder II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(165);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(165);
end;