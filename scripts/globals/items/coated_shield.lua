-----------------------------------------
-- ID: 15838
-- Item: Coated Shield
-- Item Effect: Shell
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

    local power = 24;

    if (target:addStatusEffect(EFFECT_SHELL, power, 0, 1800)) then
        target:messageBasic(205);
    else
        target:messageBasic(423); -- no effect
    end
end;