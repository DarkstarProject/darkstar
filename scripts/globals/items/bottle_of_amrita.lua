-----------------------------------------
-- ID: 4513
-- Item: Amrita
-- Item Effect: Restores 500 HP and MP over 300 seconds.
-----------------------------------------

require("scripts/globals/status");

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
    local worked = 0;
    if (target:hasStatusEffect(EFFECT_REGEN) == false) then
        target:addStatusEffect(EFFECT_REGEN,5,3,300);
        worked = worked + 1;
    end
    if (target:hasStatusEffect(EFFECT_REFRESH) == false) then
        target:addStatusEffect(EFFECT_REFRESH,5,3,300);
        worked = worked + 1;
    end
    if (worked == 0) then
        target:messageBasic(423);
    end
end;

