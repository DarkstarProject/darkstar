-----------------------------------------
--    ID: 4798
--    Scroll of Stonega II
--    Teaches the black magic Stonega II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(190);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(190);
end;