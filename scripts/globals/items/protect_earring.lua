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
    if (target:addStatusEffect(EFFECT_PROTECT, 15, 0, 1800)) then
        target:messageBasic(205,EFFECT_PROTECT);
    else
        target:messageBasic(423); -- no effect
    end
end;
