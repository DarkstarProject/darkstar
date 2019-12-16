-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
--  Mob: Brittle Rock
-----------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.DMG,-98)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    mob:SetAutoAttackEnabled(false)
    mob:setMod(dsp.mod.DEF,1500)
    mob:setMod(dsp.mod.MDEF,900)
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if mob:getID() == ID.mob[21].BRITTLE_ROCK1 then
        instance:getEntity(bit.band(ID.npc._1rx, 0xFFF), dsp.objType.NPC):setAnimation(8)
    elseif mob:getID() == ID.mob[21].BRITTLE_ROCK2 then
        instance:getEntity(bit.band(ID.npc._1ry, 0xFFF), dsp.objType.NPC):setAnimation(8)
    elseif mob:getID() == ID.mob[21].BRITTLE_ROCK3 then
        instance:getEntity(bit.band(ID.npc._1rz, 0xFFF), dsp.objType.NPC):setAnimation(8)
    elseif mob:getID() == ID.mob[21].BRITTLE_ROCK4 then
        instance:getEntity(bit.band(ID.npc._jr0, 0xFFF), dsp.objType.NPC):setAnimation(8)
    elseif mob:getID() == ID.mob[21].BRITTLE_ROCK5 then
        instance:getEntity(bit.band(ID.npc._jr1, 0xFFF), dsp.objType.NPC):setAnimation(8)
    end
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end