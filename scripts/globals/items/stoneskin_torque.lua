-----------------------------------------
-- ID: 15170
-- Item: Stoneskin Torque
-- Item Effect: Stoneskin
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (target:addStatusEffect(EFFECT_STONESKIN, 104, 0, 300)) then
        target:messageBasic(205,EFFECT_STONESKIN);
    else
        target:messageBasic(423); -- no effect
    end
end;
