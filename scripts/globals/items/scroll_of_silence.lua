-----------------------------------------
--    ID: 4667
--    Scroll of Silence
--    Teaches the white magic Silence
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(59);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(59);
end;