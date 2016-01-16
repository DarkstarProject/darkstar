-----------------------------------------
--    ID: 5093
--    Scroll of Gain-CHR
--    Teaches the white magic Gain-CHR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(492);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(492);
end;