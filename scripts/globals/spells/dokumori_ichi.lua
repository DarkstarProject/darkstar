-----------------------------------------
-- Spell: Dokumori: Ichi
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = dsp.effects.POISON;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local duration = 60;
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    duration = duration * applyResistance(caster, target, spell, params);
    local power = 3;

    --Calculates resist chanve from Reist Blind
    if (target:hasStatusEffect(effect)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
        return effect;
    end

    if (math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        if (duration >= 30) then
            if (target:addStatusEffect(effect,power,3,duration)) then
                spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
            else
                spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
            end
        else
            spell:setMsg(msgBasic.MAGIC_RESIST);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST_2);
    end
    return effect;
end;
