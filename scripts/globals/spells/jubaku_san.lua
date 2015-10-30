-----------------------------------------
-- Spell: Jubaku: San
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and INT.
-- taken from paralyze
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
    local effect = EFFECT_PARALYSIS;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local duration = 420 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,0);
    --Paralyze base power is 35 and is not affected by resistaces.
    local power = 35;

    --Calculates resist chanve from Reist Blind
    if (math.random(0,100) >= target:getMod(MOD_PARALYZERES)) then
        if (duration >= 210) then
            -- Erases a weaker blind and applies the stronger one
            local paralysis = target:getStatusEffect(effect);
            if (paralysis ~= nil) then
                if (paralysis:getPower() < power) then
                    target:delStatusEffect(effect);
                    target:addStatusEffect(effect,power,0,duration);
                    spell:setMsg(237);
                else
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