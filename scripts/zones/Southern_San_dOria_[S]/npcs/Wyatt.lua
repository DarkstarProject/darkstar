-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Wyatt
-- @zone 80
-- @pos 124 0 84
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 4 and trade:hasItemQty(2506,4)) then
        player:startEvent(0x0004);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local seeingSpots = player:getQuestStatus(CRYSTAL_WAR,SEEING_SPOTS);
    if (seeingSpots == QUEST_AVAILABLE) then
        player:startEvent(0x0002);
    elseif (seeingSpots == QUEST_ACCEPTED) then
        player:startEvent(0x0003);
    else
        player:showText(npc, WYATT_DIALOG);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0002) then
        player:addQuest(CRYSTAL_WAR,SEEING_SPOTS);
    elseif (csid == 0x0004) then
        player:tradeComplete();
        if (player:getQuestStatus(CRYSTAL_WAR,SEEING_SPOTS) == QUEST_ACCEPTED) then
            player:addTitle(LADY_KILLER);
            player:addGil(GIL_RATE*3000);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
            player:completeQuest(CRYSTAL_WAR,SEEING_SPOTS);
        else
            player:addTitle(LADY_KILLER);
            player:addGil(GIL_RATE*3000);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
        end
    end
end;
