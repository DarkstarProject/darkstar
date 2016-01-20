-----------------------------------------
--    ID: 4771
--    Scroll of Stone V
--    Teaches the black magic Stone V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(163);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(163);
end;