-----------------------------------------
--  ID: 16003
--  Reraise Earring
--  This earring functions in the same way as the spell Reraise.
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local duration = 2100
    target:delStatusEffect(dsp.effect.RERAISE)
    target:addStatusEffect(dsp.effect.RERAISE,1,0,duration)
end
