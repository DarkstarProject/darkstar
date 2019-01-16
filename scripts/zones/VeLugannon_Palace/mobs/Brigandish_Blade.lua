-----------------------------------
-- Area: VeLugannon Palace
--   NM: Brigandish Blade
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob,target,damage)
    if math.random(10) > 3 or target:hasStatusEffect(dsp.effect.TERROR) then -- 30% chance to terror
        return 0,0,0
    else
        local duration = math.random(3,5)
        target:addStatusEffect(dsp.effect.TERROR,1,0,duration)
        return dsp.subEffect.NONE,0,dsp.effect.TERROR
    end
end

function onMobDeath(mob, player, isKiller)
end