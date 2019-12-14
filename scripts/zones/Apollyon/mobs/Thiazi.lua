-----------------------------------
-- Area: Apollyon NE
--  Mob: Thiazi
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF2 = battlefield:getLocalVar("randomF2")
        if randomF2 == mobID then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[2][1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[2][1]):setStatus(dsp.status.NORMAL)
        elseif randomF2+1 == mobID then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            battlefield:setLocalVar("portalTriggerF3", ID.mob.APOLLYON_NE_MOB[3])
            battlefield:setLocalVar("itemF3", ID.mob.APOLLYON_NE_MOB[3]+1)
            if #players > 6 then
                for i = 5, 9 do
                    GetMobByID(ID.mob.APOLLYON_NE_MOB[3]+i):spawn()
                end
                battlefield:setLocalVar("portalTriggerF3", ID.mob.APOLLYON_NE_MOB[3]+(math.random(0,1)*5))
                battlefield:setLocalVar("itemF3", ID.mob.APOLLYON_NE_MOB[3]+1+(math.random(0,1)*5))
            end
            if #players > 12 then
                for i = 10, 14 do
                    GetMobByID(ID.mob.APOLLYON_NE_MOB[3]+i):spawn()
                end
                battlefield:setLocalVar("portalTriggerF3", ID.mob.APOLLYON_NE_MOB[3]+(math.random(0,2)*5))
                battlefield:setLocalVar("itemF3", ID.mob.APOLLYON_NE_MOB[3]+1+(math.random(0,2)*5))
            end
            GetNPCByID(ID.npc.APOLLYON_NE_PORTAL[2]):setAnimation(8)
        end
    end
end