-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Sobane
-- Starts and Finishes Quest: Signed in Blood
-- Involved in quest: Sharpening the Sword, Riding on the Clouds
-- !pos -190 -3 97 230
-- csid: 52  732  733  734  735  736  737  738  739  740  741
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/player");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    -- FLYERS FOR REGINE QUEST --
    if (trade:hasItemQty(532,1) and count == 1) then -- Trade Magicmart Flyer
        if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
            player:messageSpecial(FLYER_REFUSED);
        end

    -- SIGNED IN BLOOD QUEST --
    elseif (trade:hasItemQty(1662,1) and count == 1) then
        if (player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD) == QUEST_ACCEPTED and player:getVar("SIGNED_IN_BLOOD_Prog") < 1) then
            player:startEvent(734,0,1662);
        end

    -- RIDING ON THE CLOUDS QUEST --
    elseif (trade:hasItemQty(1127,1) and count == 1) then -- Trade Kindred seal
        if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 2) then
            player:setVar("ridingOnTheClouds_1",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SCOWLING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SCOWLING_STONE);
        end
    end
end;

function onTrigger(player,npc)
    local blood = player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD);
    local bloodProg = player:getVar("SIGNED_IN_BLOOD_Prog");
        if (player:getVar("sharpeningTheSwordCS") >= 2) then
        player:startEvent(52);

        elseif (blood == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
        player:startEvent(732,0,1662); -- Start Quest

    elseif (blood == QUEST_ACCEPTED and bloodProg < 1) then
        player:startEvent(733,0,1662); -- after

    elseif (bloodProg == 3 and blood == QUEST_ACCEPTED) then
        player:startEvent(736); -- complete

    elseif (bloodProg >= 1 and blood == QUEST_ACCEPTED) then
        player:startEvent(735);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 732 and option == 1) then
        player:addQuest(SANDORIA,SIGNED_IN_BLOOD);

    elseif (csid == 736) then
        if (player:getFreeSlotsCount() >= 1) then
            player:delKeyItem(dsp.ki.TORN_OUT_PAGES);
            player:addItem(14760,1);
            player:messageSpecial(ITEM_OBTAINED,14760);
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,SIGNED_IN_BLOOD);
            player:setVar("SIGNED_IN_BLOOD_Prog",0);
            player:addGil(GIL_RATE*3500);
            player:tradeComplete();
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14760);
        end
    elseif (csid == 52) then
        player:setVar("sharpeningTheSwordCS",3);

    elseif (csid == 734) then
        player:setVar("SIGNED_IN_BLOOD_Prog",1);
    end



end;
