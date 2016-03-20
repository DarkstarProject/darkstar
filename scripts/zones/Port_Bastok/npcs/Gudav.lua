-----------------------------------
-- Area: Port Bastok
-- NPC: Gudav
-- Starts Quests: A Foreman's Best Friend
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(13096,1) and trade:getItemCount() == 1) then
        if (player:getQuestStatus(BASTOK,A_FOREMAN_S_BEST_FRIEND) == QUEST_ACCEPTED) then
            player:tradeComplete();
            player:startEvent(0x0070);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getMainLvl() >= 7 and player:getQuestStatus(BASTOK,A_FOREMAN_S_BEST_FRIEND) == QUEST_AVAILABLE) then
        player:startEvent(0x006e);
    else
        player:startEvent(0x001f);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x006e) then
        player:addQuest(BASTOK,A_FOREMAN_S_BEST_FRIEND);
    elseif (csid == 0x0070) then
        if (player:hasKeyItem(MAP_OF_THE_GUSGEN_MINES) == false) then
            player:addKeyItem(MAP_OF_THE_GUSGEN_MINES);
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_GUSGEN_MINES);
        end
        player:addFame(BASTOK,60);
        player:completeQuest(BASTOK,A_FOREMAN_S_BEST_FRIEND);
    end
    
end;