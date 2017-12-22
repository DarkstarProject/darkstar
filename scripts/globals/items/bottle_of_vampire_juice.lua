-----------------------------------------
-- ID: 4512
-- Item: Vampire Juice
-- Item Effect: Restores 60 HP and MP over 90 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local worked = false;
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        target:addStatusEffect(EFFECT_REGEN,2,3,90);
        worked = true;
    end
    if (not target:hasStatusEffect(EFFECT_REFRESH)) then
        target:addStatusEffect(EFFECT_REFRESH,2,3,90);
        worked = true;
    end
    if (not worked) then
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
