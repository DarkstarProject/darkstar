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
    local effect = target:getStatusEffect(EFFECT_COPY_IMAGE);

    -- Get extras shadows
    local bonusShadow = 0;
    if caster:getEquipID(SLOT_FEET) == 11156 then
        bonusShadow = 1;
    end

    if (effect == nil) then
        if caster:getMainJob() == JOBS.NIN then
            target:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_4, 4 + bonusShadow,0,900);
            target:setMod(MOD_UTSUSEMI, 4 + bonusShadow);
            spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
        else
            target:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_3, 3 + bonusShadow,0,900);
            target:setMod(MOD_UTSUSEMI, 3 + bonusShadow);
            spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
        end
    elseif caster:getMainJob() == JOBS.NIN then
        if (effect:getPower() <= 4) then
            spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
            effect:setPower(4);
            effect:setIcon(EFFECT_COPY_IMAGE_4);
            effect:resetStartTime();
            target:setMod(MOD_UTSUSEMI, 4 + bonusShadow);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        if (effect:getPower() <= 3) then
            spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
            effect:setPower(3);
            effect:setIcon(EFFECT_COPY_IMAGE_3);
            effect:resetStartTime();
            target:setMod(MOD_UTSUSEMI, 3 + bonusShadow);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    end

    return EFFECT_COPY_IMAGE;
end;
