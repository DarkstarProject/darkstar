-----------------------------------
-- Area: Temenos E T
--  Mob: Mystic Avatar
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobSpawn(mob)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        mob:setMod(dsp.mod.FIREDEF, 256)
        mob:setMod(dsp.mod.ICEDEF, 256)
        mob:setMod(dsp.mod.WINDDEF, 256)
        mob:setMod(dsp.mod.EARTHDEF, 256)
        mob:setMod(dsp.mod.THUNDERDEF, 256)
        mob:setMod(dsp.mod.WATERDEF, 256)
        mob:setMod(dsp.mod.LIGHTDEF, 256)
        mob:setMod(dsp.mod.DARKDEF, -128)
    end
end

function onMobEngaged(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local battlefield = player:getBattlefield()
    local cofferMask = battlefield:getLocalVar("cofferMask")

    if mobID == ID.mob.TEMENOS_E_MOB[1]+4 then --Ifrit
        if cofferMask == 0 then
            player:messageSpecial(ID.text.GATE_OPEN)
            player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            GetNPCByID(ID.npc.GATE_OFFSET+7):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 1) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+173):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 2) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+215):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 4) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+40):setStatus(dsp.status.NORMAL)
        end
        battlefield:setLocalVar("cofferMask", 0)
    elseif mobID == ID.mob.TEMENOS_E_MOB[2]+4 then --Shiva
        if cofferMask == 0 then
            player:messageSpecial(ID.text.GATE_OPEN)
            player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            GetNPCByID(ID.npc.GATE_OFFSET+8):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 1) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+174):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 2) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+216):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 4) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+45):setStatus(dsp.status.NORMAL)
        end
        battlefield:setLocalVar("cofferMask", 0)
    elseif mobID == ID.mob.TEMENOS_E_MOB[3]+4 then --Garuda
        if cofferMask == 0 then
            player:messageSpecial(ID.text.GATE_OPEN)
            player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            GetNPCByID(ID.npc.GATE_OFFSET+9):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 1) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+181):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 2) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+217):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 4) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+46):setStatus(dsp.status.NORMAL)
        end
        battlefield:setLocalVar("cofferMask", 0)
    elseif mobID == ID.mob.TEMENOS_E_MOB[4]+4 then --Titan
        if cofferMask == 0 then
            player:messageSpecial(ID.text.GATE_OPEN)
            player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            GetNPCByID(ID.npc.GATE_OFFSET+10):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 1) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+182):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 2) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+236):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 4) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+47):setStatus(dsp.status.NORMAL)
        end
        battlefield:setLocalVar("cofferMask", 0)
    elseif mobID == ID.mob.TEMENOS_E_MOB[5]+4 then --Ramuh
        if cofferMask == 0 then
            player:messageSpecial(ID.text.GATE_OPEN)
            player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            GetNPCByID(ID.npc.GATE_OFFSET+11):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 1) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+183):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 2) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+261):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 4) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+68):setStatus(dsp.status.NORMAL)
        end
        battlefield:setLocalVar("cofferMask", 0)
    elseif mobID == ID.mob.TEMENOS_E_MOB[6]+4 then --Leviathan
        if cofferMask == 0 then
            player:messageSpecial(ID.text.GATE_OPEN)
            player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            GetNPCByID(ID.npc.GATE_OFFSET+12):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 1) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+202):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 2) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+190):setStatus(dsp.status.NORMAL)
        end
        if bit.band(cofferMask, 4) ~= 0 then
            GetNPCByID(ID.npc.COFFER_OFFSET+69):setStatus(dsp.status.NORMAL)
        end
        battlefield:setLocalVar("cofferMask", 0)
    elseif mobID == ID.mob.TEMENOS_E_MOB[7]+2 then --Fenrir
        GetNPCByID(ID.npc.COFFER_OFFSET+70):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+9 then --Ifrit (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.FIREDEF, -128)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+4):isAlive() then
            DespawnMob(ID.mob.TEMENOS_C_MOB[2]+4)
            SpawnMob(ID.mob.TEMENOS_C_MOB[2]+10)
        end
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+10 then --Shiva (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.ICEDEF, -128)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+5):isAlive() then
            DespawnMob(ID.mob.TEMENOS_C_MOB[2]+5)
            SpawnMob(ID.mob.TEMENOS_C_MOB[2]+11)
        end
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+11 then --Garuda (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.WINDDEF, -128)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+6):isAlive() then
            DespawnMob(ID.mob.TEMENOS_C_MOB[2]+6)
            SpawnMob(ID.mob.TEMENOS_C_MOB[2]+12)
        end
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+12 then --Titan (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.EARTHDEF, -128)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+7):isAlive() then
            DespawnMob(ID.mob.TEMENOS_C_MOB[2]+7)
            SpawnMob(ID.mob.TEMENOS_C_MOB[2]+13)
        end
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+13 then --Ramuh (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.THUNDERDEF, -128)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+8):isAlive() then
            DespawnMob(ID.mob.TEMENOS_C_MOB[2]+8)
            SpawnMob(ID.mob.TEMENOS_C_MOB[2]+14)
        end
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+14 then --Leviathan (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.WATERDEF, -128)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+3):isAlive() then
            DespawnMob(ID.mob.TEMENOS_C_MOB[2]+3)
            SpawnMob(ID.mob.TEMENOS_C_MOB[2]+9)
        end
    elseif mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):isDead() then
            GetNPCByID(ID.npc.COFFER_OFFSET+77):setPos(0.5, -6, -459)
            GetNPCByID(ID.npc.COFFER_OFFSET+77):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.GATE_OFFSET+19):setStatus(dsp.status.NORMAL)
        end
    end
end
