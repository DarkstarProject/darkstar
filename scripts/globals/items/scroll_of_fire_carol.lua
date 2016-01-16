-----------------------------------------
--    ID: 5046
--    Scroll of Fire Carol
--    Teaches the song Fire Carol
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(438);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(438);
end;