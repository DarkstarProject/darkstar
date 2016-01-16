-----------------------------------------
--    ID: 4733
--    Scroll of Protectra
--    Teaches the white magic Protectra
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(125);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(125);
end;