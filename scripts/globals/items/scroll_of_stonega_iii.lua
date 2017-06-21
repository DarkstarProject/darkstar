-----------------------------------------
--    ID: 4799
--    Scroll of Stonega III
--    Teaches the black magic Stonega III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(191);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(191);
end;