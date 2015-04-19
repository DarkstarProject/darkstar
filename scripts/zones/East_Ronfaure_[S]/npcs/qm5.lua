-----------------------------------
-- Area: East Ronfaure [S]
-- NPC:  qm5 "???"
-- Involved in Quests: Steamed Rams
-- @pos 380.015 -26.5 -22.525
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/campaign");
require("scripts/zones/East_Ronfaure_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR,STEAMED_RAMS) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(OXIDIZED_PLATE)) then
            player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        else
            player:startEvent(0x0003);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- print("CSID:",csid);
    -- print("RESULT:",option);
    if (csid == 0x0003) then
        player:addKeyItem(OXIDIZED_PLATE);
        player:messageSpecial(KEYITEM_OBTAINED,OXIDIZED_PLATE);
    end
end;