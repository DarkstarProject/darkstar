-----------------------------------------
-- Spell: Endark
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)

    return 0;

end;


function onSpellCast(caster,target,spell)
    local effect = dsp.effects.ENDARK;
    local magicskill = target:getSkillLevel(DARK_MAGIC_SKILL);
    local duration = 180;
    if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local potency = (magicskill / 8) + 12.5;

    if (target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end
    return effect;
end;
