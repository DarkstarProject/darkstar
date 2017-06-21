-----------------------------------------
--    ID: 4814
--    Scroll of Freeze
--    Teaches the black magic Freeze
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(206);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(206);
end;