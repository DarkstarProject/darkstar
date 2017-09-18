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
    local merits = caster:getMerit(MERIT_SLOW_II);

    local potency = 244 + math.floor(dMND * 116/75);

    if (potency > 360) then
        potency = 360;
    end
    
    if (potency < 128) then
        potency = 128;
    end
    
    if (merits > 1) then
        potency = potency + ((merits - 1) * 10);
    end;
    
    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        potency = potency * 2;
    end

    --Duration, including resistance.
    local duration = 180;
    local params = {};
    params.diff = nil;
    params.attribute = MOD_MND;
    params.skillType = 35;
    params.bonus = merits*2;
    params.effect = EFFECT_SLOW;
    duration = duration * applyResistanceEffect(caster, target, spell, params);

    if (duration >= 60) then --Do it!
    
    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);

        if (target:addStatusEffect(EFFECT_SLOW,potency,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end

    else
        spell:setMsg(85);
    end

    return EFFECT_SLOW;
end;