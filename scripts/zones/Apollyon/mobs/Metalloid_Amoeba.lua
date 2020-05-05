-----------------------------------
-- Area: Apollyon SE
--  Mob: Metalloid Amoeba
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.SLASHRES, 1500)
    mob:setMod(dsp.mod.HTHRES, 0)
    mob:setMod(dsp.mod.IMPACTRES, 0)
end

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("killCountF1", battlefield:getLocalVar("killCountF1")+1)
        local killCount = battlefield:getLocalVar("killCountF1")
        if killCount == 2 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[1]):setStatus(dsp.status.NORMAL)
        elseif killCount == 4 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[1]+1):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[1]+1):setStatus(dsp.status.NORMAL)
        elseif killCount == 8 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[1]+2):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[1]+2):setStatus(dsp.status.NORMAL)        
        end
    end
end
