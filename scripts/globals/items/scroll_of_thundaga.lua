-----------------------------------------
--    ID: 4802
--    Scroll of Thundaga
--    Teaches the black magic Thundaga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(194);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(194);
end;