-----------------------------------------
-- Spell: Silence
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effectType = dsp.effects.SILENCE;

    if (target:hasStatusEffect(effectType)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
        return effectType;
    end

    --Pull base stats.
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    --Duration, including resistance.  May need more research.
    local duration = 120;

    if (caster:hasStatusEffect(dsp.effects.SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(dsp.effects.SABOTEUR);

    --Resist
    local params = {};
    params.diff = nil;
    params.attribute = MOD_MND;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = dsp.effects.SILENCE;
    local resist = applyResistanceEffect(caster, target, spell, params);

    if (resist >= 0.5) then --Do it!
        if (target:addStatusEffect(effectType,1,0,duration * resist)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return effectType;

end;
