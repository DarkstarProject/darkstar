-----------------------------------
-- Area: Kazham
--  NPC: Rauteinot
-- Starts and Finishes Quest: Missionary Man
-- @zone 250
-- !pos -42 -10 -89
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("MissionaryManVar") == 1 and trade:hasItemQty(1146,1) == true and trade:getItemCount() == 1) then
        player:startEvent(139); -- Trading elshimo marble
    end
end;

function onTrigger(player,npc)
    MissionaryMan = player:getQuestStatus(OUTLANDS,MISSIONARY_MAN);
    MissionaryManVar = player:getVar("MissionaryManVar");

    if (MissionaryMan == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 3) then
        player:startEvent(137,0,1146); -- Start quest "Missionary Man"
    elseif (MissionaryMan == QUEST_ACCEPTED and MissionaryManVar == 1) then
        player:startEvent(138,0,1146); -- During quest (before trade marble) "Missionary Man"
    elseif (MissionaryMan == QUEST_ACCEPTED and (MissionaryManVar == 2 or MissionaryManVar == 3)) then
        player:startEvent(140); -- During quest (after trade marble) "Missionary Man"
    elseif (MissionaryMan == QUEST_ACCEPTED and MissionaryManVar == 4) then
        player:startEvent(141); -- Finish quest "Missionary Man"
    elseif (MissionaryMan == QUEST_COMPLETED) then
        player:startEvent(142); -- New standard dialog
    else
        player:startEvent(136); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 137 and option == 1) then
        player:addQuest(OUTLANDS,MISSIONARY_MAN);
        player:setVar("MissionaryManVar",1);
    elseif (csid == 139) then
        player:setVar("MissionaryManVar",2);
        player:addKeyItem(RAUTEINOTS_PARCEL);
        player:messageSpecial(KEYITEM_OBTAINED,RAUTEINOTS_PARCEL);
        player:tradeComplete();
    elseif (csid == 141) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4728);
        else
            player:setVar("MissionaryManVar",0);
            player:delKeyItem(SUBLIME_STATUE_OF_THE_GODDESS);
            player:addItem(4728);
            player:messageSpecial(ITEM_OBTAINED,4728);
            player:addFame(WINDURST,30);
            player:completeQuest(OUTLANDS,MISSIONARY_MAN);
        end
    end
end;