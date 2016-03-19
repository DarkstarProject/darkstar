-----------------------------------
-- Area: Mhaura
--  NPC: Rycharde 
--    Standard Info NPC
--  Starts & Finishes non Repeatable Quest: Rycharde the Chef,
--  WAY_OF_THE_COOK, UNENDING_CHASE
--     his name is Valgeir (not completed correctly, ferry not implemented)
--     the clue (100%)
--     the basics (not completed correctly, ferry not implemented)
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Mhaura/TextIDs");


--   player:startEvent(0x4a); -- first quest completed ok
--   player:startEvent(0x4b); -- nothing to do
--   player:startEvent(0x4c); -- second quest start  --WAY_OF_THE_COOK 
--   player:startEvent(0x4e); -- you have x hours left
--   player:startEvent(0x4f); -- not yet done
--   player:startEvent(0x50); -- second quest completed
--   player:startEvent(0x51); -- too late second quest
--   player:startEvent(0x52);-- third quest             
--   player:startEvent(0x53);-- third quest completed 
--   player:startEvent(0x54);-- third quest  said no, ask again
--   player:startEvent(0x55);-- third quest  comment no hurry
--   player:startEvent(0x56);-- forth quest   His Name is Valgeir
--   player:startEvent(0x57);-- forth quest   not done yet
--   player:startEvent(0x58);-- forth quest   done!
--   player:startEvent(0x59);-- nothing to do
--   player:startEvent(0x5a);-- fifth quest The Clue
--   player:startEvent(0x5b);-- fifth quest The Clue asked again
--   player:startEvent(0x5c);-- fifth quest completed
--   player:startEvent(0x5d);-- fifth quest not enogh
--   player:startEvent(0x5e);-- sixth quest The Basics
--   player:startEvent(0x5f);-- sixth quest not done yet
--   player:startEvent(0x60);-- sixth quest completed
--   player:startEvent(0x61);-- sixth quest completed commentary
--   player:startEvent(0x62);-- sixth quest completed commentary 2

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF)== QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local DhalmelMeat  = trade:hasItemQty(4359,trade:getItemCount()); --4359 - slice_of_dhalmel_meat
        
        if (DhalmelMeat  == true and count == 2) then 
            player:startEvent(0x4a); -- completed ok
        elseif (DhalmelMeat  == true and count == 1) then
            player:startEvent(0x49); -- that's not enogh!
        end
        
    elseif (player:getQuestStatus(OTHER_AREAS,WAY_OF_THE_COOK) == QUEST_ACCEPTED) then
    
        local count = trade:getItemCount();
        local DhalmelMeat  = trade:hasItemQty(4359,1); --4359 - slice_of_dhalmel_meat
        local BeehiveChip  = trade:hasItemQty(912,1); --4359 - slice_of_dhalmel_meat
        
        if (DhalmelMeat  == true and BeehiveChip  == true and count == 2) then 
        
            local Dayspassed=VanadielDayOfTheYear()-player:getVar("QuestRychardeTCDayStarted_var");
            local TotalHourLeft=72-(VanadielHour()+Dayspassed*24)+player:getVar("QuestWayotcHourStarted_var");
            
            if (TotalHourLeft>0) then
                player:startEvent(0x50); -- second quest completed
            else
                player:startEvent(0x51); -- too late second quest
            end
        end
        
    elseif (player:getQuestStatus(OTHER_AREAS,UNENDING_CHASE) == QUEST_ACCEPTED) then
        local puffball  = trade:hasItemQty(4448,1); --4448 - puffball
        
        if (puffball  == true) then 
            player:startEvent(0x53); -- completed quest 3 UNENDING_CHASE
        end
        
    elseif (player:getQuestStatus(OTHER_AREAS,THE_CLUE) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local DhalmelMeat  = trade:hasItemQty(4357,trade:getItemCount()); --4357 - crawler egg
        
        if (DhalmelMeat  == true and count > 3) then 
            player:startEvent(0x5c);
        elseif (DhalmelMeat  == true) then
            player:startEvent(0x5d); -- that's not enogh!
        end
        
    elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS) == QUEST_ACCEPTED) then
        local BackedPototo  = trade:hasItemQty(4436,1); --4436 - baked_popoto
        if (BackedPototo  == true) then 
            player:startEvent(0x60);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)    

