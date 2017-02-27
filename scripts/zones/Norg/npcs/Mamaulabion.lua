-----------------------------------
-- Area: Norg
-- NPC: Mamaulabion
-- Starts and finishes Quest: Mama Mia
-- @zone 252
-- @pos -57 -9 68 (88)

--CSIDs for Mamaulabion
--0x005D / 93 = Standard
--0x00BF / 191 = start quest
--0x00C0 / 192 = quest accepted
--0x00C1 / 193 = given an item
--0x00C2 / 194 = given an item you already gave
--0x00C3 / 195 = all 7 items given
--0x00C4 / 196 = after 7 items, but need more time until reward is given
--0x00C5 / 197 = reward
--0x00C6 / 198 = after quest is complete
--0x00F3 / 243 = get new ring if you dropped yours

--I did alot of copy/pasting, so you may notice a reduncency on comments XD
--But it can make it easier to follow aswell.

--"Mamaulabion will inform you of the items delivered thus far, as of the May 2011 update."
--i have no clue where this event is, so i have no idea how to add this (if this gets scripted, please remove this comment)

--"Upon completion of this quest, the above items no longer appear in the rewards list for defeating the Prime Avatars."
--will require changing other avatar quests and making a variable for it all. (if this gets scripted, please remove this comment)

-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(OUTLANDS,MAMA_MIA) == QUEST_ACCEPTED) then
        local tradesMamaMia = player:getVar("tradesMamaMia")
        if (trade:hasItemQty(1202,1) and trade:getItemCount() == 1) then -- Trade Bubbly water
            wasSet = player:getMaskBit(tradesMamaMia,0)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",0,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end
                
        elseif (trade:hasItemQty(1203,1) and trade:getItemCount() == 1) then -- Trade Egil's torch
            wasSet = player:getMaskBit(tradesMamaMia,1)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",1,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end
                        
        elseif (trade:hasItemQty(1204,1) and trade:getItemCount() == 1) then -- Trade Eye of mept
            wasSet = player:getMaskBit(tradesMamaMia,2)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",2,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end
            
        elseif (trade:hasItemQty(1205,1) and trade:getItemCount() == 1) then -- Trade Desert Light
            wasSet = player:getMaskBit(tradesMamaMia,3)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",3,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end
                
        elseif (trade:hasItemQty(1206,1) and trade:getItemCount() == 1) then -- Trade Elder Branch
            wasSet = player:getMaskBit(tradesMamaMia,4)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",4,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end
                
        elseif (trade:hasItemQty(1207,1) and trade:getItemCount() == 1) then -- Trade Rust 'B' Gone
            wasSet = player:getMaskBit(tradesMamaMia,5)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",5,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end
                
        elseif (trade:hasItemQty(1208,1) and trade:getItemCount() == 1) then -- Trade Ancients' Key
            wasSet = player:getMaskBit(tradesMamaMia,6)
            tradesMamaMia = player:setMaskBit(tradesMamaMia,"tradesMamaMia",6,true)
            if (player:isMaskFull(tradesMamaMia,7) == true) then
                player:startEvent(0x00C3); -- Traded all seven items
            elseif (wasSet) then
                player:startEvent(0x00C2); -- Traded an item you already gave
            else
                player:startEvent(0x00C1); -- Traded an item
            end    
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local MamaMia = player:getQuestStatus(OUTLANDS,MAMA_MIA);
    local moonlitPath = player:getQuestStatus(WINDURST,THE_MOONLIT_PATH);
    local EvokersRing = player:hasItem(14625);
    local realday = tonumber(os.date("%j"));  -- %M for next minute, %j for next day
    local questday = player:getVar("MamaMia_date")
    
    
        
    if (MamaMia == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 4 and moonlitPath == QUEST_COMPLETED) then 
        player:startEvent(0x00BF); -- Start Quest "Mama Mia"
        
    elseif (MamaMia == QUEST_ACCEPTED) then
    local tradesMamaMia = player:getVar("tradesMamaMia")
    local maskFull = player:isMaskFull(tradesMamaMia,7)
        if (maskFull) then
            if (realday == questday) then
                player:startEvent(0x00C4); --need to wait longer for reward
            elseif (questday ~= 0) then
                player:startEvent(0x00C5); --Reward
            end
        else
            player:startEvent(0x00C0); -- During Quest "Mama Mia"
        end
    
    elseif (MamaMia == QUEST_COMPLETED and EvokersRing) then
        player:startEvent(0x00C6); -- New standard dialog after "Mama Mia" is complete
        
    elseif (MamaMia == QUEST_COMPLETED and EvokersRing == false) then
        player:startEvent(0x00F3); -- Quest completed, but dropped ring
        
    else
        player:startEvent(0x005D); -- Standard dialog
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00BF) then
        player:addQuest(OUTLANDS,MAMA_MIA);
        
    elseif (csid == 0x00C1) then
        player:tradeComplete();
            
    elseif (csid == 0x00C3) then
        player:tradeComplete();
        player:setVar("MamaMia_date", os.date("%j")); -- %M for next minute, %j for next day
    
    elseif (csid == 0x00C5) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14625); -- Evokers Ring
        else
            player:addItem(14625); -- Evokers Ring
            player:messageSpecial(ITEM_OBTAINED,14625); -- Evokers Ring
            player:addFame(NORG,30); --idk how much fame the quest adds, just left at 30 which the levi quest gave.
            player:completeQuest(OUTLANDS,MAMA_MIA);
            player:setVar("tradesMamaMia",0)
        end
        
    elseif (csid == 0x00F3) then
        if (option == 1) then
            player:delQuest(OUTLANDS,MAMA_MIA);
            player:addQuest(OUTLANDS,MAMA_MIA);
        end
    end
end;