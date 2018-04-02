-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(dsp.effects.IMPAIRMENT) then
        return 0;
    end
    return -1
end;

function onItemUse(target)
    target:delStatusEffectSilent(dsp.effects.IMPAIRMENT)
    target:messageText(target, 7217)
end;

