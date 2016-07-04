-----------------------------------------
-- Spell: Slow II
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Slow II value per point is '1' This is a constant set in the table 'merits'
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
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    local potency = 230 + math.floor(dMND * 1.6);

    -- ([230] + [y * 10] + [floor(dMND * 1.6)])/1024

    if (potency > 350) then
        potency = 350;
    end
    
        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        potency = potency * 2;
    end

    local merits = caster:getMerit(MERIT_SLOW_II);

    --Power.
    local power = (potency  + (merits * 10));

    --Duration, including resistance.
    local duration = 180 * applyResistanceEffect(caster,spell,target,dMND,35,merits*2,EFFECT_SLOW);

    if (duration >= 60) then --Do it!
    
        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);

        if (target:addStatusEffect(EFFECT_SLOW,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end

    else
        spell:setMsg(85);
    end

    return EFFECT_SLOW;
end;