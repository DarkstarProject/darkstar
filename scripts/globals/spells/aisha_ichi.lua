-----------------------------------------
-- Spell: Aisha: Ichi
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_ATTACK_DOWN;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    params.effect = nil;
    local resist = applyResistance(caster, target, spell, params);
    --Base power is 15 and is not affected by resistaces.
    local power = 15;

    --Calculates Resist Chance
    if (resist >= 0.125) then
        local duration = 120 * resist;

        if (duration >= 50) then
            -- Erases a weaker attack down and applies the stronger one
            local attackdown = target:getStatusEffect(effect);
            if (attackdown ~= nil) then
                if (attackdown:getPower() < power) then
                    target:delStatusEffect(effect);
                    target:addStatusEffect(effect,power,0,duration);
                    spell:setMsg(msgBasic.MAGIC_ENFEEB);
                else
                    -- no effect
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
