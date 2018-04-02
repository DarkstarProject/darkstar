-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local encumbrance = target:getStatusEffect(EFFECT.ENCUMBRANCE_I);
    if (encumbrance) then
        local power = encumbrance:getPower()
        if bit.band(power, 0x0003) > 0 then
            return 0;
        end
    end
    return -1;
end;

function onItemUse(target)
    local encumbrance = target:getStatusEffect(EFFECT.ENCUMBRANCE_I);
    local power = encumbrance:getPower();
    local newpower = bit.band(power, bit.bnot(0x0003));
    target:delStatusEffectSilent(EFFECT.ENCUMBRANCE_I);
    if (newpower > 0) then
        target:addStatusEffectEx(EFFECT.ENCUMBRANCE_I, EFFECT.ENCUMBRANCE_I, newpower, 0, 0);
    end
    target:messageText(target, 7208);
end;

