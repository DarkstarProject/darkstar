-----------------------------------------
--  ID: 14988
--  Stone Bangles
--  Enchantment: "Enstone"
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = dsp.effect.ENLIGHT
    doEnspell(target,target,nil,effect)
end
