-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Qiqirn Mine
-- Note: Explosive mine from Qiqrin
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setUnkillable(true)
    mob:hideName(true)
    mob:untargetable(true)
    mob:hideHP(true)
    mob:SetAutoAttackEnabled(false)
    mob:setStatus(dsp.status.DISAPPEAR)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    mob:setMobMod(dsp.mobMod.SIGHT_RANGE, 15)
    mob:setMobMod(dsp.mobMod.SOUND_RANGE, 15)
end

function onMobDeath(mob,player)
end