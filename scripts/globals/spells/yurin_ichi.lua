-----------------------------------------
-- Spell: Yurin: Ichi
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_INHIBIT_TP;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    params.effect = nil;
    resist = applyResistance(caster, target, spell, params);
    --Base power is 10 and is not affected by resistaces.
    local power = 10;

    --Calculates Resist Chance
    if (resist >= 0.125) then
        local duration = 180 * resist;
        
        if (duration >= 50) then
            -- Erases a weaker inhibit tp and applies the stronger one
            local inhibit_tp = target:getStatusEffect(effect);
            if (inhibit_tp ~= nil) then
                if (inhibit_tp:getPower() < power) then
                    target:delStatusEffect(effect);
                    target:addStatusEffect(effect,power,0,duration);
                    spell:setMsg(237);
                else
                    -- no effect
                    spell:setMsg(75);
                end
            else
                target:addStatusEffect(effect,power,0,duration);
                spell:setMsg(237);
            end
        else
            spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    
    return effect;
end;