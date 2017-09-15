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
    local power = math.floor(dINT * 9/40) + 23;

    if (power < 5) then
        power = 5;
    end

    if (power > 50) then
        power = 50;
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
    params.bonus = 0;
    params.effect = EFFECT_BLINDNESS;
    duration = duration * applyResistanceEffect(caster, target, spell, params);

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
