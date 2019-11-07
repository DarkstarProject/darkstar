-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Beetle
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(0,1) == 1

        if GetNPCByID(ID.npc.GATE_OFFSET+16):getStatus() ~= dsp.status.NORMAL then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.GATE_OFFSET+16):setStatus(dsp.status.NORMAL)
        end

        for i = 0, 8 do
            if spawn and mobID == ID.mob.TEMENOS_W_MOB[3]+i
                and GetNPCByID(ID.npc.TEMENOS_W_CRATE[3]+(i%2)):getStatus() == dsp.status.DISAPPEAR
            then
                GetNPCByID(ID.npc.TEMENOS_W_CRATE[3]+(i%2)):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[3]+(i%2), player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"))
            end
        end
    end
end
