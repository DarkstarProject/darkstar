-----------------------------------------
-- ID: 5322
-- Item: Flask of Healing Powder
-- Item Effect: Restores 25% HP AoE 10' radius
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
        member:messageBasic(dsp.msg.basic.RECOVERS_HP,0,member:addHP((member:getMaxHP()/100)*25))
    end)
end