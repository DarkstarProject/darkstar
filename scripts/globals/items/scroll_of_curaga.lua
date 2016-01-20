-----------------------------------------
--    ID: 4615
--    Scroll of Curaga
--    Teaches the white magic Curaga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(7);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(7);
end;