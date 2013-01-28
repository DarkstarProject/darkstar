-----------------------------------------
-- ID: 15838
-- Item: Protect Earring
-- Item Effect: Protect
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

    local effect = target:getStatusEffect(EFFECT_PROTECT);
    local power = 15;

    if(effect ~= nil and effect:getPower() > power) then
        target:messageBasic(423);
    else
        -- add effect
        target:delStatusEffect(EFFECT_PROTECT);
        target:addStatusEffect(EFFECT_PROTECT, power, 0, 1800);
    end
end;