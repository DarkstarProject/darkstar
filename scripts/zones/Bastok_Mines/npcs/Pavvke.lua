-----------------------------------
-- Area: Bastok Mines
-- NPC: Pavvke
-- Starts Quests: Fallen Comrades (100%)
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
SilverTag = trade:hasItemQty(13116,1);
Fallen = player:getQuestStatus(BASTOK,FALLEN_COMRADES);

    if (Fallen == 1 and SilverTag == true and count == 1) then
        player:tradeComplete();
        player:startEvent(0x005b);
    elseif (Fallen == 2 and SilverTag == true and count == 1) then
        player:tradeComplete();
        player:startEvent(0x005c);
    end        
            
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Fallen = player:getQuestStatus(BASTOK,FALLEN_COMRADES);
pLevel = player:getMainLvl(player);
pFame = player:getFameLevel(BASTOK);
    
    if (Fallen == 0    and pLevel >= 12 and pFame >= 2) then
        player:startEvent(0x005a);
    else 
        player:startEvent(0x004b);
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
    
    if (csid == 0x005a) then
        player:addQuest(BASTOK,FALLEN_COMRADES);
    elseif (csid == 0x005b) then
        player:completeQuest(BASTOK,FALLEN_COMRADES);
        player:addFame(BASTOK,120);
        player:addGil(GIL_RATE*550);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*550);
    elseif (csid == 0x005c) then
        player:addFame(BASTOK,8);
        player:addGil(GIL_RATE*550);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*550);
    end
        
end;




