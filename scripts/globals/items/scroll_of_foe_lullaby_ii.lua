-----------------------------------------
--    ID: 5079
--    Scroll of Foe Lullaby II
--    Teaches the song Foe Lullaby II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(471);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(471);
end;