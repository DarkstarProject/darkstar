-----------------------------------
-- Area: Garlaige Citadel [S]
--  NPC: Fondactiont
-- Starts and Finishes Quest: The Fumbling Friar
-- @zone 164
-- !pos -95.210 0.000 195.616
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    TheFumblingFriar = player:getQuestStatus(CRYSTAL_WAR,THE_FUMBLING_FRIAR);
    
	-- Change to BRASS_RIBBON_OF_SERVICE later when Campaign has been added.
    if (TheFumblingFriar == QUEST_AVAILABLE and player:hasKeyItem(dsp.ki.BRONZE_RIBBON_OF_SERVICE) == true and player:getMainLvl() >= 30) then
        player:startEvent(26); -- Start quest "The Fumbling Friar"
    elseif (TheFumblingFriar == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.ORNATE_PACKAGE) == true) then
            player:startEvent(28); -- During quest "The Fumbling Friar" (with Ornate Package KI)
        else
            player:startEvent(27); -- During quest "The Fumbling Friar" (before retrieving KI Ornate Package)
        end
    elseif (TheFumblingFriar == QUEST_COMPLETED) then
        player:startEvent(29); -- New standard dialog after "The Fumbling Friar"
    else
        player:startEvent(25); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
    if (csid == 26 and option == 0) then
        player:addQuest(CRYSTAL_WAR,THE_FUMBLING_FRIAR);
    elseif (csid == 28) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4688);
        else
            player:delKeyItem(dsp.ki.ORNATE_PACKAGE);
            player:addItem(4688);
            player:messageSpecial(ITEM_OBTAINED,4688);
            player:completeQuest(CRYSTAL_WAR,THE_FUMBLING_FRIAR);
        end
    end
end;

