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
    if (modID == MOD_OCC_DO_DOUBLE_DMG) then -- This modifier needs to be added to the weapon to work
        local weapon = target:getWeapon(SLOT_RANGED)
        if (weapon) then
            weapon:addMod(modID, effect:getSubPower())
        end
    else
        target:addMod(modID, effect:getSubPower())
    end
    
    -- Tier 3 gets some extra buffs from Level 3 Aftermath
    if (effect:getPower() == 3) then
        if (modID == MOD_DOUBLE_ATTACK) then
            target:addMod(MOD_TRIPLE_ATTACK, 200)
        elseif (modID == MOD_OCC_DO_DOUBLE_DMG) then
            local weapon = target:getWeapon(SLOT_RANGED)
            if (weapon) then
                weapon:addMod(MOD_OCC_DO_TRIPLE_DMG, 200)
            end
        end
    end
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
    local modID = effect:getSubType()
    if (modID == MOD_OCC_DO_DOUBLE_DMG) then -- This modifier needs to be added to the weapon to work
        local weapon = target:getWeapon(SLOT_RANGED)
        if (weapon) then
            weapon:delMod(modID, effect:getSubPower())
        end
    else
        target:delMod(modID, effect:getSubPower())
    end
    
    -- Tier 3 gets some extra buffs from Level 3 Aftermath
    if (effect:getPower() == 3) then
        if (modID == MOD_DOUBLE_ATTACK) then
            target:delMod(MOD_TRIPLE_ATTACK, 200)
        elseif (modID == MOD_OCC_DO_DOUBLE_DMG) then
            local weapon = target:getWeapon(SLOT_RANGED)
            if (weapon) then
                weapon:delMod(MOD_OCC_DO_TRIPLE_DMG, 200)
            end
        end
    end
end;