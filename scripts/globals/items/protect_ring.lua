-----------------------------------------
-- ID: 15838
-- Item: Protect Ring
-- Item Effect: Protect II
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

    local power = 40;

    if (target:addStatusEffect(EFFECT_PROTECT, power, 0, 1800)) then
        target:messageBasic(205);
    else
        target:messageBasic(423); -- no effect
    end
end;