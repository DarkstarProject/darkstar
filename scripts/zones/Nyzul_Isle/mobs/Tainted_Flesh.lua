-----------------------------------
--  MOB: Tainted Flesh
-- Area: Nyzul Isle
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/zones/Nyzul_Isle/globals")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    local instance = mob:getInstance()
    if instance:getStage() == nyzul.objective.ELIMINATE_SPECIFIED_ENEMY then
        if instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):getLocalVar("Nyzul_Specified_Enemy") == mob:getID() then
            mob:setMobMod(dsp.mobMod.CHECK_AS_NM, 1)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if instance:getStage() == nyzul.objective.ELIMINATE_SPECIFIED_ENEMY and isKiller then
        if instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):getLocalVar("Nyzul_Specified_Enemy") == mob:getID() then
            instance:setProgress(15)
        end
    elseif instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
        instance:setProgress(instance:getProgress() + 1)
    end
end