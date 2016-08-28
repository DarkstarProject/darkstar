-----------------------------------
--  Area: Western Adoulin
--  NPC: Westerly Breeze
--  Type: Standard NPC and Quest Giver
--  Starts, Involved with, and Finishes Quests: 'Hunger Strikes'
--                                              'The Starving'
--                                              'Always More, Quoth the Ravenous'
--  @zone 256
--  @pos 62 32 123 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local HS = player:getQuestStatus(ADOULIN, HUNGER_STRIKES);
    local TS = player:getQuestStatus(ADOULIN, THE_STARVING);
    local AMQTR = player:getQuestStatus(ADOULIN, ALWAYS_MORE_QUOTH_THE_RAVENOUS);

    if ((trade:getItemCount() == 1) and (trade:getGil() == 0)) then
        local item = trade:getItem(0);
        local item_ID = item:getID();
        local AH_Category = item:getAHCat();
        if (AH_Category >= 52) and (AH_Category <= 57) then
            -- We traded him a food item
            if ((player:getVar("ATWTTB_Can_Trade_Gruel") == 1) and ((item_ID == 4489) or (item_ID == 4534))) then
                if (item_ID == 4489) then
                    -- Trading him Vegetable Gruel after completing Quest: 'All The Way To The Bank'
                    player:startEvent(0x13CC);
                elseif (item_ID == 4534) then
                    -- Trading him Medicinal Gruel after completing Quest: 'All The Way To The Bank'
                    player:startEvent(0x13CC, 1);
                end
            elseif (HS == QUEST_ACCEPTED) then
                if (item_ID == 4592) then
                    -- We gave him Wisdom Soup.
                    -- Finishes Quest: 'Hunger Strikes'.
                    player:startEvent(0x09E4);
                else
                    -- Special event where he consumes the food item despite it being wrong.
                    player:startEvent(0x09E5);
                end
            end
        elseif (AH_Category == 58) then
            -- We traded him a drink.
            if (TS == QUEST_ACCEPTED) then
                if (item_ID == 4541) then
                    -- We gave him Goblin Drink.
                    -- Finishes Quest: 'The Starving'.
                    player:startEvent(0x0BBF);
                else
                    -- Special event where he drinks a non-goblin drink.
                    player:startEvent(0x0BC0);
                end
            elseif (AMQTR == QUEST_ACCEPTED) then
                if (item_ID == 4541) then
                    -- We gave him another Goblin Drink.
                    -- Special event where he refuses it.
                    player:startEvent(0x0BC5);
                else
                    -- Special event where he drinks a non-goblin drink.
                    player:startEvent(0x0BC6);
                end
            end
        else
            if ((item_ID == 4234) and (AMQTR == QUEST_ACCEPTED)) then
                -- We gave him Cursed Beverage.
                -- Finishes Quest: 'Always More Quoth the Ravenous'
                player:startEvent(0x0BC4);
            end
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local HS = player:getQuestStatus(ADOULIN, HUNGER_STRIKES);
    local TS = player:getQuestStatus(ADOULIN, THE_STARVING);
    local AMQTR = player:getQuestStatus(ADOULIN, ALWAYS_MORE_QUOTH_THE_RAVENOUS);
    if (HS ~= QUEST_COMPLETED) then
        if (HS == QUEST_AVAILABLE) then
            -- Starts Quest: 'Hunger Strikes'
            player:startEvent(0x09E2);  
        else
            -- Reminder for Quest: 'Hunger Strikes'
            player:startEvent(0x09E3);  
        end
    elseif ((player:getFame(ADOULIN) >= 2) and (not player:needToZone()) and (vanaDay() > player:getVar("Westerly_Breeze_Wait"))) then
        if (TS ~= QUEST_COMPLETED) then
            if (TS == QUEST_AVAILABLE) then
                -- Starts Quest: 'The Starving'
                player:startEvent(0x0BBD);  
            else
                -- Reminder for Quest: 'The Starving'
                player:startEvent(0x0BBE);  
            end
        elseif ((AMQTR ~= QUEST_COMPLETED) and (player:getFame(ADOULIN) >= 3)) then
            if (AMQTR == QUEST_AVAILABLE) then
                -- Starts Quest: 'Always More Quoth the Ravenous'
                player:startEvent(0x0BC2);  
            else
                -- Reminder for Quest: 'Always More Quoth the Ravenous'
                player:startEvent(0x0BC3);  
            end
        else
            -- Standard dialogue
            player:startEvent(0x0229);
        end
    else
        -- Standard dialogue
        player:startEvent(0x0229);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x09E2) then
        -- Starting Quest: 'Hunger Strikes'
        player:addQuest(ADOULIN, HUNGER_STRIKES);
    elseif ((csid == 0x09E4) or (csid == 0x0BBF)) then
        -- Finishing Quest: 'Hunger Strikes' or 'The Starving'
        player:tradeComplete();
        player:addExp(1000 * EXP_RATE);
        player:addCurrency('bayld', 500 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 500 * BAYLD_RATE);
        player:addFame(ADOULIN);
        player:setVar("Westerly_Breeze_Wait", vanaDay());
        player:needToZone(true);

        if (csid == 0x09E4) then
            player:completeQuest(ADOULIN, HUNGER_STRIKES);
        elseif (csid == 0x0BBF) then
            player:completeQuest(ADOULIN, THE_STARVING);
        end
    elseif (csid == 0x0BBD) then
        -- Starting Quest: 'The Starving'
        player:addQuest(ADOULIN, THE_STARVING);
    elseif (csid == 0x0BC2) then
        -- Starting Quest: 'Always More Quoth the Ravenous'
        player:addQuest(ADOULIN, ALWAYS_MORE_QUOTH_THE_RAVENOUS);
    elseif (csid == 0x0BC4) then
        -- Finishing Quest: 'Always More Quoth The Ravenous'
        player:tradeComplete();
        player:completeQuest(ADOULIN, ALWAYS_MORE_QUOTH_THE_RAVENOUS);
        player:addExp(1500 * EXP_RATE);
        player:addCurrency('bayld', 1000 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 1000 * BAYLD_RATE);
        player:addFame(ADOULIN);
        player:setVar("Westerly_Breeze_Wait", 0);
    elseif ((csid == 0x09E5) or (csid == 0x0BC0) or (csid == 0x0BC6)) then
        -- Consuming wrong food item given to him during his quests
        player:tradeComplete();
    elseif (csid == 0x13CC) then
        -- Trading him gruel after Quest: 'All The Way To The Bank'
        player:tradeComplete();
        local gil_obtained = 0;
        if (option == 1) then
            gil_obtained = 39432 * GIL_RATE;
        else
            gil_obtained = 19716 * GIL_RATE;
        end
        player:addGil(gil_obtained);
        player:messageSpecial(GIL_OBTAINED, gil_obtained);
        player:setVar("ATWTTB_Can_Trade_Gruel", 0);
    end
end;
