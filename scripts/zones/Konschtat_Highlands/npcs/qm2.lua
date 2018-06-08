-----------------------------------
-- Area: Konschtat Highlands
--  NPC: qm2 (???)
-- Involved in Quest: Forge Your Destiny
-- !pos -709 2 102 108
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Konschtat_Highlands/TextIDs");
require("scripts/zones/Konschtat_Highlands/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 1151) and not GetMobByID(FORGER):isSpawned()) then -- Oriental Steel
        SpawnMob(FORGER):updateClaim(player);
        player:confirmTrade();
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
