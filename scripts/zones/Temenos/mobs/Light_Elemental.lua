-----------------------------------
-- Area: Temenos E T
--  Mob: Light Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2]+1 then
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):updateEnmity(target)
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+2 then
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    switch (mobID): caseof {
        [ID.mob.TEMENOS_C_MOB[2]+1] = function()
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):isDead() then
                GetNPCByID(ID.npc.COFFER_OFFSET+77):setPos(0.5, -6, -459)
                GetNPCByID(ID.npc.COFFER_OFFSET+77):setStatus(dsp.status.NORMAL)
                GetNPCByID(ID.npc.GATE_OFFSET+19):setStatus(dsp.status.NORMAL)
            end
        end,
        [ID.mob.TEMENOS_C_MOB[2]+2] = function()
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):isDead() then
                GetNPCByID(ID.npc.COFFER_OFFSET+77):setPos(0.5, -6, -459)
                GetNPCByID(ID.npc.COFFER_OFFSET+77):setStatus(dsp.status.NORMAL)
                GetNPCByID(ID.npc.GATE_OFFSET+19):setStatus(dsp.status.NORMAL)
            end
        end,
    }
end