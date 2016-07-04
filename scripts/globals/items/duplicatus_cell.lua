-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(EFFECT_OBLIVISCENCE) then
        return 0;
    end
    return -1
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:delStatusEffectSilent(EFFECT_OBLIVISCENCE)
    target:messageText(target, 7216)
end;

