-----------------------------------------
--    ID: 4674
--    Scroll of Barfira
--    Teaches the white magic Barfira
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(66);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(66);
end;