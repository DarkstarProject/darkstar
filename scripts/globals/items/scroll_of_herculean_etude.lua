-----------------------------------------
--    ID: 5039
--    Scroll of Herculean Etude
--    Teaches the song Herculean Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(431);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(431);
end;