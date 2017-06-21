-----------------------------------------
--    ID: 4646
--    Scroll of Banishga
--    Teaches the white magic Banishga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(38);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(38);
end;