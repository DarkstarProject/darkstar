-----------------------------------------
--    ID: 5041
--    Scroll of Vital Etude
--    Teaches the song Vital Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(433);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(433);
end;