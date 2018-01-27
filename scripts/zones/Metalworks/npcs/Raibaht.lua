-----------------------------------
-- Area: Metalworks
--  NPC: Raibaht
-- Starts and Finishes Quest: Dark Legacy
-- Involved in Quest: The Usual, Riding on the Clouds
-- !pos -27 -10 -1 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 7) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    local darkLegacy = player:getQuestStatus(BASTOK,DARK_LEGACY);
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,5) == false) then
        player:startEvent(933);
    elseif (darkLegacy == QUEST_AVAILABLE and mJob == 8 and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(751); -- Start Quest "Dark Legacy"
    elseif (player:hasKeyItem(DARKSTEEL_FORMULA)) then
        player:startEvent(755); -- Finish Quest "Dark Legacy"
    elseif (player:hasKeyItem(127) and player:getVar("TheUsual_Event") ~= 1) then
        player:startEvent(510);
    else
        player:startEvent(501);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 510 and option == 0) then
        player:setVar("TheUsual_Event",1);
    elseif (csid == 751) then
        player:addQuest(BASTOK,DARK_LEGACY);
        player:setVar("darkLegacyCS",1);
    elseif (csid == 755) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16798); -- Raven Scythe
        else
            player:delKeyItem(DARKSTEEL_FORMULA);
            player:addItem(16798);
            player:messageSpecial(ITEM_OBTAINED, 16798); -- Raven Scythe
            player:setVar("darkLegacyCS",0);
            player:addFame(BASTOK,AF1_FAME);
            player:completeQuest(BASTOK,DARK_LEGACY);
        end
    elseif (csid == 933) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",5,true);
    end

end;