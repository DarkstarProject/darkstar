-----------------------------------------
--    ID: 4720
--    Scroll of Flash
--    Teaches the white magic Flash
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(112);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(112);
end;