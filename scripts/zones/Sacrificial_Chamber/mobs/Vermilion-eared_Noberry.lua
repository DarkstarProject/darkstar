-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Vermilion-eared_Noberry
-- BCNM: Jungle Boogymen
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 3):getShortID())
end

function onMobDeath(mob, player, isKiller)
    local elementalId = mob:getID() + 1
    if GetMobByID(elementalId):isSpawned() then
        DespawnMob(elementalId)
    end
end