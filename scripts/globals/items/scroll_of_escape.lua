-----------------------------------------
--    ID: 4871
--    Scroll of Escape
--    Teaches the black magic Escape
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(263);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(263);
end;