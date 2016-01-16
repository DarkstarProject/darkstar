-----------------------------------------
--    ID: 4652
--    Scroll of Protect II
--    Teaches the white magic Protect II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(44);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(44);
end;