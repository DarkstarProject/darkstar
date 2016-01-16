-----------------------------------------
--    ID: 4708
--    Scroll of Enfire
--    Teaches the white magic Enfire
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(100);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(100);
end;