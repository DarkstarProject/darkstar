-----------------------------------------
--    ID: 4743
--    Scroll of Reraise
--    Teaches the white magic Reraise
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(135);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(135);
end;