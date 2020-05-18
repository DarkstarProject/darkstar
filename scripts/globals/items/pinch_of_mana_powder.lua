-----------------------------------------
-- ID: 4255
-- Item: Pinch of Mana Powder
-- Item Effect: Restores 25% MP AoE 10' radius
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

-- TODO: AOE animation effect.
function onItemUse(target)
    target:forMembersInRange(10, function(member)
        member:messageBasic(dsp.msg.basic.RECOVERS_MP,0,member:addMP((member:getMaxMP()/100)*25))
    end)
end
