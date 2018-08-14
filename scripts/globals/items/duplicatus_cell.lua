-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(dsp.effect.OBLIVISCENCE) then
        return 0
    end
    return -1
end

function onItemUse(target)
    target:delStatusEffectSilent(dsp.effect.OBLIVISCENCE)
    target:messageText(target, 7216)
end

