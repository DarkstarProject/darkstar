-----------------------------------
-- Area: Apollyon NW
--  Mob: Zlatorog
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.MIGHTY_STRIKES, hpp = math.random(90, 95), cooldown = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[2][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[2][1]):setStatus(dsp.status.NORMAL)
    end
end
