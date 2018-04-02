-----------------------------------------
-- Spell: Magic Finale
--
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
    local dCHR = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));

    local params = {};

    params.diff = nil;

    params.attribute = MOD_CHR;

    params.skillType = SINGING_SKILL;

    params.bonus = caster:getMod(MOD_FINALE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);

    params.effect = nil;

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
