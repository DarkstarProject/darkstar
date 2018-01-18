-----------------------------------------
-- Spell: Slow
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- Slow's potency is calculated with the formula (187.5 + dMND*1.5)/1024, and caps at 300/1024 (~29.3%).
-- And MND of 75 is neccessary to reach the hardcap of Slow.
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

    --Power.
    local power = math.floor(187.5 + dMND * 1.5);
    if (power > 300) then
        power = 300;
    end

    if (power < 75) then
        power = 75;
    end

    --Duration, including resistance.
    local duration = 120;
    local params = {};
    params.diff = nil;
    params.attribute = MOD_MND;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = EFFECT_SLOW;
    duration = duration * applyResistanceEffect(caster, target, spell, params);
    if (duration >= 60) then --Do it!

        if (target:addStatusEffect(EFFECT_SLOW,power,0,duration, 0, 1)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end

    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return EFFECT_SLOW;
end;
