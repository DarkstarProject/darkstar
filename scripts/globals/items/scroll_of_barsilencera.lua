-----------------------------------------
--    ID: 4698
--    Scroll of Barsilencera
--    Teaches the white magic Barsilencera
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(90);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(90);
end;