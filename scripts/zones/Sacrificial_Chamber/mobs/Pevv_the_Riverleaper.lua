-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Pevv the Riverleaper
-- BCNM: Amphibian Assault
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobFight(mob, target)
    -- spawn pet wyvern and assign it a target
    local mobId = mob:getID()
    local pet = GetMobByID(mobId + 2)
    if not pet:isSpawned() then
        SpawnMob(mobId + 2):updateEnmity(target)
    elseif pet:getCurrentAction() == dsp.act.ROAMING then
        pet:updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID() + 2)
end
