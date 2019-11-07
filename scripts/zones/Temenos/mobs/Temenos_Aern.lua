-----------------------------------
-- Area: Temenos
--  Mob: Temenos Aern
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local random = math.random(0,3)
        local battlefield = player:getBattlefield()
        
        switch (mobID): caseof {
            [ID.mob.TEMENOS_C_MOB[5]+19] = function()
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][2]):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][2]):setStatus(dsp.status.NORMAL)
            end,
            [ID.mob.TEMENOS_C_MOB[5]+20] = function()
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][3]):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][3]):setStatus(dsp.status.NORMAL)
            end,
            [ID.mob.TEMENOS_C_MOB[5]+29] = function()
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][4]):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][4]):setStatus(dsp.status.NORMAL)
            end,
            [ID.mob.TEMENOS_C_MOB[5]+30] = function()
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][5]):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][5]):setStatus(dsp.status.NORMAL)
            end,
        }
        local leftAern=0
        local AernList = 
        {
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
            GetMobByID(ID.mob.TEMENOS_C_MOB[5]+35):setSpawn(mobX, mobY, mobZ)
            GetMobByID(ID.mob.TEMENOS_C_MOB[5]+35):setPos(mobX, mobY, mobZ)
            SpawnMob(ID.mob.TEMENOS_C_MOB[5]+35):updateEnmity(player)
            battlefield:setLocalVar("lootSpawned", 1)
        end
    end
end
