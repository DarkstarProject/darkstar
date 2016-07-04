-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getSubType() == MOD_DMG) then
        target:addMod(MOD_DMG, effect:getPower());
    else
        if (effect:getSubType() == MOD_ACC) then
            target:addMod(MOD_RACC, -effect:getPower());
        elseif (effect:getSubType() == MOD_ATTP) then
            target:addMod(MOD_RATTP, -effect:getPower());
        elseif (effect:getSubType() == MOD_PET_MACC) then
            target:addMod(MOD_PET_MATT, -effect:getPower());
        end
        target:addMod(effect:getSubType(), -effect:getPower());
    end
    --print("added "..effect:getPower().." of mod "..effect:getSubType());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (effect:getSubType() == MOD_DMG) then
        target:delMod(MOD_DMG, effect:getPower());
    else
        if (effect:getSubType() == MOD_ACC) then
            target:delMod(MOD_RACC, -effect:getPower());
        elseif (effect:getSubType() == MOD_ATTP) then
            target:delMod(MOD_RATTP, -effect:getPower());
        elseif (effect:getSubType() == MOD_PET_MACC) then
            target:delMod(MOD_PET_MATT, -effect:getPower());
        end
        target:delMod(effect:getSubType(), -effect:getPower());
    end
    --print("removed "..effect:getPower().." of mod "..effect:getSubType());
end;