-----------------------------------
-- Area: Xarcabard
-- NPC:  qm1 (???)
-- Involved in Quests: The Three Magi
-- !pos -331 -29 -49 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Xarcabard/TextIDs")
require("scripts/zones/Xarcabard/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if
        player:getQuestStatus(WINDURST,THE_THREE_MAGI) == QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, 613) and
        not player:hasItem(1104) and
        not GetMobByID(CHAOS_ELEMENTAL):isSpawned()
    then
        player:confirmTrade()
        SpawnMob(CHAOS_ELEMENTAL):updateClaim(player)
        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end