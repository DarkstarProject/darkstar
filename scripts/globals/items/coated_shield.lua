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

    local effect = target:getStatusEffect(EFFECT_SHELL);
    local power = -24;

    if(effect ~= nil and effect:getPower() > power) then
        target:messageBasic(423);
    else
        -- add effect
        target:delStatusEffect(EFFECT_SHELL);
        target:addStatusEffect(EFFECT_SHELL, power, 0, 1800);
    end
end;