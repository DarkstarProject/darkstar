-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(dsp.effects.OBLIVISCENCE) then
        return 0;
    end
    return -1
end;

function onItemUse(target)
    target:delStatusEffectSilent(dsp.effects.OBLIVISCENCE)
    target:messageText(target, 7216)
end;

