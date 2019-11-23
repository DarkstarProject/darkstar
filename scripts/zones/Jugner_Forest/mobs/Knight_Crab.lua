-----------------------------------
-- Area: Jugner Forest
--  Mob: Knight Crab
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    -- If respawn and variable is not 0, then it respawned before someone killed all 10 crabs
    local kingArthro = GetMobByID(ID.mob.KING_ARTHRO)
    local pop = kingArthro:getLocalVar("[POP]King_Arthro")

    if pop > 0 then
        kingArthro:setLocalVar("[POP]King_Arthro", pop - 1)
    end

    -- 5 minute rage timer (ffxiah says 5, ffxiclopedia says 5-10, bg doesn't say at all)
    mob:setLocalVar("[rage]timer", 300)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local kingArthro = GetMobByID(ID.mob.KING_ARTHRO)
    local pop = kingArthro:getLocalVar("[POP]King_Arthro")

    kingArthro:setLocalVar("[POP]King_Arthro", pop + 1)

    if pop == 10 then
        kingArthro:setLocalVar("[POP]King_Arthro", 0)
        SpawnMob(ID.mob.KING_ARTHRO)
    end
end
