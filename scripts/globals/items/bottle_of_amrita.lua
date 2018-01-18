-----------------------------------------
-- ID: 4513
-- Item: Amrita
-- Item Effect: Restores 500 HP and MP over 300 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local worked = false;
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        target:addStatusEffect(EFFECT_REGEN,5,3,300);
        worked = true;
    end
    if (not target:hasStatusEffect(EFFECT_REFRESH)) then
        target:addStatusEffect(EFFECT_REFRESH,5,3,300);
        worked = true;
    end
    if (not worked) then
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
