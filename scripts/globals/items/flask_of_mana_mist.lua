-----------------------------------------
-- ID: 5833
-- Item: Flask of Mana Mist
-- Item Effect: Restores 300 MP AoE 10' radius
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

-- TODO: AOE animation effect.
function onItemUse(target)
    target:forMembersInRange(10, function(member)
        member:messageBasic(dsp.msg.basic.RECOVERS_MP,0,target:addMP(300*ITEM_POWER))
    end)
end