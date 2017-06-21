-----------------------------------------
--    ID: 4856
--    Scroll of Aspir II
--    Teaches the black magic Aspir II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(248);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(248);
end;