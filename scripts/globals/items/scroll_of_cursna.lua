-----------------------------------------
--    ID: 4628
--    Scroll of Cursna
--    Teaches the white magic Cursna
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(20);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(20);
end;