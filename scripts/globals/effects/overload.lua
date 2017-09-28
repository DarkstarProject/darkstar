-----------------------------------
--
--     EFFECT_OVERLOAD
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local pet = target:getPet()
    if pet then
        pet:setLocalVar("overload", 1)
        pet:addMod(MOD_HASTE_MAGIC, -500)
        pet:addMod(MOD_MOVE, -50)
        pet:addMod(MOD_EVA, -10)
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
    local pet = target:getPet()
    if pet and pet:getLocalVar("overload") ~= 0 then
        pet:setLocalVar("overload", 0)
        pet:delMod(MOD_HASTE_MAGIC, -500)
        pet:delMod(MOD_MOVE, -50)
        pet:delMod(MOD_EVA, -10)
    end
end