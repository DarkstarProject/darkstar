-----------------------------------
-- Area: Behemoth's Dominion
--  NPC: qm2 (???)
-- Spawns Behemoth or King Behemoth
-- !pos -267 -19 74 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Behemoths_Dominion/TextIDs")
require("scripts/zones/Behemoths_Dominion/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
    if LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1 then
        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrade(player,npc,trade)
    if not GetMobByID(BEHEMOTH):isSpawned() and not GetMobByID(KING_BEHEMOTH):isSpawned() then
        if LandKingSystem_NQ ~= 0 and npcUtil.tradeHas(trade, 3341) and npcUtil.popFromQM(player, npc, BEHEMOTH) then
            player:confirmTrade()
        elseif LandKingSystem_HQ ~= 0 and npcUtil.tradeHas(trade, 3342) and npcUtil.popFromQM(player, npc, KING_BEHEMOTH) then
            player:confirmTrade()        
        end
    end
end

function onTrigger(player,npc)
    player:messageSpecial(IRREPRESSIBLE_MIGHT)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end