-----------------------------------
-- Area: Temenos E T
--  Mob: Dark Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    local posRand = math.random(1, 2)
    local cofferPos = {{-603, 5, 160, 64}, {-597, 5, 160, 64}}
    
    switch (mobID): caseof {
    -- 100 a 106 inclut (Temenos -Northern Tower )
        [ID.mob.TEMENOS_E_MOB[7]] = function ()
            if GetMobByID(ID.mob.TEMENOS_E_MOB[7]+1):isDead() then
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setPos(cofferPos[posRand])
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setPos(cofferPos[3-posRand])
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_E_MOB[7]+1] = function ()
            if GetMobByID(ID.mob.TEMENOS_E_MOB[7]):isDead() then
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setPos(cofferPos[posRand])
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setPos(cofferPos[3-posRand])
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setStatus(dsp.status.NORMAL)
            end
        end,
    }
end