-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(EFFECT.OBLIVISCENCE) then
        return 0;
    end
    return -1
end;

function onItemUse(target)
    target:delStatusEffectSilent(EFFECT.OBLIVISCENCE)
    target:messageText(target, 7216)
end;

