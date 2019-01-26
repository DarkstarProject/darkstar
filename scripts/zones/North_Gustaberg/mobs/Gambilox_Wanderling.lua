-----------------------------------
-- Area: North Gusberg
--  MOB: Gambilox Wanderling
-- Quest NM - "As Thick as Thieves"
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobDeath(mob, player, isKiller)
    local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS")

    if thickAsThievesGamblingCS == 5 then
        player:setVar("thickAsThievesGamblingCS",6)
    end
end
