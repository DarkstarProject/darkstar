-----------------------------------------
-- ID: 14987
-- Thunder Mittens
--  Enchantment: "Enthunder"
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = dsp.effect.ENTHUNDER
    doEnspell(target,target,nil,effect)
end
