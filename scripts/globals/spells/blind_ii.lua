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
    local power = math.floor((dINT + 100) / 4);

    if (power < 15) then
        power = 15;
    end
    
    if (power > 30) then
        power = 30;
    end
    
        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        power = power * 2;
    end

    power = power + merits; --similar to Slow II, merit potency bonus is added after the cap

    -- Duration, including resistance.  Unconfirmed.
    local duration = 180 * applyResistanceEffect(caster,spell,target,dINT,35,merits*2,EFFECT_BLINDNESS);

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
