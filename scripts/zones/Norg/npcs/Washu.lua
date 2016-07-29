-----------------------------------
-- Area: Norg
-- NPC:  Washu
-- Involved in Quest: Yomi Okuri
-- Starts and finishes Quest: Stop Your Whining
-- @pos 49 -6 15 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(OUTLANDS,YOMI_OKURI) == QUEST_ACCEPTED and player:getVar("yomiOkuriCS") == 2) then
        -- Trade Giant Sheep Meat, Frost Turnip, Bastore Sardine, Hecteyes Eye
        if (trade:hasItemQty(4372,1) and trade:hasItemQty(4382,1) and (trade:hasItemQty(4360,1) or trade:hasItemQty(5792,1)) and trade:hasItemQty(939,1) and trade:getItemCount() == 4) then 
            player:startEvent(0x0096);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    Whining = player:getQuestStatus(OUTLANDS,STOP_YOUR_WHINING);
    mLvl = player:getMainLvl();

    if (player:getQuestStatus(OUTLANDS,YOMI_OKURI) == QUEST_ACCEPTED) then
        if (player:getVar("yomiOkuriCS") == 1) then
            player:startEvent(0x0094);
        elseif (player:getVar("yomiOkuriCS") == 2) then
            player:startEvent(0x0095);
        elseif (player:getVar("yomiOkuriCS") >= 3) then
            player:startEvent(0x0097);
        end
    elseif (Whining == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 4 and mLvl >= 10) then
        player:startEvent(0x0015); --Start Quest
    elseif (Whining == QUEST_ACCEPTED and player:hasKeyItem(EMPTY_BARREL) == true) then
        player:startEvent(0x0016); --Reminder Dialogue
    elseif (Whining == QUEST_ACCEPTED and player:hasKeyItem(BARREL_OF_OPOOPO_BREW) == true) then
        player:startEvent(0x0017); --Finish Quest
    elseif (Whining == QUEST_COMPLETED) then
        player:startEvent(0x0018); 
    else
        player:startEvent(0x0050);
    end
end;

-- 0x0050  0x0015  0x0016  0x0017  0x0018  0x0094  0x0095  0x0096  0x0097  0x00d1  0x00d2  0x00dd  0x00de  0x00df

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

    if (csid == 0x0094) then
        player:setVar("yomiOkuriCS",2);
    elseif (csid == 0x0096) then
        player:tradeComplete();
        player:addKeyItem(WASHUS_TASTY_WURST);
        player:messageSpecial(KEYITEM_OBTAINED,WASHUS_TASTY_WURST);
        player:setVar("yomiOkuriCS",3);
    elseif (csid == 0x0015 and option == 1) then
        player:addKeyItem(EMPTY_BARREL); --Empty Barrel
        player:addQuest(OUTLANDS,STOP_YOUR_WHINING);
        player:messageSpecial(KEYITEM_OBTAINED,EMPTY_BARREL);
    elseif (csid == 0x0017) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4952); 
        else
            player:delKeyItem(BARREL_OF_OPOOPO_BREW); --Filled Barrel
            player:addItem(4952); -- Scroll of Hojo: Ichi
            player:messageSpecial(ITEM_OBTAINED,4952); -- Scroll of Hojo: Ichi
            player:addFame(OUTLANDS,75);
            player:addTitle(APPRENTICE_SOMMELIER);
            player:completeQuest(OUTLANDS,STOP_YOUR_WHINING);
        end
    end

end;