------------------------------------ QUEST RYCHARDE_THE_CHEF-----------------------------------------
if (player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF)==QUEST_AVAILABLE) then
    QuestStatus = player:getVar("QuestRychardetheChef_var");
    if (QuestStatus == 2 ) then  -- seconnd stage one quest
        player:startEvent(0x46,4359); -- ask if player would do quest
    elseif (QuestStatus == 3 ) then
        player:startEvent(0x47,4359); -- said no, ask again if player would do quest
    else
        player:startEvent(0x45); -- talk about something else
    end
elseif (player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF)==QUEST_ACCEPTED) then
    player:startEvent(0x48); -- not done yet huh?
--------------------------------------------- quest WAY_OF_THE_COOK
elseif (player:getQuestStatus(OTHER_AREAS,WAY_OF_THE_COOK)==QUEST_AVAILABLE and player:getFameLevel(WINDURST)>2) then    -- quest WAY_OF_THE_COOK
    if (player:getVar("QuestRychardeTCCompDay_var")+ 7 < VanadielDayOfTheYear() or player:getVar("QuestRychardeTCCompYear_var") < VanadielYear()) then  --8 days or so after the completition of the last quest ... and required fame
        player:startEvent(0x4c,4359,912);-- second quest WAY_OF_THE_COOK 
    else
        player:startEvent(0x4b); -- nothing to do
    end
elseif (player:getQuestStatus(OTHER_AREAS,WAY_OF_THE_COOK)==QUEST_ACCEPTED) then
    Dayspassed=VanadielDayOfTheYear()-player:getVar("QuestRychardeTCDayStarted_var");
    TotalHourLeft=72-(VanadielHour()+Dayspassed*24)+player:getVar("QuestWayotcHourStarted_var");
    if (TotalHourLeft>0) then
        player:startEvent(0x4e,TotalHourLeft); -- you have x hours left
    else
        player:startEvent(0x4f); -- not yet done
    end
---------------------------QUEST UNENDING_CHASE--------------------------------------------------
elseif (player:getQuestStatus(OTHER_AREAS,UNENDING_CHASE)==QUEST_AVAILABLE and player:getFameLevel(WINDURST) > 2) then
    if (player:getVar("QuestWayofTCCompDay_var")+7 < VanadielDayOfTheYear() or player:getVar("QuestWayofTCCompYear_var") < VanadielYear()) then  -- days between quest
        if (player:getVar("QuestUnendingCAskedAlready_var")==2) then
            player:startEvent(0x54,4448);-- third quest  said no, ask again    
        else
            player:startEvent(0x52,4448);-- third quest UNENDING_CHASE    4448 - puffball
        end
    else
        player:startEvent(0x4b); -- nothing to do
    end
elseif (player:getQuestStatus(OTHER_AREAS,UNENDING_CHASE)==QUEST_ACCEPTED) then
    player:startEvent(0x55);-- third quest  comment no hurry
-------------------------QUEST HIS_NAME_IS_VALGEIR--------------------------------------------------
elseif (player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR)==QUEST_AVAILABLE and player:getFameLevel(WINDURST)>2) then
    if (player:getVar("QuestUnendingCCompDay_var")+2< VanadielDayOfTheYear() or player:getVar("QuestUnendingCCompYear_var")< VanadielYear()) then
        player:startEvent(0x56);-- forth quest   His Name is Valgeir
    else
        player:startEvent(0x4b); -- nothing to do
    end
elseif (player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR)==QUEST_ACCEPTED) then
    if (player:hasKeyItem(90)) then
        player:startEvent(0x57);-- forth quest   not done yet    
    else
        player:startEvent(0x58);-- forth quest   done!
    end
