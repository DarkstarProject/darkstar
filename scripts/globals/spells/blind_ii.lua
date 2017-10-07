-----------------------------------------
-- Spell: Blind II
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Blind II value per point is '1' This is a constant set in the table 'merits'
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

    local merits = caster:getMerit(MERIT_BLIND_II);

    -- Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_MND)); --blind uses caster INT vs target MND

    -- Base power.  May need more research.
    local power = math.floor(dINT * 3/8) + 45;

    if (power < 15) then
        power = 15;
    end
    
    if (power > 90) then
        power = 90;
    end

    if (merits > 1) then
        power = power + merits - 1;
    end

    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        power = power * 2;
    end

    -- Duration, including resistance.  Unconfirmed.
    local duration = 180;
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = 35;
    params.bonus = merits*2;
    params.effect = EFFECT_BLINDNESS;
    duration = duration * applyResistanceEffect(caster, target, spell, params);

    if (duration >= 90) then --Do it!
    
        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);

        if (target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end
    return EFFECT_BLINDNESS;
end;
