-----------------------------------
-- Area: Apollyon NW
--  Mob: Mountain Buffalo
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    if isKiller then
        local battlefield = player:getBattlefield()
        local randomF2 = battlefield:getLocalVar("randomF2")
        if mobID == randomF2 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            battlefield:setLocalVar("randomF3", ID.mob.APOLLYON_NW_MOB[3]+math.random(1,8))
            GetNPCByID(ID.npc.APOLLYON_NW_PORTAL[2]):setAnimation(8)
        end
    end
end