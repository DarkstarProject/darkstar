-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? Used to spawn Edacious Opo-opo
-- !pos 545.7346 0.1819 -433.2258
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
    local spawnChance = math.random(100)
    local nm = GetMobByID(ID.mob.EDACIOUS_OPO_OPO)
    if npcUtil.tradeHas(trade, 4468) and not nm:isSpawned() then -- Pamamas
        if spawnChance <= 5 then
            player:confirmTrade()
            player:messageSpecial(ID.text.FAINT_CRY)
            SpawnMob(ID.mob.EDACIOUS_OPO_OPO):updateClaim(player)
            npc:setStatus(dsp.status.DISAPPEAR)
        else
            player:confirmTrade()
            player:messageSpecial(ID.text.PAMAMAS)
        end
     elseif npcUtil.tradeHas(trade, 4596) and not nm:isSpawned() then -- Wild Pamamas
        if spawnChance <= 50 then
            player:confirmTrade()
            player:messageSpecial(ID.text.FAINT_CRY)
            SpawnMob(ID.mob.EDACIOUS_OPO_OPO):updateClaim(player)
            npc:setStatus(dsp.status.DISAPPEAR)
        else
            player:confirmTrade()
            player:messageSpecial(ID.text.PAMAMAS)
        end
    end
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.WATER_HOLE)
end

function onEventUpdate(player,csid,option)

end

function onEventFinish(player,csid,option)

end
