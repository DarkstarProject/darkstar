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
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = dsp.effects.PETRIFICATION;
    local resist = applyResistanceEffect(caster, target, spell, params);
    -- Duration, including resistance.  Unconfirmed.
    local duration = 30 * resist;

    if (resist > 0.5) then
        if (target:addStatusEffect(dsp.effects.PETRIFICATION,1,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return dsp.effects.PETRIFICATION;
end;
