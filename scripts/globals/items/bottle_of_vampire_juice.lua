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
    if (not target:hasStatusEffect(EFFECT.REGEN)) then
        target:addStatusEffect(EFFECT.REGEN,2,3,90);
        worked = true;
    end
    if (not target:hasStatusEffect(EFFECT.REFRESH)) then
        target:addStatusEffect(EFFECT.REFRESH,2,3,90);
        worked = true;
    end
    if (not worked) then
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
