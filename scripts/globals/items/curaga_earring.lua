-----------------------------------------
-- ID: 14759
-- Item: Curaga Earring
-- Item Effect: Casts Curaga
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/settings")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local party = target:getParty()
    for _,member in ipairs(party) do
        local healAmount = math.random(60,90)

        healAmount = healAmount + (healAmount * (target:getMod(dsp.mod.CURE_POTENCY_RCVD)/100))
        healAmount = healAmount * CURE_POWER

        local diff = (member:getMaxHP() - member:getHP())
        if (healAmount > diff) then
            healAmount = diff
        end
        member:addHP(healAmount)
        member:messageBasic(dsp.msg.basic.RECOVERS_HP,0,healAmount)
    end
end
