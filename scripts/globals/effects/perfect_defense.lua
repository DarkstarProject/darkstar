-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    print(target:getMod(MOD_UDMGMAGIC));
    print(target:getMod(MOD_UDMGPHYS));
    effect:setSubPower(effect:getPower()*(256/100));
    target:addMod(MOD_UDMGPHYS, -effect:getPower());
    target:addMod(MOD_UDMGBREATH, -effect:getPower());
    target:addMod(MOD_UDMGMAGIC, -effect:getSubPower());
    target:addMod(MOD_UDMGRANGE, -effect:getPower());
    target:addMod(MOD_SLEEPRES, effect:getPower());
    target:addMod(MOD_POISONRES, effect:getPower());
    target:addMod(MOD_PARALYZERES, effect:getPower());
    target:addMod(MOD_BLINDRES, effect:getPower());
    target:addMod(MOD_SILENCERES, effect:getPower());
    target:addMod(MOD_BINDRES, effect:getPower());
    target:addMod(MOD_CURSERES, effect:getPower());
    target:addMod(MOD_SLOWRES, effect:getPower());
    target:addMod(MOD_STUNRES, effect:getPower());
    target:addMod(MOD_CHARMRES, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (effect:getTickCount() > ((effect:getDuration() / effect:getTick())/2)) then
        if (effect:getPower() > 2) then
            effect:setPower(effect:getPower() - 2);
            effect:setSubPower(effect:getSubPower() - 3);
            target:delMod(MOD_UDMGPHYS, -2);
            target:delMod(MOD_UDMGBREATH, -2);
            target:delMod(MOD_UDMGMAGIC, -3);
            target:delMod(MOD_UDMGRANGE, -2);
            target:delMod(MOD_SLEEPRES, 2);
            target:delMod(MOD_POISONRES, 2);
            target:delMod(MOD_PARALYZERES, 2);
            target:delMod(MOD_BLINDRES, 2);
            target:delMod(MOD_SILENCERES, 2);
            target:delMod(MOD_BINDRES, 2);
            target:delMod(MOD_CURSERES, 2);
            target:delMod(MOD_SLOWRES, 2);
            target:delMod(MOD_STUNRES, 2);
            target:delMod(MOD_CHARMRES, 2);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_UDMGPHYS, -effect:getPower());
    target:delMod(MOD_UDMGBREATH, -effect:getPower());
    target:delMod(MOD_UDMGMAGIC, -effect:getSubPower());
    target:delMod(MOD_UDMGRANGE, -effect:getPower());
    target:delMod(MOD_SLEEPRES, effect:getPower());
    target:delMod(MOD_POISONRES, effect:getPower());
    target:delMod(MOD_PARALYZERES, effect:getPower());
    target:delMod(MOD_BLINDRES, effect:getPower());
    target:delMod(MOD_SILENCERES, effect:getPower());
    target:delMod(MOD_BINDRES, effect:getPower());
    target:delMod(MOD_CURSERES, effect:getPower());
    target:delMod(MOD_SLOWRES, effect:getPower());
    target:delMod(MOD_STUNRES, effect:getPower());
    target:delMod(MOD_CHARMRES, effect:getPower());
    print(target:getMod(MOD_UDMGMAGIC));
    print(target:getMod(MOD_UDMGPHYS));
end;