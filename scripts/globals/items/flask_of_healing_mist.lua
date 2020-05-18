-----------------------------------------
-- ID: 5832
-- Item: Flask of Healing Mist
-- Item Effect: Restores 600 HP AoE 10' radius
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
        member:messageBasic(dsp.msg.basic.RECOVERS_HP,0,member:addHP(600*ITEM_POWER))
    end)
end