-----------------------------------------
--    ID: 4714
--    Scroll of Phalanx
--    Teaches the white magic Phalanx
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(106);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(106);
end;