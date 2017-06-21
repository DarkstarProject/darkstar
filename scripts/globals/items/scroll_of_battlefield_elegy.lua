-----------------------------------------
--    ID: 5029 
--    Scroll of Battlefield Elegy
--    Teaches the song Battlefield Elegy
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(421);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(421);
end;