-----------------------------------------
-- ID: 15170
-- Item: regen cuirass
-- Item Effect: gives regen
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

    if (target:hasStatusEffect(EFFECT_REGEN)) then
        target:messageBasic(423);
    else
        -- delete old
        target:delStatusEffect(EFFECT_REGEN);
        target:addStatusEffect(EFFECT_REGEN, 15, 3, 180);
    end
end;