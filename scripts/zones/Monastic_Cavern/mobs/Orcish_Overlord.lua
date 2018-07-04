-----------------------------------
-- Area: Monastic Cavern
--   NM: Orcish Overlord
-- Note: PH for Overlord Bakgodek
-- TODO: messages should be zone-wide
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/zones/Monastic_Cavern/TextIDs")
require("scripts/zones/Monastic_Cavern/MobIDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    -- the quest version of this NM doesn't drop gil
    if (mob:getID() >= UNDERSTANDING_OVERLORD_OFFSET) then
        mob:setMobMod(dsp.mobMod.GIL_MAX, -1)
    end
end

function onMobEngaged(mob,target)
    mob:showText(mob, ORCISH_OVERLORD_ENGAGE)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        mob:showText(mob, ORCISH_OVERLORD_DEATH)
    end
end

function onMobDespawn(mob)
    local nqId = mob:getID()

    -- the quest version of this NM doesn't respawn or count toward hq nm
    if nqId == ORCISH_OVERLORD then
        local hqId = mob:getID() + 1
        local ToD = GetServerVariable("[POP]Overlord_Bakgodek")
        local kills = GetServerVariable("[PH]Overlord_Bakgodek")
        local popNow = (math.random(1,5) == 3 or kills > 6)

        if os.time() > ToD and popNow then
            DisallowRespawn(nqId, true)
            DisallowRespawn(hqId, false)
            UpdateNMSpawnPoint(hqId)
            GetMobByID(hqId):setRespawnTime(math.random(75600, 86400))
        else
            UpdateNMSpawnPoint(nqId)
            mob:setRespawnTime(math.random(75600, 86400))
            SetServerVariable("[PH]Overlord_Bakgodek", kills + 1)
        end
    end
end