-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Hanaa Punaa
-- Starts and Finishes: A Squire's Test, A Squire's Test II, A Knight's Test
-- @zone 230
-- !pos
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    -- "The Seamstress" , x3 sheepskin trade
    if (player:getQuestStatus(SANDORIA,THE_SEAMSTRESS) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(505,3) and trade:getItemCount() == 3) then
            player:startEvent(530);
        end
    end

    -- "Black Tiger Skins", Tiger Hide trade
    if (player:getQuestStatus(SANDORIA,BLACK_TIGER_SKINS) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(861,3) and trade:getItemCount() == 3) then
            player:startEvent(577);
        end
    end

    -- "Lizard Skins", lizard skin trade
    if (player:getQuestStatus(SANDORIA,LIZARD_SKINS) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(852,3) and trade:getItemCount() == 3) then
            player:startEvent(561);
        end
    end

    -- "Flyers for Regine"
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    -- Checking Fame Level & Quest
    sanFame = player:getFameLevel(SANDORIA);
    theSteamStress = player:getQuestStatus(SANDORIA,THE_SEAMSTRESS);
    lizardSkins = player:getQuestStatus(SANDORIA,LIZARD_SKINS);
    blackTigerSkins = player:getQuestStatus(SANDORIA,BLACK_TIGER_SKINS);

    -- "The Seamstress" Quest Status
    if (theSteamStress == QUEST_AVAILABLE and player:getVar("theSeamStress") == 1) then
        player:startEvent(531);
    elseif (theSteamStress == QUEST_AVAILABLE) then
        player:startEvent(528);
        player:setVar("theSeamStress",1);
    elseif (theSteamStress == QUEST_ACCEPTED) then
        player:startEvent(529);
    elseif (theSteamStress == QUEST_COMPLETED and sanFame < 2) then
        player:startEvent(590);

    -- "Lizard Skins" Quest Dialogs
    elseif (lizardSkins == QUEST_AVAILABLE and player:getVar("lzdSkins") == 1 and sanFame >= 2 and theSteamStress == QUEST_COMPLETED) then
        player:startEvent(562);
    elseif (lizardSkins == QUEST_AVAILABLE and sanFame >= 2 and theSteamStress == QUEST_COMPLETED) then
        player:startEvent(559);
        player:setVar("lzdSkins",1);
    elseif (lizardSkins == QUEST_ACCEPTED) then
        player:startEvent(560);
    elseif (lizardSkins == QUEST_COMPLETED and sanFame < 3) then
        player:startEvent(591);

    -- "Black Tiger Skins" Quest Dialogs
    elseif (blackTigerSkins == QUEST_AVAILABLE and player:getVar("blkTigerSkin") == 1 and sanFame >= 3 and theSteamStress == QUEST_COMPLETED and lizardSkins == QUEST_COMPLETED) then
        player:startEvent(579 );
    elseif (blackTigerSkins == QUEST_AVAILABLE and sanFame >= 3 and theSteamStress == QUEST_COMPLETED and lizardSkins == QUEST_COMPLETED) then
        player:startEvent(576);
        player:setVar("blkTigerSkin",1);
    elseif (blackTigerSkins == QUEST_ACCEPTED) then
        player:startEvent(578);
    elseif (blackTigerSkins == QUEST_COMPLETED) then
        player:startEvent(592);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- "The Seamstress" Quest
    if ((csid == 528 or csid == 531) and option == 0) then
        player:addQuest(SANDORIA,THE_SEAMSTRESS);
        player:setVar("theSeamStress",0);
    elseif (csid == 530) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12696); -- Leather Gloves
        else
            player:tradeComplete();
            player:addTitle(SILENCER_OF_THE_LAMBS);
            player:addItem(12696);
            player:messageSpecial(ITEM_OBTAINED, 12696); -- Leather Gloves
            if (player:getQuestStatus(SANDORIA,THE_SEAMSTRESS) == QUEST_ACCEPTED) then
                player:addFame(SANDORIA,30);
                player:completeQuest(SANDORIA,THE_SEAMSTRESS);
            else
                player:addFame(SANDORIA,5);
            end
        end

    -- "Liard Skins" Quest
    elseif ((csid == 559 or csid == 562) and option == 0) then
        player:addQuest(SANDORIA,LIZARD_SKINS);
        player:setVar("lzdSkins",0);
    elseif (csid == 561) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12697); -- Lizard Gloves
        else
            player:tradeComplete();
            player:addTitle(LIZARD_SKINNER);
            player:addItem(12697);
            player:messageSpecial(ITEM_OBTAINED, 12697); -- Lizard Gloves
            if (player:getQuestStatus(SANDORIA,LIZARD_SKINS) == QUEST_ACCEPTED) then
                player:addFame(SANDORIA,30);
                player:completeQuest(SANDORIA,LIZARD_SKINS);
            else
                player:addFame(SANDORIA,5);
            end
        end

    -- "Black Tiger Skins" Quest
    elseif ((csid == 576 or csid == 579) and option == 0) then
        player:addQuest(SANDORIA,BLACK_TIGER_SKINS);
        player:setVar("blkTigerSkin",0);
    elseif (csid == 577) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13119); -- Tyger Stole
        else
            player:tradeComplete();
            player:addTitle(CAT_SKINNER);
            player:addItem(13119);
            player:messageSpecial(ITEM_OBTAINED, 13119); -- Tyger Stole
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,BLACK_TIGER_SKINS);
        end
    end

end;