-----------------------------------------
--    ID: 5092
--    Scroll of Gain-MND
--    Teaches the white magic Gain-MND
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(491);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(491);
end;