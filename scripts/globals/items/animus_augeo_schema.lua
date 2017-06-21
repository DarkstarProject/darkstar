-----------------------------------------
--    ID: 6059
--    Item: Animus Augeo Schema
--    Teaches the white magic Animus Augeo
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(308);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(308);
end;