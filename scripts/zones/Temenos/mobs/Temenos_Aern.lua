-----------------------------------
-- Area: Temenos
--  Mob: Temenos Aern
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    switch (mobID): caseof {
        [ID.mob.TEMENOS_C_MOB[5]+1] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+197):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+197):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[5]+7] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+199):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+199):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[5]+12] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+200):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+200):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[5]+22] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+201):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+201):setStatus(dsp.status.NORMAL)
        end,
        [ID.mob.TEMENOS_C_MOB[5]+30] = function()
            GetNPCByID(ID.npc.COFFER_OFFSET+127):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.COFFER_OFFSET+127):setStatus(dsp.status.NORMAL)
        end,
    }
    local leftAern=0
    local AernList = {
        ID.mob.TEMENOS_C_MOB[5], ID.mob.TEMENOS_C_MOB[5]+1, ID.mob.TEMENOS_C_MOB[5]+2,
        ID.mob.TEMENOS_C_MOB[5]+4, ID.mob.TEMENOS_C_MOB[5]+5, ID.mob.TEMENOS_C_MOB[5]+7,
        ID.mob.TEMENOS_C_MOB[5]+8, ID.mob.TEMENOS_C_MOB[5]+9, ID.mob.TEMENOS_C_MOB[5]+10,
        ID.mob.TEMENOS_C_MOB[5]+11, ID.mob.TEMENOS_C_MOB[5]+12, ID.mob.TEMENOS_C_MOB[5]+13,
        ID.mob.TEMENOS_C_MOB[5]+16, ID.mob.TEMENOS_C_MOB[5]+18, ID.mob.TEMENOS_C_MOB[5]+19,
        ID.mob.TEMENOS_C_MOB[5]+20, ID.mob.TEMENOS_C_MOB[5]+22, ID.mob.TEMENOS_C_MOB[5]+23,
        ID.mob.TEMENOS_C_MOB[5]+24, ID.mob.TEMENOS_C_MOB[5]+25, ID.mob.TEMENOS_C_MOB[5]+26,
        ID.mob.TEMENOS_C_MOB[5]+29, ID.mob.TEMENOS_C_MOB[5]+30, ID.mob.TEMENOS_C_MOB[5]+31,
        ID.mob.TEMENOS_C_MOB[5]+32, ID.mob.TEMENOS_C_MOB[5]+33, ID.mob.TEMENOS_C_MOB[5]+34, 

    }

    for n = 1, 27 do
        if GetMobByID(AernList[n]):isAlive() then
            leftAern = leftAern + 1
        end
    end
 --print("leftAern" ..leftAern);
    if leftAern == 0 and isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("dontKick", 1)
        GetMobByID(ID.mob.TEMENOS_C_MOB[5]+35):setSpawn(mobX, mobY, mobZ)
        GetMobByID(ID.mob.TEMENOS_C_MOB[5]+35):setPos(mobX, mobY, mobZ)
        SpawnMob(ID.mob.TEMENOS_C_MOB[5]+35):updateEnmity(player)
    end
end
