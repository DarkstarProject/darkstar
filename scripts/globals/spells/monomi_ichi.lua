-----------------------------------------
-- Spell: Monomi: Ichi
-- Lessens chance of being detected by sound
-- Duration is 3 minutes (non-random duration)
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (not target:hasStatusEffect(EFFECT_SNEAK)) then
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
        target:addStatusEffect(EFFECT_SNEAK, 0, 10, math.floor(420 * SNEAK_INVIS_DURATION_MULTIPLIER));
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect.
    end

    return EFFECT_SNEAK;
end;
