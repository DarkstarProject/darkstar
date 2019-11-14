-----------------------------------
-- Area: Apollyon SW
--  Mob: Armoury Crate
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobInitialize(mob)
    --mob:setMobMod(dsp.mobMod.DRAW_IN, 2) -- need to set a maximum distance for draw-in
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        if battlefield:getLocalVar("mimicKilled") == 0 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            battlefield:setLocalVar("mimicKilled", 1)
        end
    end
end

function onMobDespawn(mob)
    if mob:getBattlefield() then
        local mobID = mob:getID()
        local mimicSpawned = mob:getBattlefield():getLocalVar("mimicSpawned")
        if mobID == ID.mob.APOLLYON_SW_MOB[3] then
            mob:getBattlefield():setLocalVar("mimicSpawned", mimicSpawned-1)
        elseif mobID == ID.mob.APOLLYON_SW_MOB[3]+1 then
            mob:getBattlefield():setLocalVar("mimicSpawned", mimicSpawned-2)
        elseif mobID == ID.mob.APOLLYON_SW_MOB[3]+2 then
            mob:getBattlefield():setLocalVar("mimicSpawned", mimicSpawned-4)
        end
    end
end