-----------------------------------------
--    ID: 4724
--    Scroll of Enaero II
--    Teaches the white magic Enaero II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(314);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(314);
end;