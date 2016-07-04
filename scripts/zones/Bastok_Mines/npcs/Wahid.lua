-----------------------------------
-- Area: Bastok Mines
-- NPC: Wahid
-- Start & Finishes Quest: The Siren's Tear
-- @zone: 234
-- @pos 26.305 -1 -66.403
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

    if (SirensTear ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(576,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0052);
        end
    end        
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

    if (SirensTear == QUEST_AVAILABLE) then
        player:startEvent(0x0051);
    else 
        player:startEvent(0x001c);
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
    
    if (csid == 0x0051) then
        player:addQuest(BASTOK,THE_SIREN_S_TEAR);
    elseif (csid == 0x0052) then
        player:tradeComplete();
        player:completeQuest(BASTOK,THE_SIREN_S_TEAR);
        player:addFame(BASTOK,120);
        player:addGil(150*GIL_RATE);
        player:messageSpecial(GIL_OBTAINED,150*GIL_RATE);
        player:addTitle(TEARJERKER);
        player:setVar("SirensTear",0);
    end
end;