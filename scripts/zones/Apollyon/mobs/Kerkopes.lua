-----------------------------------
-- Area: Apollyon NE
--  Mob: Kerkopes
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        if mobID == ID.mob.APOLLYON_NE_MOB[4]+3 then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[4][1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[4][1]):setStatus(dsp.status.NORMAL)
        end
    end
end