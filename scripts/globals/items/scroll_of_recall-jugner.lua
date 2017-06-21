-----------------------------------------
--    ID: 4687
--    Scroll of Recall-Jugner
--    Teaches the white magic Recall-Jugner
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(81);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(81);
end;