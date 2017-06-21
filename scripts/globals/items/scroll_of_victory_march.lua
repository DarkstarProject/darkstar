-----------------------------------------
--    ID: 5028
--    Scroll of Victory March
--    Teaches the song Victory March
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(420);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(420);
end;