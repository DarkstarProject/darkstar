-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local debilitation = target:getStatusEffect(dsp.effects.DEBILITATION);
    if (debilitation) then
        local power = debilitation:getPower()
        if bit.band(power, 0x001) > 0 then
            return 0;
        end
    end
    return -1;
end;

function onItemUse(target)
    local debilitation = target:getStatusEffect(dsp.effects.DEBILITATION);
    local power = debilitation:getPower();
    local newpower = bit.band(power, bit.bnot(0x001));
    target:delStatusEffectSilent(dsp.effects.DEBILITATION);
    if (newpower > 0) then
        target:addStatusEffectEx(dsp.effects.DEBILITATION, dsp.effects.DEBILITATION, newpower, 0, 0);
    end
    target:messageText(target, 7219);
end;

