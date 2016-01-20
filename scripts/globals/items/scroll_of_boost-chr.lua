-----------------------------------------
--    ID: 5100
--    Scroll of Boost-CHR
--    Teaches the white magic Boost-CHR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(485);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(485);
end;