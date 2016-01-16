-----------------------------------------
-- Spell: Blink
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 300;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    if (target:addStatusEffect(EFFECT_BLINK, BLINK_SHADOWS, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_BLINK;
end;