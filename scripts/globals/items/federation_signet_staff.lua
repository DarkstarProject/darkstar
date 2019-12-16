-----------------------------------------
-- ID: 17585
-- Item: Federation Signet Staff
-- Effect: Signet
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/conquest")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target, param, caster)
    if (target:getNation() ~= dsp.nation.WINDURST) then
        return dsp.msg.basic.ITEM_CANNOT_USE_ON
    end

    -- If target's current region is not a conquest region or not a nation city involved with conquest
    if (target:getCurrentRegion() > dsp.region.JEUNO) then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE
    end

    -- Can only use on targets within party or self
    if (target:getID() ~= caster:getID()) then
        if (caster:getPartyLeader() == nil or target:getPartyLeader():getID() ~= caster:getPartyLeader():getID()) then
            return dsp.msg.basic.ITEM_CANNOT_USE_ON
        end
    end

    return 0
end

function onItemUse(target)
    target:delStatusEffectsByFlag(dsp.effectFlag.INFLUENCE, true)
    target:addStatusEffect(dsp.effect.SIGNET,0,0,18000)
end
