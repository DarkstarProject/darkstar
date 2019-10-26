-----------------------------------
-- Area: Temenos E T
--  Mob: Dark Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local battlefield = player:getBattlefield()
    local random = battlefield:getLocalVar("random")
    local cofferPos = {{-603, 5, 160, 64}, {-597, 5, 160, 64}}
    
    switch (mobID): caseof {
        [ID.mob.TEMENOS_E_MOB[7]] = function ()
            if GetMobByID(ID.mob.TEMENOS_E_MOB[7]+1):isDead() then
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setPos(cofferPos[random])
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setPos(cofferPos[3-random])
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_E_MOB[7]+1] = function ()
            if GetMobByID(ID.mob.TEMENOS_E_MOB[7]):isDead() then
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setPos(cofferPos[random])
                GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setPos(cofferPos[3-random])
                GetNPCByID(ID.npc.COFFER_OFFSET+123):setStatus(dsp.status.NORMAL)
            end
        end,
    }
end