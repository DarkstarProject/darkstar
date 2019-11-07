-----------------------------------
-- Area: Apollyon SE
--  Mob: Inhumer
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    local cratePos =
    {
        [1] = {366.000,-0.500,-313.000},
        [2] = {313.021,0.000,-317.754},
        [3] = {376.097,0.000,-259.382},
        [4] = {321.552,0.000,-293.187},
        [5] = {337.399,-0.388,-313.442},
        [6] = {354.661,-0.072,-273.424},
    }
    if isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("killCountF3", battlefield:getLocalVar("killCountF3")+1)
        local killCount = battlefield:getLocalVar("killCountF3")
        local random = math.random(1,6)
        if killCount == 2 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[3]):setPos(cratePos[random])
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[3]):setStatus(dsp.status.NORMAL)
        elseif killCount == 4 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[3]+1):setPos(cratePos[random])
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[3]+1):setStatus(dsp.status.NORMAL)
        elseif killCount == 8 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[3]+2):setPos(cratePos[random])
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[3]+2):setStatus(dsp.status.NORMAL)        
        end
    end
end
