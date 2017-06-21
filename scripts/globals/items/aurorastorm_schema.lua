-----------------------------------------
--    ID: 6055
--    Item: Aurorastorm Schema
--    Teaches the white magic Aurorastorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(119);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(119);
end;