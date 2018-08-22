-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? Used to spawn Edacious Opo-opo
-- !pos 545.7346 0.1819 -433.2258
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/zones/Yhoator_Jungle/TextIDs")
require("scripts/zones/Yhoator_Jungle/MobIDs")
-----------------------------------

function onTrade(player,npc,trade)
    local spawnChance = math.random(100)
    local nm = GetMobByID(EDACIOUS_OPO_OPO)
    if npcUtil.tradeHas(trade, 4468) and not nm:isSpawned() then -- Pamamas
        if spawnChance <= 5 then
            player:confirmTrade()
            player:messageSpecial(FAINT_CRY)
            SpawnMob(EDACIOUS_OPO_OPO):updateClaim(player)
            npc:setStatus(dsp.status.DISAPPEAR)
        else
            player:confirmTrade()
            player:messageSpecial(PAMAMAS)
        end
     elseif npcUtil.tradeHas(trade, 4596) and not nm:isSpawned() then -- Wild Pamamas
        if spawnChance <= 50 then
            player:confirmTrade()
            player:messageSpecial(FAINT_CRY)
            SpawnMob(EDACIOUS_OPO_OPO):updateClaim(player)
            npc:setStatus(dsp.status.DISAPPEAR)
        else
            player:confirmTrade()
            player:messageSpecial(PAMAMAS)
        end
    end
end

function onTrigger(player,npc)
    player:messageSpecial(WATER_HOLE)
end

function onEventUpdate(player,csid,option)

end

function onEventFinish(player,csid,option)

end
