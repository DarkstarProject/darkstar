-----------------------------------
-- Area: Mount Zhayolm
--   NM: Cerberus
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobFight(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(dsp.mod.REGAIN, 10)
    else
        mob:setMod(dsp.mod.REGAIN, 70)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.CERBERUS_MUZZLER)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(48, 72) * 3600) -- 48 - 72 hours with 1 hour windows
end
