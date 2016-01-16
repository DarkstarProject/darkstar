-----------------------------------------
--    ID: 5014
--    Scroll of Herb Pastoral
--    Teaches the song Herb Pastoral
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(406);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(406);
end;