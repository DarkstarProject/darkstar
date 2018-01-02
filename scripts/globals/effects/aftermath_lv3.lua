-----------------------------------
--
-- EFFECT_AFTERMATH_LV3
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local modID = effect:getSubType()
    if (modID == MOD_MYTHIC_OCC_ATT_TWICE) then
        local weapon = target:getWeapon(SLOT_MAIN)
        if (weapon) then
            weapon:addMod(modID, effect:getSubPower())
            if (effect:getPower() == 3) then
                weapon:addMod(MOD_MYTHIC_OCC_ATT_THRICE, 20)
            end
        end
    elseif (modID == MOD_OCC_DO_DOUBLE_DMG) then -- This modifier needs to be added to the weapon to work
        local weapon = target:getWeapon(SLOT_RANGED)
        if (weapon) then
            weapon:addMod(modID, effect:getSubPower())
            if (effect:getPower() == 3) then
                weapon:addMod(MOD_OCC_DO_TRIPLE_DMG, 200)
            end
        end
    end
end

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local modID = effect:getSubType()
    if (modID == MOD_MYTHIC_OCC_ATT_TWICE) then
        local weapon = target:getWeapon(SLOT_MAIN)
        if (weapon) then
            weapon:delMod(modID, effect:getSubPower())
            if (effect:getPower() == 3) then
                weapon:delMod(MOD_MYTHIC_OCC_ATT_THRICE, 20)
            end
        end
    elseif (modID == MOD_OCC_DO_DOUBLE_DMG) then -- This modifier needs to be added to the weapon to work
        local weapon = target:getWeapon(SLOT_RANGED)
        if (weapon) then
            weapon:delMod(modID, effect:getSubPower())
            if (effect:getPower() == 3) then
                weapon:delMod(MOD_OCC_DO_TRIPLE_DMG, 200)
            end
        end
    end
end