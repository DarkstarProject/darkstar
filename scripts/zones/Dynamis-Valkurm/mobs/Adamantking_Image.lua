-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Adamantking_Image
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Dynamis-Valkurm/TextIDs")
require("scripts/zones/Dynamis-Valkurm/MobIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/dynamis")
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
    local effect = player:getStatusEffect(dsp.effect.DYNAMIS)
    if effect then
        if mob:getMainLvl() < 85 then
            dynamis.addExtension(player, dsp.ki.AZURE_GRANULES_OF_TIME, 10)
        else
            dynamis.addExtension(player, dsp.ki.OBSIDIAN_GRANULES_OF_TIME, 20)
        end
    end

    if mob:getMainLvl() > 85 then
        DisallowRespawn(mob:getID(), true)
        local newTEMob = TE5_RANDOM[math.random(#TE5_RANDOM)] -- Randomly select new TE5 mob
        DisallowRespawn(newTEMob, false)
        GetMobByID(newTEMob):setRespawnTime(85)
    end
end
