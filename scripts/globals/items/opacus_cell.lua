-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(EFFECT.IMPAIRMENT) then
        return 0;
    end
    return -1
end;

function onItemUse(target)
    target:delStatusEffectSilent(EFFECT.IMPAIRMENT)
    target:messageText(target, 7217)
end;

