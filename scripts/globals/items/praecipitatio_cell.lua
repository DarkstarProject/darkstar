-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(EFFECT_OMERTA) then
        return 0;
    end
    return -1
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:delStatusEffectSilent(EFFECT_OMERTA)
    target:messageText(target, 7218)
end;

