-----------------------------------
-- Area: Metalworks
--  NPC: Ayame
-- Involved in Missions
-- Starts and Finishes Quest: True Strength
-- !pos 133 -19 34 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,TRUE_STRENGTH) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1100,1) and trade:getItemCount() == 1) then -- Trade Xalmo Feather
            player:startEvent(749); -- Finish Quest "True Strength"
        end
    end

end;

function onTrigger(player,npc)

    local trueStrength = player:getQuestStatus(BASTOK,TRUE_STRENGTH);
    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,9) == false) then
        player:startEvent(935);
    elseif (player:getCurrentMission(BASTOK) == THE_CRYSTAL_LINE and player:hasKeyItem(C_L_REPORTS)) then
        player:startEvent(712);
    elseif (trueStrength == QUEST_AVAILABLE and player:getMainJob() == JOBS.MNK and player:getMainLvl() >= 50) then
        player:startEvent(748); -- Start Quest "True Strength"
    else
        player:startEvent(701); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 712) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 748) then
        player:addQuest(BASTOK,TRUE_STRENGTH);
    elseif (csid == 749) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14215); -- Temple Hose
        else
            player:tradeComplete();
            player:addTitle(PARAGON_OF_MONK_EXCELLENCE);
            player:addItem(14215);
            player:messageSpecial(ITEM_OBTAINED,14215); -- Temple Hose
            player:addFame(BASTOK,AF3_FAME);
            player:completeQuest(BASTOK,TRUE_STRENGTH);
        end
    elseif (csid == 935) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",9,true);
    end

end;