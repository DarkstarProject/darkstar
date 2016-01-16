-----------------------------------------
--    ID: 4616
--    Scroll of Curaga II
--    Teaches the white magic Curaga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(8);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(8);
end;