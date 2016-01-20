-----------------------------------------
--    ID: 4684
--    Scroll of Barsilence
--    Teaches the white magic Barsilence
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(76);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(76);
end;