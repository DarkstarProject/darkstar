-----------------------------------------
--    ID: 4834
--    Scroll of Poisonga II
--    Teaches the black magic Poisonga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(226);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(226);
end;