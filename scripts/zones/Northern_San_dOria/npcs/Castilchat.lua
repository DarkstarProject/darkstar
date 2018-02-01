-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Castilchat
-- Starts Quest: Trial Size Trial by Ice
-- !pos -186 0 107 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/status");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    -- "Flyers for Regine" conditional script
    local count = trade:getItemCount();
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED and trade:hasItemQty(532,1) and count == 1) then
        player:messageSpecial(FLYER_REFUSED);
    elseif (trade:hasItemQty(1545,1) and player:getQuestStatus(SANDORIA,TRIAL_SIZE_TRIAL_BY_ICE) == QUEST_ACCEPTED and player:getMainJob() == JOBS.SMN and count == 1) then -- Trade mini fork of ice
        player:startEvent(734,0,1545,4,20);
    end

end;

function onTrigger(player,npc)

    local TrialSizeByIce = player:getQuestStatus(SANDORIA,TRIAL_SIZE_TRIAL_BY_ICE);

    if (player:getMainLvl() >= 20 and player:getMainJob() == JOBS.SMN and TrialSizeByIce == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then -- Requires player to be Summoner at least lvl 20
        player:startEvent(733,0,1545,4,20);     --mini tuning fork of ice, zone, level
    elseif (TrialSizeByIce == QUEST_ACCEPTED) then
        local IceFork = player:hasItem(1545);

        if (IceFork) then
            player:startEvent(708); --Dialogue given to remind player to be prepared
        elseif (IceFork == false and tonumber(os.date("%j")) ~= player:getVar("TrialSizeIce_date")) then
            player:startEvent(737,0,1545,4,20); -- Need another mini tuning fork
        else
            player:startEvent(758); -- Standard dialog when you loose, and you don't wait 1 real day
        end
    elseif (TrialSizeByIce == QUEST_COMPLETED) then
        player:startEvent(736); -- Defeated Avatar
    else
        player:startEvent(711); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 733 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1545);
        else
            player:setVar("TrialSizeIce_date", 0);
            player:addQuest(SANDORIA,TRIAL_SIZE_TRIAL_BY_ICE);
            player:addItem(1545);
            player:messageSpecial(ITEM_OBTAINED,1545);
        end
    elseif (csid == 734 and option == 0 or csid == 737) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1545);
        else
            player:addItem(1545);
            player:messageSpecial(ITEM_OBTAINED,1545);
        end
    elseif (csid == 734 and option == 1) then
        toCloisterOfFrost(player);
    end

end;