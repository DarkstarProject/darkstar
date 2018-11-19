-----------------------------------
-- Area: Xarcabard
--   NM: Biast
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- Set Biast's ToD
    SetServerVariable("[POP]Biast", os.time() + 75600) -- 21 hour
    DisallowRespawn(mob:getID()-1, false)
    GetMobByID(mob:getID()-1):setRespawnTime(GetMobRespawnTime(mob:getID()-1))
end

function onAdditionalEffect(mob,target,damage)
    if math.random(1,15) ~= 5 or target:hasStatusEffect(dsp.effect.TERROR) then
        return 0,0,0
    else
        local duration = 5
        target:addStatusEffect(dsp.effect.TERROR,1,0,duration)
        mob:resetEnmity(target)
        return dsp.subEffect.NONE,0,dsp.effect.TERROR
    end
end