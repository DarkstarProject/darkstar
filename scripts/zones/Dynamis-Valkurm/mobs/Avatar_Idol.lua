-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Manifest_Idol
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Dynamis-Valkurm/TextIDs")
require("scripts/zones/Dynamis-Valkurm/MobIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
    local effect = player:getStatusEffect(dsp.effect.DYNAMIS)
    if effect then
        if mob:getMainLvl() < 85 then
            if not player:hasKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME) then
                npcUtil.giveKeyItem(player, dsp.ki.AMBER_GRANULES_OF_TIME)
                effect:setDuration(effect:getDuration() * 1000 + 10 * 60 * 1000)
                player:messageSpecial(DYNAMIS_TIME_EXTEND,10)
            end
        else
            if not player:hasKeyItem(dsp.ki.OBSIDIAN_GRANULES_OF_TIME) then
                npcUtil.giveKeyItem(player, dsp.ki.OBSIDIAN_GRANULES_OF_TIME)
                effect:setDuration(effect:getDuration() * 1000 + 20 * 60 * 1000)
                player:messageSpecial(DYNAMIS_TIME_EXTEND,20)
            end
        end
    end

    if mob:getMainLvl() > 85 then
        DisallowRespawn(mob:getID(), true)
        local newTEMob = TE5_RANDOM[math.random(#TE5_RANDOM)] -- Randomly select new TE5 mob
        DisallowRespawn(newTEMob, false)
        GetMobByID(newTEMob):setRespawnTime(85)
    end
end