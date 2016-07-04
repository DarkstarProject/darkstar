-----------------------------------------
--    ID: 5089
--    Scroll of Gain-VIT
--    Teaches the white magic Gain-VIT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(488);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(488);
end;