---------------------------QUEST THE CLUE--------------------------------------------------------
elseif (player:getQuestStatus(OTHER_AREAS,THE_CLUE)==QUEST_AVAILABLE and player:getFameLevel(WINDURST)>4) then
    if (player:getQuestStatus(OTHER_AREAS,EXPERTISE)==QUEST_COMPLETED) then 
        if (player:getVar("QuestExpertiseCompDay_var")+7 < VanadielDayOfTheYear() or player:getVar("QuestExpertiseCompYear_var") < VanadielYear()) then
            if (player:getVar("QuestTheClueStatus_var")==1) then
                player:startEvent(0x5b,4357);-- fifth quest The Clue asked again 4357 - crawler_egg
            else
                player:startEvent(0x5a,4357);-- fifth quest The Clue 4357 - crawler_egg
            end;
        else
            player:startEvent(0x4b); -- nothing to do
        end
    else
        player:startEvent(0x4b); -- nothing to do        
    end
elseif (player:getQuestStatus(OTHER_AREAS,THE_CLUE)==QUEST_ACCEPTED) then
    player:startEvent(0x55);-- third quest  comment no hurry
---------------------------QUEST THE Basics--------------------------------------------------------
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_AVAILABLE and player:getFameLevel(WINDURST) > 4) then
    if (player:getVar("QuestTheClueCompDay_var")+7 < VanadielDayOfTheYear() or player:getVar("QuestTheClueCompYear_var") < VanadielYear()) then
        player:startEvent(0x5e);-- sixth quest The Basics
    else
        player:startEvent(0x4b); -- nothing to do standar dialog
    end
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_ACCEPTED) then
    player:startEvent(0x5f);-- sixth quest not done yet
