-----------------------------------------
-- Spell: Kurayami:Ni
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local duration = 300;
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    duration = duration * applyResistance(caster, target, spell, params);
    --Kurayami base power is 30 and is not affected by resistaces.
    local power = 30;

    --Calculates resist chanve from Reist Blind
    if (math.random(0,100) >= target:getMod(MOD_BLINDRES)) then
        if (duration >= 150) then

            if (target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration)) then
                spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
            else
                spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
            end
        else
            spell:setMsg(msgBasic.MAGIC_RESIST);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST_2);
    end
    return EFFECT_BLINDNESS;
end;
