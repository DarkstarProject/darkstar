-----------------------------------
--
--     EFFECT_OVERDRIVE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_OVERLOAD_THRESH, 5000)
    local pet = target:getPet()
    if pet then
        pet:setLocalVar("overdrive", 1)
        pet:addMod(MOD_HASTE_MAGIC, 250)
        pet:addMod(MOD_MAIN_DMG_RATING, 30)
        pet:addMod(MOD_RANGED_DMG_RATING, 30)
        pet:addMod(MOD_ATTP, 50)
        pet:addMod(MOD_RATTP, 50)
        pet:addMod(MOD_ACC, 100)
        pet:addMod(MOD_RACC, 100)
        pet:addMod(MOD_EVA, 50)
        pet:addMod(MOD_MEVA, 50)
        pet:addMod(MOD_REVA, 50)
        pet:addMod(MOD_DMG, -50)
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
    target:delMod(MOD_OVERLOAD_THRESH, 5000)
    local pet = target:getPet()
    if pet and pet:getLocalVar("overdrive") ~= 0 then
        pet:setLocalVar("overdrive", 0)
        pet:delMod(MOD_HASTE_MAGIC, 250)
        pet:delMod(MOD_MAIN_DMG_RATING, 30)
        pet:delMod(MOD_RANGED_DMG_RATING, 30)
        pet:delMod(MOD_ATTP, 50)
        pet:delMod(MOD_RATTP, 50)
        pet:delMod(MOD_ACC, 100)
        pet:delMod(MOD_RACC, 100)
        pet:delMod(MOD_EVA, 50)
        pet:delMod(MOD_MEVA, 50)
        pet:delMod(MOD_REVA, 50)
        pet:delMod(MOD_DMG, -50)
    end
end