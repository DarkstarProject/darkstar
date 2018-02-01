-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  qm2 (???)
-- Involved In Quest: Messenger from Beyond
-- !pos -716 -10 66 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valkurm_Dunes/TextIDs");
require("scripts/zones/Valkurm_Dunes/MobIDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (not GetMobByID(MARCHELUTE):isSpawned() and player:getQuestStatus(SANDORIA,MESSENGER_FROM_BEYOND) == QUEST_ACCEPTED and not player:hasItem(1096)) then
        SpawnMob(MARCHELUTE):updateClaim(player);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
