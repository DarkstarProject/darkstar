-----------------------------------------
--    ID: 4680
--    Scroll of Barsleep
--    Teaches the white magic Barsleep
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(72);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(72);
end;