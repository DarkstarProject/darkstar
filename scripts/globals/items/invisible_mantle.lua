-----------------------------------------
-- ID: 15170
-- Item: Stoneskin torque
-- Item Effect: gives invisible
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

    if (target:hasStatusEffect(EFFECT_INVISIBLE)) then
        target:messageBasic(423);
    else
        -- delete old
        target:delStatusEffect(EFFECT_INVISIBLE);
        target:addStatusEffect(EFFECT_INVISIBLE, 0, 10, 180* SNEAK_INVIS_DURATION_MULTIPLIER);
    end
end;