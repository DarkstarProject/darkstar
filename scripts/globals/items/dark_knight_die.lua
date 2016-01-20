-----------------------------------------
--    ID: 5477
--    Warrior Die
--    Teaches the job ability Fighter's Roll
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnAbility(89);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addLearnedAbility(89);
end;