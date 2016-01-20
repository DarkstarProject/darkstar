-----------------------------------------
--    ID: 4804
--    Scroll of Thundaga III
--    Teaches the black magic Thundaga III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(196);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(196);
end;