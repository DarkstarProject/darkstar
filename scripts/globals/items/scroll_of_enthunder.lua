-----------------------------------------
--    ID: 4712
--    Scroll of Enthunder
--    Teaches the white magic Enthunder
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(104);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(104);
end;