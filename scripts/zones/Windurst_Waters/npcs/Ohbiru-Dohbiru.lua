-----------------------------------
--  Area: Windurst Waters
--  NPC:  Ohbiru-Dohbiru
--  Involved in quest: Food For Thought, Say It with Flowers
--  Starts and finishes quest: Toraimarai Turmoil
-----------------------------------

package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;


require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local turmoil = player:getQuestStatus(WINDURST,TORAIMARAI_TURMOIL);
    local count = trade:getItemCount();
    
    
    if (player:getQuestStatus(WINDURST,WATER_WAY_TO_GO) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4351,1) and count == 1) then
            player:startEvent(0x0163,900);
        end
    elseif (player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT) == QUEST_ACCEPTED) then
        local OhbiruFood = player:getVar("Ohbiru_Food_var"); 
        
        if (trade:hasItemQty(4493,1) == true and trade:hasItemQty(4408,1) == true and trade:hasItemQty(624,1) == true and count == 3 and OhbiruFood ~= 2) then -- Traded all 3 items & Didn't ask for order
            rand = math.random(1,2);
            if (rand == 1) then
                player:startEvent(0x0145,440);
            else
                player:startEvent(0x0146);
            end
        elseif (trade:hasItemQty(4493,1) == true and trade:hasItemQty(4408,1) == true and trade:hasItemQty(624,1) == true and count == 3 and OhbiruFood == 2) then -- Traded all 3 items after receiving order
            player:startEvent(0x0142,440);
        end    
    elseif (turmoil == QUEST_ACCEPTED) then
        if (count == 3 and trade:getGil() == 0 and trade:hasItemQty(906,3) == true) then --Check that all 3 items have been traded
            player:startEvent(0x0317);
        else 
            player:startEvent(0x0312,4500,267,906); -- Reminder of needed items
        end
    elseif (turmoil == QUEST_COMPLETED) then
        if (count == 3 and trade:getGil () == 0 and trade:hasItemQty(906,3) == true) then --Check that all 3 items have been traded
            player:startEvent(0x0317);
        else
            player:startEvent(0x031b,4500,0,906); -- Reminder of needed items for repeated quest
        end
    end
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- Check for Missions first (priority?)
    -- If the player has started the mission or not
    local pfame = player:getFameLevel(WINDURST);
    local turmoil = player:getQuestStatus(WINDURST,TORAIMARAI_TURMOIL);
    local FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
    local needToZone = player:needToZone();
    local OhbiruFood = player:getVar("Ohbiru_Food_var"); -- Variable to track progress of Ohbiru-Dohbiru in Food for Thought
    local waterWayToGo = player:getQuestStatus(WINDURST,WATER_WAY_TO_GO);
    local overnightDelivery = player:getQuestStatus(WINDURST,OVERNIGHT_DELIVERY);
    local SayFlowers = player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS);
    local FlowerProgress = player:getVar("FLOWER_PROGRESS");
    
    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")==2) then        
        player:startEvent(0x0368);
    elseif (player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
        if (player:getVar("ohbiru_dohbiru_talk") == 1) then
            player:startEvent(0x8f);
        else
            player:startEvent(0x90);
        end
    elseif (SayFlowers == QUEST_ACCEPTED or FlowerProgress == 2) then
        if (needToZone) then
            player:startEvent(0x0206);
        elseif (player:getVar("FLOWER_PROGRESS") == 1) then
            player:startEvent(0x0205,0,0,0,0,950);
        else
            player:startEvent(0x0204,0,0,0,0,950);
        end
    elseif (waterWayToGo == QUEST_COMPLETED and needToZone) then
        player:startEvent(0x0164,0,4351);
        
    elseif (waterWayToGo == QUEST_ACCEPTED) then
        if (player:hasItem(504) == false and player:hasItem(4351) == false) then
            player:startEvent(0x0162);
        else
            player:startEvent(0x0161);
        end
    elseif (waterWayToGo == QUEST_AVAILABLE and overnightDelivery == QUEST_COMPLETED and pfame >= 3) then
        player:startEvent(0x0160,0,4351);
        
    elseif (FoodForThought == QUEST_AVAILABLE and OhbiruFood == 0) then
        player:startEvent(0x0134); -- Hungry; mentions the experiment. First step in quest for this NPC.
        player:setVar("Ohbiru_Food_var",1);
    elseif (FoodForThought == QUEST_AVAILABLE and OhbiruFood == 1) then
        player:startEvent(0x0135); -- Hungry. The NPC complains of being hungry before the quest is active.
    elseif (FoodForThought == QUEST_ACCEPTED and OhbiruFood < 2) then
        player:startEvent(0x013c,0,4493,624,4408); -- Gives Order
        player:setVar("Ohbiru_Food_var",2);
    elseif (FoodForThought == QUEST_ACCEPTED and OhbiruFood == 2) then
        player:startEvent(0x013d,0,4493,624,4408); -- Repeats Order
    elseif (FoodForThought == QUEST_ACCEPTED and OhbiruFood == 3) then
        player:startEvent(0x0144); -- Reminds player to check on friends if he has been given his food.
    elseif (FoodForThought == QUEST_COMPLETED and needToZone == true) then
        player:startEvent(0x0158); -- Post Food for Thought Dialogue    
    elseif (overnightDelivery == QUEST_COMPLETED and pfame < 6) then
        player:startEvent(0x015f); -- Post Overnight Delivery Dialogue
    --
    -- Begin Toraimarai Turmoil Section    
    --
    elseif (turmoil == QUEST_AVAILABLE and pfame >= 6 and needToZone == false) then 
        player:startEvent(0x0311,4500,267,906);
    elseif (turmoil == QUEST_ACCEPTED) then
        player:startEvent(0x0312,4500,267,906); -- Reminder of needed items
    elseif (turmoil == QUEST_COMPLETED) then
        player:startEvent(0x031b,4500,0,906); -- Allows player to initiate repeat of Toraimarai Turmoil

    else
        player:startEvent(0x0158);
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
    -- Check Missions first (priority?)
    local turmoil = player:getQuestStatus(WINDURST,TORAIMARAI_TURMOIL);
    if (csid == 0x8f) then
        player:setVar("ohbiru_dohbiru_talk",2);
    elseif (csid == 0x0142 or csid == 0x0145)  then
        if (player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 4 and player:getVar("Ohbiru_Food_var") == 2) then -- If this is the last NPC to be fed
            player:tradeComplete();
            player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
            player:addTitle(FAST_FOOD_DELIVERER);
            player:addGil(GIL_RATE*440);
            player:setVar("Kerutoto_Food_var",0);        -- ------------------------------------------
            player:setVar("Kenapa_Food_var",0);            -- Erase all the variables used in this quest
            player:setVar("Ohbiru_Food_var",0);            -- ------------------------------------------
            player:addFame(WINDURST,WIN_FAME*100);
            player:needToZone(true);
        else
            player:tradeComplete();
            player:addGil(GIL_RATE*440);
            player:setVar("Ohbiru_Food_var",3); -- If this is NOT the last NPC given food, flag this NPC as completed.
        end
    elseif (csid == 0x0146) then
        if (player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 4 and player:getVar("Ohbiru_Food_var") == 2) then -- If this is the last NPC to be fed
            player:tradeComplete();
            player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
            player:addTitle(FAST_FOOD_DELIVERER);
            player:addGil(GIL_RATE*440);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*440);
            player:setVar("Kerutoto_Food_var",0);        -- ------------------------------------------
            player:setVar("Kenapa_Food_var",0);            -- Erase all the variables used in this quest
            player:setVar("Ohbiru_Food_var",0);            -- ------------------------------------------
            player:addFame(WINDURST,WIN_FAME*100);
            player:needToZone(true);
        else
            player:tradeComplete();
            player:addGil(GIL_RATE*440);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*440);
            player:setVar("Ohbiru_Food_var",3); -- If this is NOT the last NPC given food, flag this NPC as completed.
        end
    elseif (csid == 0x0311 and option == 1) then -- Adds Toraimarai turmoil
        player:addQuest(WINDURST,TORAIMARAI_TURMOIL);
        player:messageSpecial(KEYITEM_OBTAINED,267);
        player:addKeyItem(267); -- Rhinostery Certificate
    elseif (csid == 0x0317 and turmoil == QUEST_ACCEPTED) then -- Completes Toraimarai turmoil - first time
        player:addGil(GIL_RATE*4500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*4500);
        player:completeQuest(WINDURST,TORAIMARAI_TURMOIL);
        player:addFame(WINDURST,WIN_FAME*100);
        player:addTitle(CERTIFIED_RHINOSTERY_VENTURER);
        player:tradeComplete();
    elseif (csid == 0x0317 and turmoil == 2) then -- Completes Toraimarai turmoil - repeats
        player:addGil(GIL_RATE*4500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*4500);
        player:addFame(WINDURST,WIN_FAME*50);
        player:tradeComplete();
    elseif (csid == 0x0160 and option == 0 or csid == 0x0162) then
        if (player:getFreeSlotsCount() >= 1) then
            if (player:getQuestStatus(WINDURST,WATER_WAY_TO_GO) == QUEST_AVAILABLE) then
                player:addQuest(WINDURST,WATER_WAY_TO_GO);
            end
            player:addItem(504);
            player:messageSpecial(ITEM_OBTAINED,504);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,504);
        end
    elseif (csid == 0x0163) then
        player:addGil(GIL_RATE*900);
        player:completeQuest(WINDURST,WATER_WAY_TO_GO);
        player:addFame(WINDURST,WIN_FAME*40);
        player:tradeComplete();        
        player:needToZone(true);
    elseif (csid == 0x0368) then    
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",3);
    elseif (csid == 0x0204) then
        if (option == 0) then
            player:delGil(300);
            player:addItem(948); -- Carnation
            player:messageSpecial(ITEM_OBTAINED,948);
            player:needToZone(true);
        elseif (option == 1) then
            player:delGil(200);
            player:addItem(941); -- Red Rose
            player:messageSpecial(ITEM_OBTAINED,941);
            player:needToZone(true);
        elseif (option == 2) then
            player:delGil(250);
            player:addItem(949); -- Rain Lily
            player:messageSpecial(ITEM_OBTAINED,949);
            player:needToZone(true);
        elseif (option == 3) then
            player:delGil(150);
            player:addItem(956); -- Lilac
            player:messageSpecial(ITEM_OBTAINED,956);
            player:needToZone(true);
        elseif (option == 4) then
            player:delGil(200);
            player:addItem(957); -- Amaryllis
            player:messageSpecial(ITEM_OBTAINED,957);
            player:needToZone(true);
        elseif (option == 5) then
            player:delGil(100);
            player:addItem(958); -- Marguerite
            player:messageSpecial(ITEM_OBTAINED,958);
            player:needToZone(true);
        elseif (option == 7) then
            player:setVar("FLOWER_PROGRESS",1);
        end
    end
end;


