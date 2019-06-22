-----------------------------------
--
-- dsp.effect.MOUNTED
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target,effect)
    --[[
        Retail sends a music change packet (packet ID 0x5F) in both cases.
    ]]

    if effect:getPower() == 0 then
        target:ChangeMusic(4,212)
        target:setAnimation(dsp.anim.CHOCOBO)
    else
        target:ChangeMusic(4,84)
        target:setAnimation(dsp.anim.MOUNT)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setAnimation(dsp.anim.NONE)
end