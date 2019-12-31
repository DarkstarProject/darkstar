-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Princess Pudding
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    local instance = mob:getInstance()
    local slot = instance:getEntity(bit.band(ID.npc[2][2].SLOT, 0xFFF), dsp.objType.NPC)
        slot:setStatus(dsp.status.DISAPPEAR)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
