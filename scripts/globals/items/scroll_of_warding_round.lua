-----------------------------------------
--    ID: 5022
--    Scroll of Warding Round
--    Teaches the song Warding Round
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(414);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(414);
end;