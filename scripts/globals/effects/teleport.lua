-----------------------------------
--
-- dsp.effect.TELEPORT
--
-----------------------------------
require("scripts/globals/teleports")
-----------------------------------

function onEffectGain(target,effect)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local destination = effect:getPower()
    
    if (target:isMob()) then
        DespawnMob(target:getID())
    elseif (destination == dsp.teleport.id.WARP) then
        target:warp()
    elseif (destination == dsp.teleport.id.ESCAPE) then
        dsp.teleport.escape(target)
    elseif (destination == dsp.teleport.id.OUTPOST) then
        local region = effect:getSubPower()
        dsp.teleport.toOutpost(target, region)
    elseif (destination == dsp.teleport.id.LEADER) then
        dsp.teleport.toLeader(target)
    elseif (destination == dsp.teleport.id.HOME_NATION) then
        dsp.teleport.toHomeNation(target)
    else
        dsp.teleport.to(target, destination)
    end
end