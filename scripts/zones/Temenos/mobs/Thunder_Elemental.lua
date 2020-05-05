-----------------------------------
-- Area: Temenos E T
--  Mob: Thunder Elemental
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Temenos/IDs")
local flags = dsp.path.flag.WALLHACK
local path =
{
    [0] = 
    {
        {-312.000, 0.000, 128.000},
        {-312.000, 0.000, 152.000}
    },
    [1] = 
    {
        {-300.000, 0.000, 152.000},
        {-300.000, 0.000, 128.000}
    },
    [2] = 
    {
        {-248.000, 0.000, 152.000},
        {-248.000, 0.000, 128.000}
    },
    [3] = 
    {
        {-260.000, 0.000, 128.000},
        {-260.000, 0.000, 152.000}
    },
}

function onMobRoam(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[5]
        local pause = mob:getLocalVar("pause")
        if pause < os.time() then
            local point = (mob:getLocalVar("point") % 2)+1
            mob:setLocalVar("point", point)
            mob:pathTo(path[offset][point][1], path[offset][point][2], path[offset][point][3], flags)
            mob:setLocalVar("pause", os.time()+10)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local battlefield = player:getBattlefield()
        if battlefield:getLocalVar("crateOpenedF5") ~= 1 then
            switch (mobID): caseof
            {
                [ID.mob.TEMENOS_E_MOB[5]] = function()
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5], player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
                end,
                [ID.mob.TEMENOS_E_MOB[5]+1] = function()
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]+1):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5]+1, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
                end,
                [ID.mob.TEMENOS_E_MOB[5]+2] = function()
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]+2):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5]+2, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
                end,
                [ID.mob.TEMENOS_E_MOB[5]+3] = function()
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]+3):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5]+3, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
                end,
                [ID.mob.TEMENOS_C_MOB[2]+7] = function()
                    GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.THUNDERDEF, -128)
                    if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+8):isAlive() then
                        DespawnMob(ID.mob.TEMENOS_C_MOB[2]+8)
                        SpawnMob(ID.mob.TEMENOS_C_MOB[2]+14)
                    end
                end,
            }
        end
    end
end