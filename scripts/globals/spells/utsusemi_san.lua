-----------------------------------------
-- Spell: Utsusemi: San
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = target:getStatusEffect(dsp.effects.COPY_IMAGE);
    if (effect == nil) then
        target:addStatusEffectEx(dsp.effects.COPY_IMAGE,dsp.effects.COPY_IMAGE_4,5,0,300);
        target:setMod(MOD_UTSUSEMI, 5);
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    elseif (effect:getPower() <= 5) then
        effect:setPower(5);
        effect:setIcon(dsp.effects.COPY_IMAGE_4);
        effect:resetStartTime();
        target:setMod(MOD_UTSUSEMI, 5);
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end
    return dsp.effects.COPY_IMAGE;
end;
