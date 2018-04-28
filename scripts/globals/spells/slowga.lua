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
    local dMND = (caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND));

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
    params.attribute = dsp.mod.MND;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = dsp.effect.SLOW;
    duration = duration * applyResistanceEffect(caster, target, spell, params);
    if (duration >= 60) then --Do it!

        if (target:addStatusEffect(dsp.effect.SLOW,power,0,duration, 0, 1)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
        end

    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST);
    end

    return dsp.effect.SLOW;
end;
