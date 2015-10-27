-----------------------------------
--  Area: Windurst Waters
--  NPC:  Kenapa Keppa
--  Involved in Quest: Food For Thought, Hat in Hand
--  Working 100%
--  @zone = 238
--  @pos = 27 -6 -199
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;


require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
    local KenapaFood = player:getVar("Kenapa_Food_var"); -- Variable to track progress of Kenapa-Keppa in Food for Thought
    
    if (FoodForThought == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        gil = trade:getGil();
        if (trade:hasItemQty(4409,1) == false) then -- Traded in wrong item. Not accepted.
            player:startEvent(0x0149);
        elseif (count == 1 and trade:hasItemQty(4409,1) == true and gil == 0 and KenapaFood == 0) then -- Traded item without receiving order
            rand = math.random(1,2);
            if (rand == 1) then
                player:startEvent(0x014b);
            else
                player:startEvent(0x014a,120);
            end
        elseif (count == 1 and trade:hasItemQty(4409,1) == true and gil == 0 and KenapaFood == 3) then  -- Traded item after receiving order
            player:startEvent(0x0147,120);
        end
    end
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local OvernightDelivery = player:getQuestStatus(WINDURST,OVERNIGHT_DELIVERY);
    local FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
    local SayFlowers = player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS);
    local FlowerProgress = player:getVar("FLOWER_PROGRESS"); -- Variable to track progress of Say It with Flowers.
    local hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    local KenapaFood = player:getVar("Kenapa_Food_var"); -- Variable to track progress of Kenapa-Keppa in Food for Thought
    local KenapaOvernight = player:getVar("Kenapa_Overnight_var"); -- Variable to track progress for Overnight Delivery
    local KenapaOvernightDay = player:getVar("Kenapa_Overnight_Day_var"); -- Variable to track the day the quest is started.
    local KenapaOvernightHour = player:getVar("Kenapa_Overnight_Hour_var"); -- Variable to track the hour the quest is started.
    local needToZone = player:needToZone();
    local pFame = player:getFameLevel(WINDURST);
    local HourOfTheDay = VanadielHour();
    
    if ((hatstatus == 1 or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),4) == false) then
        player:startEvent(0x0038); -- Show Off Hat
    elseif (SayFlowers == QUEST_ACCEPTED and FlowerProgress == 1) then
        player:startEvent(0x0207);
    elseif (FoodForThought == QUEST_AVAILABLE) then
        player:startEvent(0x0136); -- Hungry script
    elseif (FoodForThought == QUEST_ACCEPTED) then
        if (KenapaFood == 0) then 
            player:startEvent(0x013e); -- Stammer 1/3
            player:setVar("Kenapa_Food_var",1);
        elseif (KenapaFood == 1) then 
            player:startEvent(0x013f); -- Stammer 2/3
            player:setVar("Kenapa_Food_var",2);
        elseif (KenapaFood == 2) then 
            player:startEvent(0x0140,0,4409); -- Gives Order
            player:setVar("Kenapa_Food_var",3);
        elseif (FoodForThought == QUEST_ACCEPTED and KenapaFood == 3) then
            rand = math.random(1,3);
            if (rand == 1) then
                player:startEvent(0x0140,0,4409); -- Repeats Order
            elseif (rand == 2) then
                player:startEvent(0x0141); -- "Or Whatever"
            else
                player:startEvent(0x0148); -- "..<Grin>.."
            end
        elseif (FoodForThought == QUEST_ACCEPTED and KenapaFood == 4) then -- Give standard conversation options if this NPC has been fed but others haven't
            rand = math.random(1,2);
            if (rand == 1) then
                player:startEvent(0x012e); -- Standard converstation
            else
                player:startEvent(0x012f); -- Standard converstation
            end
        end
    elseif (FoodForThought == QUEST_COMPLETED and OvernightDelivery == QUEST_AVAILABLE and needToZone == false and (HourOfTheDay >= 7 and HourOfTheDay < 24) and pFame >= 1 and KenapaOvernight ~= 256) then
        if (KenapaOvernight == 0) then
            player:startEvent(0x0150);
        elseif (KenapaOvernight == 1) then
            player:startEvent(0x0151);
        elseif (KenapaOvernight == 2) then
            player:startEvent(0x0152);
        elseif (KenapaOvernight == 3) then
            player:startEvent(0x0153); -- Actual quest acceptance Dialogue
        end
    elseif (FoodForThought == QUEST_COMPLETED and OvernightDelivery == QUEST_AVAILABLE and KenapaOvernight == 256) then
        if (HourOfTheDay > 6 and HourOfTheDay < 7) then
            player:startEvent(0x015b); -- Failed to return in time; dialogue before quest can be repeated
        else
            player:startEvent(0x0150); -- Restart the quest from the beginning
        end
    elseif (OvernightDelivery == QUEST_ACCEPTED and player:hasKeyItem(SMALL_BAG) == false) then
        if (KenapaOvernight == 4) then
            player:startEvent(0x0154); -- Reminder for Overnight Delivery #1
        elseif (KenapaOvernight == 5) then
            player:startEvent(0x0155); -- Reminder for Overnight Delivery #2
        elseif (KenapaOvernight == 6) then
            player:startEvent(0x0156); -- Reminder for Overnight Delivery #3
        elseif (KenapaOvernight == 7) then
            player:startEvent(0x0157); -- Reminder for Overnight Delivery #4
        end
    elseif (OvernightDelivery == QUEST_ACCEPTED and player:hasKeyItem(SMALL_BAG) == true and (HourOfTheDay <= 6 or HourOfTheDay >= 18)) then
        if (VanadielDayOfTheYear() == KenapaOvernightDay and (KenapaOvernightHour <= 24 or KenapaOvernightHour < 6)) then
            player:startEvent(0x015c); -- Brought the key item back inside the time frame; got the item and returned it on the same day
        elseif (VanadielDayOfTheYear() == KenapaOvernightDay + 1 and KenapaOvernightHour <= 24) then
            player:startEvent(0x015c); -- Brought the key item back inside the time frame
        else
            player:startEvent(0x015a); -- Failed to return in time
        end
    elseif (OvernightDelivery == QUEST_ACCEPTED and player:hasKeyItem(SMALL_BAG) == true and HourOfTheDay > 6) then
        player:startEvent(0x015a); -- Failed to return in time
    elseif (OvernightDelivery == QUEST_COMPLETED) then
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x015d); -- Random comment after Overnight Delivery #1
        else
            player:startEvent(0x015e); -- Random comment after Overnight Delivery #2
        end
    else
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x012e); -- Standard converstation
        else
            player:startEvent(0x012f); -- Standard converstation
        end
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
    if (csid == 0x0147 or csid == 0x014a) then
        if (player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 3 and player:getVar("Ohbiru_Food_var") == 3) then -- If this is the last NPC to be fed
            player:addGil(GIL_RATE*120);
            player:tradeComplete();
            player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
            player:addTitle(FAST_FOOD_DELIVERER);
            player:addFame(WINDURST,WIN_FAME*100);
            player:needToZone(true);
            player:setVar("Kerutoto_Food_var",0);          -- ------------------------------------------
            player:setVar("Kenapa_Food_var",0);            -- Erase all the variables used in this quest
            player:setVar("Ohbiru_Food_var",0);            -- ------------------------------------------
        else
            player:tradeComplete();
            player:addGil(GIL_RATE*120);
            player:setVar("Kenapa_Food_var",4); -- If this is NOT the last NPC given food, flag this NPC as completed.
        end
    elseif (csid == 0x014b) then
        if (player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 3 and player:getVar("Ohbiru_Food_var") == 3) then -- If this is the last NPC to be fed
            player:addGil(GIL_RATE*120);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*120); 
            player:tradeComplete();
            player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
            player:addTitle(FAST_FOOD_DELIVERER);
            player:addFame(WINDURST,WIN_FAME*100);
            player:needToZone(true);
            player:setVar("Kerutoto_Food_var",0);          -- ------------------------------------------
            player:setVar("Kenapa_Food_var",0);            -- Erase all the variables used in this quest
            player:setVar("Ohbiru_Food_var",0);            -- ------------------------------------------
        else
            player:tradeComplete();
            player:addGil(GIL_RATE*120);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*120); 
            player:setVar("Kenapa_Food_var",4); -- If this is NOT the last NPC given food, flag this NPC as completed.
        end
    elseif  (csid == 0x0038) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+4);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    elseif (csid == 0x0150) then
        player:setVar("Kenapa_Overnight_var",1);
    elseif (csid == 0x0151) then
        player:setVar("Kenapa_Overnight_var",2);
    elseif (csid == 0x0152) then
        player:setVar("Kenapa_Overnight_var",3);
    elseif (csid == 0x0153) then
        if (option == 0) then
            player:addQuest(WINDURST,OVERNIGHT_DELIVERY);
            player:setVar("Kenapa_Overnight_var",4);
        else
            player:setVar("Kenapa_Overnight_var",0);
        end
    elseif (csid == 0x0154) then
        player:setVar("Kenapa_Overnight_var",5);
    elseif (csid == 0x0155) then
        player:setVar("Kenapa_Overnight_var",6);
    elseif (csid == 0x0156) then
        player:setVar("Kenapa_Overnight_var",7);
    elseif (csid == 0x0157) then
        player:setVar("Kenapa_Overnight_var",4); -- Begin reminder sequence
    elseif (csid == 0x015a) then
        player:delQuest(WINDURST,OVERNIGHT_DELIVERY);
        player:delKeyItem(SMALL_BAG);
        player:setVar("Kenapa_Overnight_Hour_var",0);
        player:setVar("Kenapa_Overnight_var",256);
    elseif (csid == 0x015c) then
        player:addItem(12590);
        player:delKeyItem(SMALL_BAG);
        player:messageSpecial(ITEM_OBTAINED,12590); 
        player:completeQuest(WINDURST,OVERNIGHT_DELIVERY);
        player:addFame(WINDURST,WIN_FAME*100);
        player:needToZone(true);
        player:setVar("Kenapa_Overnight_var",0);   
        player:setVar("Kenapa_Overnight_Hour_var",0);
    end
end;



