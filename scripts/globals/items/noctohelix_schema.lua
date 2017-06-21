-----------------------------------------
--    ID: 6048
--    Noctohelix Schema
--    Teaches the black magic Noctohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(284);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(284);
end;