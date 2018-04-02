-----------------------------------------
-- Spell: Tonko: san
-- Lessens chance of being detected by sound
-- Duration is 7 minutes (non-random duration)
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(dsp.effects.INVISIBLE) == false) then
        target:addStatusEffect(dsp.effects.INVISIBLE,0,10,420);
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no dsp.effects.
    end
    return dsp.effects.INVISIBLE;
end;
