-----------------------------------------
-- ID: 15170
-- Item: wing gorget
-- Item Effect: gives regain
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

    if (target:hasStatusEffect(EFFECT_REGAIN)) then
        target:messageBasic(423);
    else
        -- delete old
        target:delStatusEffect(EFFECT_REGAIN);
        target:addStatusEffect(EFFECT_REGAIN, 5, 3, 30);
    end
end;