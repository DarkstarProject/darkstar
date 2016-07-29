-----------------------------------
-- Area: Bastok Markets
-- NPC: Matthias
-- Standard Info NPC
-- Involved in Quest:
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------
    --local variables for item IDs to make things clearer;
    local imperialSilk = 2340;
    local wolfFelt = 2010;
    local silverBrocade = 1991;

    local karakulCloth = 2288;
    local rainbowCloth = 830;
    local rainbowVelvet = 1996;

    local wamouraCloth = 2289;
    local moblinWeave = 1636;
    local goldBrocade = 1999;

function onTrade(player,npc,trade)

    if (player:getVar("dancerTailorCS") == 4) then
        local playersAFChoice = player:getVar("dancerAFChoice");

            if (playersAFChoice == 1 and
                trade:hasItemQty(imperialSilk, 1) == true and
                trade:hasItemQty(wolfFelt, 1) == true and
                trade:hasItemQty(silverBrocade, 1) == true and
                trade:getItemCount() == 3 and
                trade:getGil() == 0) then

                rewardThePlayer(player);

             elseif (playersAFChoice == 2 and 
                trade:hasItemQty(karakulCloth, 1) == true and
                trade:hasItemQty(rainbowCloth, 1) == true and
                trade:hasItemQty(rainbowVelvet, 1) == true and
                trade:getItemCount() == 3 and
                trade:getGil() == 0) then

                rewardThePlayer(player);

             elseif (playersAFChoice == 3 and
                trade:hasItemQty(wamouraCloth, 1) == true and
                trade:hasItemQty(moblinWeave, 1) == true and
                trade:hasItemQty(goldBrocade, 1) == true and
                trade:getItemCount() == 3 and
                trade:getGil() == 0) then

                rewardThePlayer(player);
            end;
     end;
end; 

function rewardThePlayer(player)
    local playersAFChoice = player:getVar("dancerAFChoice");
    local currentVanaDay = VanadielDayOfTheYear();
    player:setVar("dancerTailorWorkDay", currentVanaDay);
    player:setVar("dancerTailorCS", 5);
    player:tradeComplete();
    player:startEvent(0x01EF, playersAFChoice-1);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
---local variables for item IDs to make things clearer
    local dancersTiara = 16139;
    local dancersBangles = 15003;
    local dancersToeshoes = 15747;

function onTrigger(player,npc)

    local playersAFChoice = player:getVar("dancerAFChoice");
    local tailorStartedWorkDay = player:getVar("dancerTailorWorkDay");

    if (player:getVar("dancerTailorCS") == 2) then
        player:startEvent(0x01EC);
    elseif (player:getVar("dancerTailorCS") == 3) then

        local completedPieces = player:getVar("dancerCompletedAF");

        local playerCompletedTiara = 0;
        if (bit.band(completedPieces,1) > 0) then
            playerCompletedTiara = 1;
        end;

        local playerCompletedBangles = 0;
        if (bit.band(completedPieces,2) > 0) then
            playerCompletedBangles = 1;
        end;

        local playerCompletedShoes = 0;
        if (bit.band(completedPieces,4) > 0) then
            playerCompletedShoes = 1;
        end;

        local completedPieces = playerCompletedShoes + playerCompletedBangles + playerCompletedTiara;
        if (completedPieces == 3) then 
            player:setVar("dancerTailorCS", 6);
            player:startEvent(0x01F2);
         else
            player:startEvent(0x01ED, playerCompletedTiara, playerCompletedBangles, playerCompletedShoes);
        end;

    elseif (player:getVar("dancerTailorCS") == 4) then

        player:startEvent(0x01EE, playersAFChoice -1); -- event params indexed from 0

    elseif (player:getVar("dancerTailorCS") == 5 )then

        local currentVanaDay = VanadielDayOfTheYear();

        if (currentVanaDay > tailorStartedWorkDay) then

            local dancerAFID = 1; -- variable used to convert player's choice into an Item ID. 
            local playerGender = player:getGender(); --gender is actually important here because it displays the item on screen for you.

            if (playersAFChoice == 1) then
                dancerAFID = dancersTiara - playerGender;
            elseif (playersAFChoice == 2) then
                dancerAFID = dancersBangles - playerGender;
            elseif (playersAFChoice == 3) then
                dancerAFID = dancersToeshoes - playerGender;
            end;

            player:startEvent(0x01F1, dancerAFID);

        else
            player:startEvent(0x01F0); -- not enough time has passed
        end;
    elseif (player:getVar("dancerTailorCS") == 6) then
        player:startEvent(0x01F2);
    else
        player:startEvent(0x01F3);
    end;
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

    local completedPieces = player:getVar("dancerCompletedAF");

    if (csid == 0x01EC) then

        if (option > 0) then -- option 1 - tiara 2 - bangles 3 - shoes
            player:setVar("dancerAFChoice", option);
            player:setVar("dancerTailorCS", 4);
        else
            player:setVar("dancerTailorCS", 3); 
        end;

    elseif (csid == 0x01ED) then

        if (option > 0) then -- option 1 - tiara 2 - bangles 3 - shoes

            local choiceBit = bit.lshift(1, option - 1) --check to see if the player already did this piece

            if (bit.band(choiceBit, completedPieces) == choiceBit) then
                player:startEvent(0x01F2); 

            else
                player:setVar("dancerAFChoice", option);
                player:setVar("dancerTailorCS", 4);
            end;
        end;

    elseif (csid == 0x01F1) then -- reward player the appropriate AF

        local dancerAFID = 1; -- variable used to convert player's choice into an Item ID.
        local playersAFChoice = player:getVar("dancerAFChoice");

        if (playersAFChoice == 1) then
            dancerAFID = dancersTiara;
        elseif (playersAFChoice == 2) then
            dancerAFID = dancersBangles;
        elseif (playersAFChoice == 3) then
            dancerAFID = dancersToeshoes;
        end;

        if (player:getFreeSlotsCount() == 0) then --check to see if the player has enough inventory space before rewarding them.
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, dancerAFID);
        else
            local playerGender = player:getGender();
            player:addItem(dancerAFID - playerGender);
            player:messageSpecial(ITEM_OBTAINED, dancerAFID);

            local allPiecesCompleted = 7;
            if (bit.band(completedPieces, allPiecesCompleted) == allPiecesCompleted) then
                player:setVar("dancerTailorCS",6); -- final cs flag
            else
                local playersReward = bit.lshift(1, playersAFChoice - 1)
                completedPieces = bit.bor(completedPieces, playersReward);
                player:setVar("dancerCompletedAF", completedPieces);
                player:setVar("dancerTailorCS", 3);
             end;
        end;
    else
    --do nothing
    end;
end;