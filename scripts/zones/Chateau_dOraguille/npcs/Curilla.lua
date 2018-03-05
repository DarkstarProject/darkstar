-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit, Lure of the Wildcat (San d'Oria)
-- !pos 27 0.1 0.1 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local mLvL = player:getMainLvl();
    local mJob = player:getMainJob();
    local theGeneralSecret = player:getQuestStatus(SANDORIA,THE_GENERAL_S_SECRET);
    local envelopedInDarkness = player:getQuestStatus(SANDORIA,ENVELOPED_IN_DARKNESS);
    local peaceForTheSpirit = player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT);
    local WildcatSandy = player:getVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,15) == false) then
        player:startEvent(562);
    elseif (theGeneralSecret == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(55); -- Start Quest "The General's Secret"
    elseif (mJob == 5 and mLvL >= AF2_QUEST_LEVEL and player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_COMPLETED and envelopedInDarkness == QUEST_AVAILABLE) then
        player:startEvent(94); -- Start Quest "Enveloped in Darkness"
    elseif (player:hasKeyItem(OLD_POCKET_WATCH) and player:hasKeyItem(OLD_BOOTS) == false) then
        player:startEvent(93);
    elseif (player:hasKeyItem(OLD_BOOTS) and player:getVar("needs_crawler_blood") == 0) then
        player:startEvent(101);
    elseif (player:getVar("needs_crawler_blood") == 1) then
        player:startEvent(117);
    elseif (mJob == 5 and mLvL >= AF2_QUEST_LEVEL and envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(109); -- Start Quest "Peace for the Spirit"
    elseif (peaceForTheSpirit == QUEST_ACCEPTED) then
        player:startEvent(108); -- Standard dialog during Peace of the spirit
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and (player:getVar("peaceForTheSpiritCS") >= 2 and player:getVar("peaceForTheSpiritCS") <= 4)) then
        player:startEvent(113);
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and player:getVar("peaceForTheSpiritCS") == 5) then
        player:startEvent(51);
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(CURILLAS_BOTTLE_EMPTY)) then
        player:startEvent(53);
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(CURILLAS_BOTTLE_FULL)) then
        player:startEvent(54);
    elseif (envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(114); -- Standard dialog after Enveloped in darkness
    elseif (peaceForTheSpirit == QUEST_COMPLETED) then
        player:startEvent(52); -- Standard dialog after Peace of the spirit
    else
        player:startEvent(530); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 55 and option == 1) then
        player:addQuest(SANDORIA,THE_GENERAL_S_SECRET)
        player:addKeyItem(CURILLAS_BOTTLE_EMPTY);
        player:messageSpecial(KEYITEM_OBTAINED,CURILLAS_BOTTLE_EMPTY);
    elseif (csid == 54) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16409); -- Lynx Baghnakhs
        else
            player:delKeyItem(CURILLAS_BOTTLE_FULL);
            player:addItem(16409);
            player:messageSpecial(ITEM_OBTAINED,16409); -- Lynx Baghnakhs
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_GENERAL_S_SECRET);
        end
    elseif (csid == 94 and option == 1) then
        player:addQuest(SANDORIA,ENVELOPED_IN_DARKNESS);
        player:addKeyItem(OLD_POCKET_WATCH);
        player:messageSpecial(KEYITEM_OBTAINED,OLD_POCKET_WATCH);
    elseif (csid == 109 and option == 1) then
        player:addQuest(SANDORIA,PEACE_FOR_THE_SPIRIT);
        player:setVar("needs_crawler_blood",0);
    elseif (csid == 101) then
        player:setVar("needs_crawler_blood",1);
    elseif (csid == 562) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",15,true);
    end

end;
