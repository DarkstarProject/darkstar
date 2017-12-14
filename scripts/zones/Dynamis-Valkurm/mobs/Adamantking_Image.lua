-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Adamantking_Image
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Valkurm/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local effect = player:getStatusEffect(EFFECT_DYNAMIS)
    if effect then
        if mob:getMainLvl() < 85 then
            if not player:hasKeyItem(AZURE_GRANULES_OF_TIME) then
                effect:setDuration(effect:getDuration() + 10 * 60 * 1000)
                player:messageSpecial(DYNAMIS_TIME_EXTEND,10)
            end
        else
            if not player:hasKeyItem(OBSIDIAN_GRANULES_OF_TIME) then
                effect:setDuration(effect:getDuration() + 20 * 60 * 1000)
                player:messageSpecial(DYNAMIS_TIME_EXTEND,20)
            end
        end
    end
end;
