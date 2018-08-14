-----------------------------------------
-- ID: 14990
-- Blizzard Gloves
--  Enchantment: "Enblizzard"
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = dsp.effect.ENBLIZZARD
    doEnspell(target,target,nil,effect)
end
