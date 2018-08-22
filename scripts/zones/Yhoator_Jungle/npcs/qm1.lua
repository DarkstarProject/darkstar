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

local spawnChance = math.random(100)

function onTrade(player,npc,trade)
    if trade:hasItemQty(4468,1) then -- Pamamas
        if spawnChance <= 5 then
        player:tradeComplete()
        player:messageSpecial(FAINT_CRY)
        SpawnMob(EDACIOUS_OPO_OPO):updateClaim(player)
        npc:setStatus(dsp.status.DISAPPEAR)
        else
        player:tradeComplete()
        player:messageSpecial(PAMAMAS)
        end
    end
    if trade:hasItemQty(4596,1) then -- Wild Pamamas
        if spawnChance <= 50 then
        player:tradeComplete()
        player:messageSpecial(FAINT_CRY)
        SpawnMob(EDACIOUS_OPO_OPO):updateClaim(player)
        npc:setStatus(dsp.status.DISAPPEAR)
        else
        player:tradeComplete()
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
