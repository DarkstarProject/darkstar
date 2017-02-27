-----------------------------------
-- Area: Norg
-- NPC:  Jaucribaix
-- Starts and Finishes Quest: Forge Your Destiny, The Sacred Katana, Yomi Okuri, A Thief in Norg!?
-- @pos 91 -7 -8 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    if (player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1153,1) and trade:hasItemQty(1152,1) and count == 2) then -- Trade Sacred branch and Bomb Steel
            player:startEvent(0x001b);
        end
    end
    
    if (player:getQuestStatus(OUTLANDS,THE_SACRED_KATANA) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(HANDFUL_OF_CRYSTAL_SCALES) and trade:hasItemQty(17809,1) and count == 1) then -- Trade Mumeito
            player:startEvent(0x008d);
        end
    end
    
    if (player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(CHARRED_HELM) and trade:hasItemQty(823,1) and count == 1) then -- Trade Gold Thread
            player:startEvent(0x00a2);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local ForgeYourDestiny = player:getQuestStatus(OUTLANDS, FORGE_YOUR_DESTINY);
    local theSacredKatana = player:getQuestStatus(OUTLANDS,THE_SACRED_KATANA);
    local yomiOkuri = player:getQuestStatus(OUTLANDS,YOMI_OKURI);
    local aThiefinNorg = player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG);
    
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();

    if (mLvl >= ADVANCED_JOB_LEVEL and ForgeYourDestiny == QUEST_AVAILABLE) then
        player:startEvent(0x0019,1153,1152); -- Sacred branch, Bomb Steel
    elseif (ForgeYourDestiny == QUEST_ACCEPTED) then
        local swordTimer = player:getVar("ForgeYourDestiny_timer");
        
        if (swordTimer > os.time()) then
            player:startEvent(0x001c,(swordTimer - os.time())/144);    
        elseif (swordTimer < os.time() and swordTimer ~= 0) then
            if (player:getFreeSlotsCount() == 0) then 
                player:messageSpecial(CARRYING_TOO_MUCH_ALREADY);
            else
                player:startEvent(0x001d, 17809); -- Finish Quest "Forge Your Destiny"
            end
        else
            player:startEvent(0x001a);
        end
    elseif (theSacredKatana == QUEST_AVAILABLE and mJob == 12 and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(0x008b); -- Start Quest "The Sacred Katana"
    elseif (theSacredKatana == QUEST_ACCEPTED) then
        if (player:hasItem(17809) == false) then
            player:startEvent(0x008f); -- CS without Mumeito
        else
            player:startEvent(0x008c); -- CS with Mumeito
        end
    elseif (theSacredKatana == QUEST_COMPLETED and yomiOkuri == QUEST_AVAILABLE and mJob == 12 and mLvl >= AF2_QUEST_LEVEL) then 
        if (player:needToZone() or tonumber(os.date("%j")) == player:getVar("Wait1DayForYomiOkuri_date")) then
            player:startEvent(0x008e); -- Need to zone and wait midnight after "The Sacred Katana"
        else
            player:startEvent(0x0092); -- Start Quest "Yomi Okuri"
        end
    elseif (yomiOkuri == QUEST_ACCEPTED) then
        local yomiOkuriCS = player:getVar("yomiOkuriCS");
        local yomotsuFeather = player:hasKeyItem(YOMOTSU_FEATHER);
        if (yomiOkuriCS <= 3 and yomotsuFeather == false) then 
            player:startEvent(0x0093);
        elseif (yomotsuFeather) then 
            player:startEvent(0x0098);
        elseif (yomiOkuriCS == 4 and (tonumber(os.date("%j")) == player:getVar("Wait1DayForYomiOkuri2_date") or player:needToZone())) then
            player:startEvent(0x0099);
        elseif (yomiOkuriCS == 4) then
            player:startEvent(0x009a);
        elseif (yomiOkuriCS == 5 and player:hasKeyItem(YOMOTSU_HIRASAKA)) then
            player:startEvent(0x009b);
        elseif (player:hasKeyItem(FADED_YOMOTSU_HIRASAKA)) then
            player:startEvent(0x009c); -- Finish Quest "Yomi Okuri"
        end
    elseif (yomiOkuri == QUEST_COMPLETED and aThiefinNorg == QUEST_AVAILABLE and mJob == 12 and mLvl >= 50) then 
        if (player:needToZone() or tonumber(os.date("%j")) == player:getVar("Wait1DayForAThiefinNorg_date")) then
            player:startEvent(0x009d); -- Need to zone and wait midnight after "Yomi Okuri"
        else
            player:startEvent(0x009e); -- Start Quest "A Thief in Norg!?"
        end
    elseif (aThiefinNorg == QUEST_ACCEPTED) then
        local aThiefinNorgCS = player:getVar("aThiefinNorgCS");

        if (aThiefinNorgCS < 5) then
            player:startEvent(0x009f);
        elseif (aThiefinNorgCS == 5) then
            player:startEvent(0x00a6);
        elseif (aThiefinNorgCS == 6 and player:hasItem(1166)) then -- Banishing Charm
            player:startEvent(0x00a7); -- Go to the battlefield
        elseif (aThiefinNorgCS == 6) then
            player:startEvent(0x00a8); -- If you delete the item
        elseif (aThiefinNorgCS == 7) then
            player:startEvent(0x00a0);
        elseif (aThiefinNorgCS == 8) then
            player:startEvent(0x00a1);
        elseif (aThiefinNorgCS == 9 and (player:needToZone() or tonumber(os.date("%j")) == player:getVar("Wait1DayForAThiefinNorg2_date"))) then
            player:startEvent(0x00a3);
        elseif (aThiefinNorgCS == 9) then
            player:startEvent(0x00a4); -- Finish Quest "A Thief in Norg!?"
        end
    elseif (aThiefinNorg == QUEST_COMPLETED) then
        player:startEvent(0x00a5); -- New Standard dialog
    else
        player:startEvent(0x0047); -- Standard dialog
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

    if (csid == 0x0019 and option == 1) then
        player:addQuest(OUTLANDS,FORGE_YOUR_DESTINY);
    elseif (csid == 0x001b) then
        player:tradeComplete();
        player:setVar("ForgeYourDestiny_timer", os.time() + 10368); --Add 3 game days
    elseif (csid == 0x001d) then
        player:tradeComplete();
        player:addTitle(BUSHIDO_BLADE);
        player:addItem(17809);
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_SAMURAI, 17809); -- You can now become a samurai
        player:unlockJob(12); -- Samurai Job Unlocked
        player:setVar("ForgeYourDestiny_timer",0);
        player:setVar("ForgeYourDestiny_Event",0);
        player:addFame(NORG, 30);
        player:completeQuest(OUTLANDS, FORGE_YOUR_DESTINY);
    elseif (csid == 0x008b and option == 1) then
        player:addQuest(OUTLANDS,THE_SACRED_KATANA);
    elseif (csid == 0x008d) then
        player:tradeComplete();
        player:delKeyItem(HANDFUL_OF_CRYSTAL_SCALES);
        player:needToZone(true);
        player:setVar("Wait1DayForYomiOkuri_date", os.date("%j")); -- %M for next minute, %j for next day
        player:setVar("Wait1DayForYomiOkuri",VanadielDayOfTheYear());
        player:addItem(17812);
        player:messageSpecial(ITEM_OBTAINED,17812); -- Magoroku
        player:addFame(NORG,AF1_FAME);
        player:completeQuest(OUTLANDS,THE_SACRED_KATANA);
    elseif (csid == 0x0092 and option == 1) then
        player:addQuest(OUTLANDS,YOMI_OKURI);
        player:setVar("Wait1DayForYomiOkuri_date",0);
        player:setVar("yomiOkuriCS",1);
    elseif (csid == 0x0098) then
        player:delKeyItem(YOMOTSU_FEATHER);
        player:setVar("yomiOkuriCS",4);
        player:needToZone(true);
        player:setVar("Wait1DayForYomiOkuri2_date", os.date("%j")); -- %M for next minute, %j for next day
    elseif (csid == 0x009a) then
        player:setVar("yomiOkuriCS",5);
        player:setVar("Wait1DayForYomiOkuri2_date",0);
        player:addKeyItem(YOMOTSU_HIRASAKA);
        player:messageSpecial(KEYITEM_OBTAINED,YOMOTSU_HIRASAKA);
    elseif (csid == 0x009c) then
        if (player:getFreeSlotsCount() < 1) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14100);
        else
            player:delKeyItem(FADED_YOMOTSU_HIRASAKA);
            player:addItem(14100);
            player:messageSpecial(ITEM_OBTAINED,14100); -- Myochin Sune-Ate
            player:setVar("yomiOkuriCS",0);
            player:needToZone(true);
            player:setVar("Wait1DayForAThiefinNorg_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(NORG,AF2_FAME);
            player:completeQuest(OUTLANDS,YOMI_OKURI);
        end
    elseif (csid == 0x009e and option == 1) then
        player:addQuest(OUTLANDS,A_THIEF_IN_NORG);
        player:setVar("Wait1DayForAThiefinNorg_date",0);
        player:setVar("aThiefinNorgCS",1);
    elseif (csid == 0x00a6 or csid == 0x00a8) then
        if (player:getFreeSlotsCount() < 1) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1166);
        else
            player:addItem(1166);
            player:messageSpecial(ITEM_OBTAINED,1166); -- Banishing Charm
            player:setVar("aThiefinNorgCS",6);
        end
    elseif (csid == 0x00a0) then
        player:setVar("aThiefinNorgCS",8);
    elseif (csid == 0x00a2) then
        player:tradeComplete();
        player:delKeyItem(CHARRED_HELM);
        player:setVar("aThiefinNorgCS",9);
        player:needToZone(true);
        player:setVar("Wait1DayForAThiefinNorg2_date", os.date("%j")); -- %M for next minute, %j for next day
    elseif (csid == 0x00a4) then
        if (player:getFreeSlotsCount() < 1) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13868);
        else
            player:addItem(13868);
            player:messageSpecial(ITEM_OBTAINED,13868); --     Myochin Kabuto
            player:addTitle(PARAGON_OF_SAMURAI_EXCELLENCE);
            player:setVar("aThiefinNorgCS",0);
            player:setVar("Wait1DayForAThiefinNorg2_date",0);
            player:addFame(NORG,AF3_FAME);
            player:completeQuest(OUTLANDS,A_THIEF_IN_NORG);
        end
    end
    
end;