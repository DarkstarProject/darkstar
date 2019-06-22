-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 60)
end

function onMobSpawn(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.BEHEMOTH_QM):setStatus(dsp.status.DISAPPEAR)
    end

    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(dsp.magic.aoe.RADIAL)
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BEHEMOTH_DETHRONER)
end

function onMobDespawn(mob)
    -- Set King_Behemoth's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]King_Behemoth", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]King_Behemoth", 0)
        DisallowRespawn(ID.mob.BEHEMOTH, false)
        UpdateNMSpawnPoint(ID.mob.BEHEMOTH)
        GetMobByID(ID.mob.BEHEMOTH):setRespawnTime(75600 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end
