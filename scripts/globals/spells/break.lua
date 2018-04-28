-----------------------------------------
-- Spell: Breakga
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT));
    local params = {};
    params.diff = nil;
    params.attribute = dsp.mod.INT;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = dsp.effect.PETRIFICATION;
    local resist = applyResistanceEffect(caster, target, spell, params);
    -- Duration, including resistance.  Unconfirmed.
    local duration = 30 * resist;

    if (resist > 0.5) then
        if (caster:hasStatusEffect(dsp.effect.SABOTEUR)) then
            duration = duration * 2;
            caster:delStatusEffect(dsp.effect.SABOTEUR);
        end

        if (target:addStatusEffect(dsp.effect.PETRIFICATION,1,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST);
    end

    return dsp.effect.PETRIFICATION;
end;
