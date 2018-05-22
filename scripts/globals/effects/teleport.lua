-----------------------------------
--
-- dsp.effect.TELEPORT
--
-----------------------------------
require("scripts/globals/teleports");
-----------------------------------

function onEffectGain(target,effect)
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    local destination = effect:getPower();
    
    if (target:isMob()) then
        DespawnMob(target:getID())
    elseif (destination == dsp.teleport.id.WARP) then
        target:warp();
    elseif (destination == dsp.teleport.id.ESCAPE) then
        dsp.teleport.escape(target);
    elseif (destination == dsp.teleport.id.HOMING) then
        dsp.teleport.homingRing(target);
    elseif (destination == dsp.teleport.id.LEADER) then
        dsp.teleport.toLeader(target);
    else
        dsp.teleport.to(target, destination);
    end
end;