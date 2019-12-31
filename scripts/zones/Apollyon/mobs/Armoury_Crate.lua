-----------------------------------
-- Area: Apollyon SW
--  Mob: Armoury Crate
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobInitialize(mob)
    --mob:setMobMod(dsp.mobMod.DRAW_IN, 2) -- need to set a maximum distance for draw-in
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetNPCByID(ID.npc.APOLLYON_SW_PORTAL[3]):getAnimation() ~= dsp.animation.OPEN_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.APOLLYON_SW_PORTAL[3])
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