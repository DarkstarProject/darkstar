-----------------------------------------
-- Spell: Utsusemi: Ichi
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
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
        target:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE_3, 3 + bonusShadow, 0, 900);
        target:setMod(MOD_UTSUSEMI, 3 + bonusShadow);
        spell:setMsg(230);
    elseif (effect:getPower() <= 3) then
        effect:setPower(3);
        effect:setIcon(EFFECT_COPY_IMAGE_3);
        effect:resetStartTime();
        target:setMod(MOD_UTSUSEMI, 3 + bonusShadow);
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_COPY_IMAGE;
end;