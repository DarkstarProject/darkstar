-----------------------------------
-- Area: Apollyon NE
--  Mob: Borametz
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if mob:getID() == ID.mob.APOLLYON_NE_MOB[1]+2 then
        if isKiller then
            local battlefield = player:getBattlefield()
            local randomF1 = battlefield:getLocalVar("randomF1")
            if randomF1 == 3 or randomF1 == 6 then
                local mobX = mob:getXPos()
                local mobY = mob:getYPos()
                local mobZ = mob:getZPos()
                GetNPCByID(ID.npc.APOLLYON_NE_CRATE[1][1]):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.APOLLYON_NE_CRATE[1][1]):setStatus(dsp.status.NORMAL)
            elseif randomF1 == 4 or randomF1 == 5 then
                local players = battlefield:getPlayers()
                for i, member in pairs(players) do
                    member:messageSpecial(ID.text.GATE_OPEN)
                    member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
                end
                battlefield:setLocalVar("randomF2", ID.mob.APOLLYON_NE_MOB[2]+math.random(0,2))
                battlefield:setLocalVar("portalF1", 1)
            end
        end
    end
end