-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: qm3 "???"
-- Involved in Quests: Steamed Rams
-- !pos 312.821 -30.495 -67.15
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/campaign");
require("scripts/zones/East_Ronfaure_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR,STEAMED_RAMS) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.CHARRED_PROPELLER)) then
            player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        else
            player:startEvent(1);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- print("CSID:",csid);
    -- print("RESULT:",option);
    if (csid == 1) then
        player:addKeyItem(dsp.ki.CHARRED_PROPELLER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CHARRED_PROPELLER);
    end
end;