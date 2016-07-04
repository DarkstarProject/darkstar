-----------------------------------------
--    ID: 4736
--    Scroll of Protectra IV
--    Teaches the white magic Protectra IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(128);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(128);
end;