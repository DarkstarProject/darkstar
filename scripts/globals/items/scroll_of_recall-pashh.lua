-----------------------------------------
--    ID: 4688
--    Scroll of Recall-Pashh
--    Teaches the white magic Recall-Pashh
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(82);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(82);
end;