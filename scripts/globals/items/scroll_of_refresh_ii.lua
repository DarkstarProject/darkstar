-----------------------------------------
--    ID: 4850
--    Scroll of Refresh II
--    Teaches the white magic Refresh II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(473);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(473);
end;