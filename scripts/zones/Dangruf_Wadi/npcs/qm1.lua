-----------------------------------
-- Area: Dangruf Wadi
--  NPC: qm1
-- Type: spawns Chocoboleech
-- !pos  -430 4 115 191
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Dangruf_Wadi/TextIDs")
require("scripts/zones/Dangruf_Wadi/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    local mob = GetMobByID(CHOCOBOLEECH)

    if not mob:isSpawned() and npcUtil.tradeHas(trade, 1898) then -- fresh blood
        local x = npc:getXPos()
        local y = npc:getYPos()
        local z = npc:getZPos()

        player:confirmTrade()
        SpawnMob(CHOCOBOLEECH):updateClaim(player)
        mob:setPos(x+1, y, z)

        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(SMALL_HOLE)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end