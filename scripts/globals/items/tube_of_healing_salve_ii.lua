-----------------------------------------
-- ID: 5836
-- Item: Tube of Healing Salve II
-- Item Effect: Restores 100% HP to Pet
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:hasPet() then
        result = dsp.msg.basic.REQUIRES_A_PET
    end
    return result
end

function onItemUse(target)
    local pet = target:getPet()
    pet:messageBasic(dsp.msg.basic.RECOVERS_HP,0,pet:addHP(pet:getMaxHP()))
end