-----------------------------------------
--    ID: 4838
--    Scroll of Bio
--    Teaches the black magic Bio
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(230);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(230);
end;