-----------------------------------------
--    ID: 4654
--    Scroll of Protect IV
--    Teaches the white magic Protect IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(46);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(46);
end;