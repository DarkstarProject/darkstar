-----------------------------------------
--    ID: 4797
--    Scroll of Stonega
--    Teaches the black magic Stonega
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(189);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(189);
end;