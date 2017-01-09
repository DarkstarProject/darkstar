-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local debilitation = target:getStatusEffect(EFFECT_DEBILITATION);
    if (debilitation) then
        local power = debilitation:getPower()
        if bit.band(power, 0x100) > 0 then
            return 0;
        end
    end
    return -1;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local debilitation = target:getStatusEffect(EFFECT_DEBILITATION);
    local power = debilitation:getPower();
    local newpower = bit.band(power, bit.bnot(0x100));
    target:delStatusEffectSilent(EFFECT_DEBILITATION);
    if (newpower > 0) then
        target:addStatusEffectEx(EFFECT_DEBILITATION, EFFECT_DEBILITATION, newpower, 0, 0);
    end
    target:messageText(target, 7227);
end;

