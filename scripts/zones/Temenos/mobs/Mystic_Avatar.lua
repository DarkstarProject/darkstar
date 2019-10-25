-----------------------------------
-- Area: Temenos E T
--  Mob: Mystic Avatar
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):updateEnmity(target)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+3):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+9):isDead() then
            mob:setMod(dsp.mod.FIREDEF, -128)
        else
            mob:setMod(dsp.mod.FIREDEF, 256)
        end

        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+4):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+11):isDead() then
            mob:setMod(dsp.mod.ICEDEF, -128)
        else
            mob:setMod(dsp.mod.ICEDEF, 256)
        end

        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+5):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+12):isDead() then
            mob:setMod(dsp.mod.WINDDEF, -128)
        else
            mob:setMod(dsp.mod.WINDDEF, 256)
        end

        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+6):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+13):isDead() then
            mob:setMod(dsp.mod.EARTHDEF, -128)
        else
            mob:setMod(dsp.mod.EARTHDEF, 256)
        end

        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+7):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+14):isDead() then
            mob:setMod(dsp.mod.THUNDERDEF, -128)
        else
            mob:setMod(dsp.mod.THUNDERDEF, 256)
        end

        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+8):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+15):isDead() then
            mob:setMod(dsp.mod.WATERDEF, -128)
        else
            mob:setMod(dsp.mod.WATERDEF, 256)
        end

        mob:setMod(dsp.mod.LIGHTDEF, 256)
        mob:setMod(dsp.mod.DARKDEF, -128)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()

    if mobID == ID.mob.TEMENOS_E_MOB[1]+4 then --Ifrit
        GetNPCByID(ID.npc.COFFER_OFFSET+40):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+40):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_E_MOB[2]+4 then --Shiva
        GetNPCByID(ID.npc.COFFER_OFFSET+45):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+45):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_E_MOB[3]+4 then --Garuda
        GetNPCByID(ID.npc.COFFER_OFFSET+46):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+46):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_E_MOB[4]+4 then --Titan
        GetNPCByID(ID.npc.COFFER_OFFSET+47):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+47):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_E_MOB[5]+4 then --Ramuh
        GetNPCByID(ID.npc.COFFER_OFFSET+68):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+68):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_E_MOB[6]+4 then --Leviathan
        GetNPCByID(ID.npc.COFFER_OFFSET+69):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+69):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_E_MOB[7]+2 then --Fenrir
        GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):isDead() then
            GetNPCByID(ID.npc.COFFER_OFFSET+77):setPos(0.5, -6, -459)
            GetNPCByID(ID.npc.COFFER_OFFSET+77):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.GATE_OFFSET+19):setStatus(dsp.status.NORMAL)
        end
    end
end
