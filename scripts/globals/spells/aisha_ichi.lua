-----------------------------------------
-- Spell: Aisha: Ichi
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
    local effect = EFFECT_ATTACK_DOWN;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local resist = applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,0);
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