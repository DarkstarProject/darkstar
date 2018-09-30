-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(dsp.effect.OMERTA) then
        return 0
    end
    return -1
end

function onItemUse(target)
    target:delStatusEffectSilent(dsp.effect.OMERTA)
    target:messageText(target, 7218)
end

