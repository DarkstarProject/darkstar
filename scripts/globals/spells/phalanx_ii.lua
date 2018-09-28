-----------------------------------------
-- Spell: PHALANX
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Phalanx II value per point is '3' This is a constant set in the table 'merits'
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local enhskill = caster:getSkillLevel(dsp.skill.ENHANCING_MAGIC);
    local final = 0;
    local merits = caster:getMerit(dsp.merit.PHALANX_II);

    local duration = 90 + (10 * merits);

    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    final = (enhskill / 25) + merits + 1;

    if (target:addStatusEffect(dsp.effect.PHALANX,final,0,duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
    end

    return dsp.effect.PHALANX;
end;