else
    if (player:getVar("QuestTheBasicsComentary_var")==1) then
        player:startEvent(0x61);-- sixth quest completed commentary
    else
        player:startEvent(0x62);-- sixth quest completed commentary 2
    end
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

    if (csid == 0x46 or csid == 0x47) then  --accept quest 1
        player:setVar("QuestRychardetheChef_var",3); --
        if (option == 71 or option == 72) then    --70 = answer no  71 answer yes!
            player:addQuest(OTHER_AREAS,RYCHARDE_THE_CHEF);            
        end    
    elseif (csid == 0x4a) then   -- end quest 1 RYCHARDE_THE_CHEF
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addTitle(PURVEYOR_IN_TRAINING);
        player:addGil(GIL_RATE*1500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
        player:setVar("QuestRychardetheChef_var",0);
        player:setVar("QuestRychardeTCCompDay_var",VanadielDayOfTheYear());
        player:setVar("QuestRychardeTCCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,RYCHARDE_THE_CHEF);                
    elseif (csid == 0x4c) then  -- accept quest 2
        if (option == 74 ) then -- answer yes!
            player:setVar("QuestWayotcHourStarted_var",VanadielHour());
            player:setVar("QuestRychardeTCDayStarted_var",VanadielDayOfTheYear());
            player:addQuest(OTHER_AREAS,WAY_OF_THE_COOK);    
        end
    elseif (csid == 0x50) then  --end quest 2 WAY_OF_THE_COOK
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addTitle(ONESTAR_PURVEYOR);
        player:addGil(GIL_RATE*1500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
        player:setVar("QuestWayotcHourStarted_var",0);
        player:setVar("QuestRychardeTCDayStarted_var",0);
        player:setVar("QuestRychardeTCCompDay_var",0);
        player:setVar("QuestRychardeTCCompYear_var",0);
        player:setVar("QuestWayofTCCompDay_var",VanadielDayOfTheYear()); -- completition day of WAY_OF_THE_COOK
        player:setVar("QuestWayofTCCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,WAY_OF_THE_COOK);    
    elseif (csid == 0x51) then  --end quest 2 WAY_OF_THE_COOK
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addTitle(PURVEYOR_IN_TRAINING);
        player:addGil(GIL_RATE*1000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
        player:setVar("QuestWayotcHourStarted_var",0);
        player:setVar("QuestRychardeTCDayStarted_var",0);
        player:setVar("QuestRychardeTCCompDay_var",0);
        player:setVar("QuestRychardeTCCompYear_var",0);
        player:setVar("QuestWayofTCCompDay_var",VanadielDayOfTheYear()); -- completition day of WAY_OF_THE_COOK
        player:setVar("QuestWayofTCCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,WAY_OF_THE_COOK);    
    elseif (csid == 0x52) then  -- accept quest 3 UNENDING_CHASE
        player:setVar("QuestUnendingCAskedAlready_var",2);
        if (option == 77 ) then -- answer yes!
            player:addQuest(OTHER_AREAS,UNENDING_CHASE);    
        end
    elseif (csid == 0x54) then  -- accept quest 3 UNENDING_CHASE
        if (option == 78 ) then -- answer yes!
            player:addQuest(OTHER_AREAS,UNENDING_CHASE);    
        end
    elseif (csid == 0x53) then  -- end quest 3 UNENDING_CHASE
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addTitle(TWOSTAR_PURVEYOR);
        player:addGil(GIL_RATE*2100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2100);
        player:setVar("QuestUnendingCAskedAlready_var",0);
        player:setVar("QuestWayofTCCompDay_var",0); -- completition day of WAY_OF_THE_COOK delete variable
        player:setVar("QuestWayofTCCompYear_var",0);
        player:setVar("QuestUnendingCCompDay_var",VanadielDayOfTheYear()); -- completition day of unending chase
        player:setVar("QuestUnendingCCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,UNENDING_CHASE);    
    elseif (csid == 0x56) then  -- accept quest 4 HIS_NAME_IS_VALGEIR
        if (option == 80 ) then -- answer yes!
            
            player:addKeyItem(ARAGONEU_PIZZA); --give pizza to player
            player:messageSpecial(KEYITEM_OBTAINED,ARAGONEU_PIZZA);
            player:addQuest(OTHER_AREAS,HIS_NAME_IS_VALGEIR);    
        end
    elseif (csid == 0x58) then  -- end quest 4 his name is Valgeir
        player:addFame(WINDURST,120);
        player:addKeyItem(MAP_OF_THE_TORAIMARAI_CANAL); --reward Map of the Toraimarai Canal 
        player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_TORAIMARAI_CANAL);
        player:setVar("QuestUnendingCCompDay_var",0); -- completition day of unending chase delete
        player:setVar("QuestUnendingCCompYear_var",0);
        player:setVar("QuestHNIVCCompDay_var",VanadielDayOfTheYear()); -- completition day of unending chase
        player:setVar("QuestHNIVCCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,HIS_NAME_IS_VALGEIR);
    elseif (csid == 0x5a or csid == 0x5b) then  --accept quest the clue    
        player:setVar("QuestTheClueStatus_var",1);
        if (option == 83 ) then
            player:addQuest(OTHER_AREAS,THE_CLUE);        
        end
    elseif (csid == 0x5c) then   -- end quest THE CLUE
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addTitle(FOURSTAR_PURVEYOR);
        player:addGil(GIL_RATE*3000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
        player:setVar("QuestTheClueStatus_var",0);
        player:setVar("QuestExpertiseCompDay_var",0); -- completition day of expertice quest
        player:setVar("QuestExpertiseCompYear_var",0);
        player:setVar("QuestTheClueCompDay_var",VanadielDayOfTheYear()); -- completition day of THE CLUE
        player:setVar("QuestTheClueCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,THE_CLUE);
    elseif (csid == 0x5e) then  --accept quest the basics
        if (option == 85 ) then
                        --TODO pay for ferry
            player:addKeyItem(MHAURAN_COUSCOUS); --MHAURAN_COUSCOUS                = 92;
            player:messageSpecial(KEYITEM_OBTAINED,MHAURAN_COUSCOUS);
            player:addQuest(OTHER_AREAS,THE_BASICS);        
        end
    elseif (csid == 0x60) then   -- end quest the basics
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addTitle(FIVESTAR_PURVEYOR);
        if (player:getFreeSlotsCount() <= 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,133);
        else
            player:addItem(133);
            player.messageSpecial(ITEM_OBTAINED,133);
            player:setVar("QuestTheClueCompDay_var",0); -- completition day of THE CLUE
            player:setVar("QuestTheClueCompYear_var",0);
            player:setVar("QuestTheBasicsComentary_var",1);
            player:completeQuest(OTHER_AREAS,THE_BASICS);
        end
    elseif (csid == 0x61) then  --end commentary quest the basics
        player:setVar("QuestTheBasicsComentary_var",0);
    end    
end;