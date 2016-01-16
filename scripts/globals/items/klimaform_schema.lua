-----------------------------------------
--    ID: 6058
--    Klimaform Schema
--    Teaches the black magic Klimaform
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(287);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(287);
end;