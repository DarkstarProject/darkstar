-----------------------------------------
--    ID: 5023
--    Scroll of Goblin Gavotte
--    Teaches the song Goblin Gavotte
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(415);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(415);
end;