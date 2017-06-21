-----------------------------------------
--    ID: 4734
--    Scroll of Protectra II
--    Teaches the white magic Protectra II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(126);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(126);
end;