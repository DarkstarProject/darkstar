-----------------------------------------
--    ID: 4783
--    Scroll of Firaga II
--    Teaches the black magic Firaga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(175);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(175);
end;