-----------------------------------------
-- ID: 14992
-- Water Mitts
--  Enchantment: "Enwater"
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = dsp.effect.ENWATER
    doEnspell(target,target,nil,effect)
end
