-----------------------------------------
-- ID: 15170
-- Item: Stoneskin torque
-- Item Effect: gives sleep
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

    if (hasSleepEffects(target)) then
        target:messageBasic(423);
    else
        target:addStatusEffect(EFFECT_SLEEP_I, 0, 0, 30);
    end
end;