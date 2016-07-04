-----------------------------------------
--    ID: 4807
--    Scroll of Waterga
--    Teaches the black magic Waterga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(199);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(199);
end;