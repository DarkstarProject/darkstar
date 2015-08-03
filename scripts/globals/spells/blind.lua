-----------------------------------------
-- Spell: Blind
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

    -- Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_MND)); --blind uses caster INT vs target MND

    -- Base power.  May need more research.
    local power = math.floor((dINT + 60) / 4);

    if (power < 5) then
        power = 5;
    end

    if (power > 20) then
        power = 20;
	end

    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        power = power * 2;
    end


    -- Duration, including resistance.  Unconfirmed.
    local duration = 120 * applyResistanceEffect(caster,spell,target,dINT,35,0,EFFECT_BLINDNESS);

    if (duration >= 60) then --Do it!

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
