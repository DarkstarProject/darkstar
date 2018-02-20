-----------------------------------
-- Area: Port Bastok
--  NPC: Powhatan
-- Starts & Ends Quest: Welcome to Bastok, Guest of Hauteur
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

 WelcometoBastok = player:getQuestStatus(BASTOK,WELCOME_TO_BASTOK);
 GuestofHauteur = player:getQuestStatus(BASTOK,GUEST_OF_HAUTEUR);

    if (WelcometoBastok ~= QUEST_COMPLETED) then
        wtbStatus = player:getVar("WelcometoBastok_Event");

        if (WelcometoBastok == QUEST_AVAILABLE) then
            player:startEvent(50);
        else
            if (wtbStatus == 0) then
                player:startEvent(51);
            elseif (wtbStatus == 1) then
                player:startEvent(53);
            end
        end
    elseif (GuestofHauteur ~= QUEST_COMPLETED and WelcometoBastok == QUEST_COMPLETED and player:getFameLevel(BASTOK) >= 3 and player:getMainLvl() >= 31) then
         gohStatus = player:getVar("GuestofHauteur_Event");

        if (GuestofHauteur == QUEST_AVAILABLE) then
            player:startEvent(55);
        else
            if (gohStatus == 0) then
                player:startEvent(56);
            elseif (gohStatus == 1) then
                player:startEvent(58);
            end
        end
    else
        player:messageSpecial(POWHATAN_DIALOG_1);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 50 and option == 0) then
        player:addQuest(BASTOK,WELCOME_TO_BASTOK);
    elseif (csid == 53) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16565);
        else
            player:addTitle(BASTOK_WELCOMING_COMMITTEE);
            player:addItem(16565);
            player:messageSpecial(ITEM_OBTAINED,16565); -- Spatha
            player:setVar("WelcomeToBastok_Event",0);
            player:addFame(BASTOK,80);
            player:completeQuest(BASTOK,WELCOME_TO_BASTOK);
        end
    elseif (csid == 55 and option == 0) then
        player:addQuest(BASTOK,GUEST_OF_HAUTEUR);
    elseif (csid == 58) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12300);
        else
            player:addTitle(BASTOK_WELCOMING_COMMITTEE);
            player:addItem(12300);
            player:messageSpecial(ITEM_OBTAINED,12300); -- Targe
            player:delKeyItem(LETTERS_FROM_DOMIEN);
            player:setVar("GuestofHauteur_Event",0);
            player:addFame(BASTOK,80);
            player:completeQuest(BASTOK,GUEST_OF_HAUTEUR);
        end
    end

end;