-----------------------------------------
--    ID: 6061
--    Item: Adloquium Schema
--    Teaches the white magic Adloquium
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(495);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(495);
end;