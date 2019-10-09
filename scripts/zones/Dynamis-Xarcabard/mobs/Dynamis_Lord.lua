-----------------------------------
-- Area: Dynamis - Xarcabard
--   NM: Dynamis Lord
-- Note: Mega Boss
-- Spawned by trading a Shrouded Bijou to the ??? in front of Castle Zvahl.
-----------------------------------
local ID = require("scripts/zones/Dynamis-Xarcabard/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        between = 60,
        specials =
        {
            {id = dsp.jsa.HUNDRED_FISTS, hpp = 95},
            {id = dsp.jsa.MIGHTY_STRIKES, hpp = 95},
            {id = dsp.jsa.BLOOD_WEAPON, hpp = 95},
            {id = dsp.jsa.CHAINSPELL, hpp = 95},
        },
    })
end

function onMobFight(mob, target)
    local battleTime = mob:getBattleTime()

    for i = 0, 1 do
        local petId = ID.mob.YING + i
        local pet = GetMobByID(petId)

        if battleTime % 90 == 0 and battleTime >= 90 and not pet:isSpawned() then
            pet:setSpawn(-414.282, -44, 20.427)
            pet:spawn()
            pet:updateEnmity(target)
        end

        if pet:getCurrentAction() == dsp.act.ROAMING then
            pet:updateEnmity(target)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
    player:addTitle(dsp.title.LIFTER_OF_SHADOWS)
    if isKiller then
        DespawnMob(ID.mob.YING)
        DespawnMob(ID.mob.YING + 1)
    end
end
