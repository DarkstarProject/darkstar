-----------------------------------------
--    ID: 5054
--    Scroll of Fire Carol II
--    Teaches the song Fire Carol II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(446);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(446);
end;