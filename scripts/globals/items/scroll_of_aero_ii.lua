-----------------------------------------
--    ID: 4763
--    Scroll of Aero II
--    Teaches the black magic Aero II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(155);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(155);
end;