-----------------------------------------
--    ID: 5048
--    Scroll of Wind Carol
--    Teaches the song Wind Carol
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(440);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(440);
end;