-----------------------------------
-- Area: Bastok Markets
--  NPC: Arawn
-- Starts & Finishes Quest: Stamp Hunt
-- !pos -121.492 -4.000 -123.923 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);
    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,11) == false) then
        player:startEvent(429);
    elseif (StampHunt == QUEST_AVAILABLE) then
        player:startEvent(225);
    elseif (StampHunt == QUEST_ACCEPTED and player:isMaskFull(player:getVar("StampHunt_Mask"),7) == true) then
        player:startEvent(226);
    else
        player:startEvent(114);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 225 and option == 0) then
        player:addQuest(BASTOK,STAMP_HUNT);
        player:addKeyItem(STAMP_SHEET);
        player:messageSpecial(KEYITEM_OBTAINED,STAMP_SHEET);
    elseif (csid == 226) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addTitle(STAMPEDER);
            player:addItem(13081);
            player:messageSpecial(ITEM_OBTAINED,13081); -- Leather Gorget
            player:delKeyItem(STAMP_SHEET);
            player:setVar("StampHunt_Mask",0);
            player:addFame(BASTOK,50);
            player:completeQuest(BASTOK,STAMP_HUNT);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 13081);
        end
    elseif (csid == 429) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",11,true);
    end

end;