-----------------------------------------
--    ID: 5018
--    Scroll of Puppets Operetta
--    Teaches the song Puppets Operetta
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(410);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(410);
end;