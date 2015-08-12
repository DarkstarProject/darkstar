-----------------------------------------
-- ID: 15170
-- Item: Stoneskin torque
-- Item Effect: gives refresh
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

    if (target:hasStatusEffect(EFFECT_REFRESH)) then
        target:messageBasic(423);
    else
        -- delete old
        target:delStatusEffect(EFFECT_REFRESH);
        target:addStatusEffect(EFFECT_REFRESH, 4, 3, 180);
    end
end;