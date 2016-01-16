-----------------------------------------
--    ID: 4666
--    Scroll of Paralyze
--    Teaches the white magic Paralyze
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(58);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(58);
end;