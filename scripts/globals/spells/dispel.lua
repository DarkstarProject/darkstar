-----------------------------------------
-- Spell: Dispel
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = ENFEEBLING_MAGIC_SKILL;
    local resist = applyResistance(caster, target, spell, params);
    local effect = dsp.effects.NONE;

    if (resist > 0.0625) then
        spell:setMsg(msgBasic.MAGIC_ERASE);
        effect = target:dispelStatusEffect();
        if (effect == dsp.effects.NONE) then
            -- no effect
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return effect;
end;
