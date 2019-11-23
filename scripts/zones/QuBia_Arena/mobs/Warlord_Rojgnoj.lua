-----------------------------------
-- Area: QuBia_Arena
--  Mob: Warlord Rojgnoj
-- Mission 9-2 SANDO
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
local ID = require("scripts/zones/QuBia_Arena/IDs")

function onMobInitialize(mob)
    mob:addMod(dsp.mod.SLEEPRES,50)
end

function onMobDeath(mob, player, isKiller)
    local inst = mob:getBattlefield():getArea()
    local instOffset = ID.mob.HEIR_TO_THE_LIGHT_OFFSET + (14 * (inst-1))
    if GetMobByID(instOffset + 0):isDead() and GetMobByID(instOffset + 1):isDead()
        and GetMobByID(instOffset + 2):isDead()
    then
        mob:getBattlefield():setLocalVar("loot", 0)
    end
end
