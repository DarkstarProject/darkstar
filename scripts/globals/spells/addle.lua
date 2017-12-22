-----------------------------------------
-- Spell: Addle
-- Increases the casting time of the target
-- Exact formula is unknown.
--
-- Raw Value is said to be 30%
-- It is said to increase to 50% w/ Saboteur
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    -- Power: Cast Time Modifier
    local power = 30;

    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        power = 50;
    end

    -- Sub Power: Magic Accuracy Modifier
    local targetMagicAccuracy = target:getMod(MOD_MACC);
    local subPower = math.floor( targetMagicAccuracy * (power / 100) );

    --Duration, including resistance.
    local duration = 180;
    local params = {};
    params.diff = nil;
    params.attribute = MOD_MND;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = EFFECT_ADDLE;
    duration = duration * applyResistanceEffect(caster, target, spell, params);

    if (duration >= 60) then -- Do it!
        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
            duration = duration * 2;
            caster:delStatusEffect(EFFECT_SABOTEUR);
        end

        if (target:addStatusEffect(EFFECT_ADDLE, power, 0, duration, 0, subPower)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return EFFECT_ADDLE;
end;
