-----------------------------------------
-- Spell: Jubaku: Ni
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and INT.
-- taken from paralyze
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_PARALYSIS;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local duration = 300;
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    duration = duration * applyResistance(caster, target, spell, params);
    --Paralyze base power is 19.5 and is not affected by resistaces.
    local power = 30;

    --Calculates resist chanve from Reist Blind
    if (math.random(0,100) >= target:getMod(MOD_PARALYZERES)) then
        if (duration >= 150) then
            -- Erases a weaker blind and applies the stronger one
            local paralysis = target:getStatusEffect(effect);
            if (paralysis ~= nil) then
                if (paralysis:getPower() < power) then
                    target:delStatusEffect(effect);
                    target:addStatusEffect(effect,power,0,duration);
                    spell:setMsg(msgBasic.MAGIC_ENFEEB);
                else
                    spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
                end
            else
                target:addStatusEffect(effect,power,0,duration);
                spell:setMsg(msgBasic.MAGIC_ENFEEB);
            end
        else
            spell:setMsg(msgBasic.MAGIC_RESIST);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST_2);
    end
    return effect;
end;
