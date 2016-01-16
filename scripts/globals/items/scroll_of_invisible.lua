-----------------------------------------
--    ID: 4744
--    Scroll of Invisible
--    Teaches the white magic Invisible
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(136);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(136);
end;