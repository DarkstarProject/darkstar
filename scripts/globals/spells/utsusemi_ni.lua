-----------------------------------------
-- Spell: Utsusemi: Ni
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = target:getStatusEffect(dsp.effects.COPY_IMAGE);

    -- Get extras shadows
    local numShadows = 3;
    local icon = dsp.effects.COPY_IMAGE_3;
    
    if (caster:getMainJob() == dsp.jobs.NIN) then
        numShadows = 4 + target:getMod(MOD_UTSUSEMI_BONUS);
        icon = dsp.effects.COPY_IMAGE_4;
    end
    
    if (effect == nil or effect:getPower() <= 2) then
        target:addStatusEffectEx(dsp.effects.COPY_IMAGE, icon, 2, 0, 900, 0, numShadows);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.COPY_IMAGE;
end;
