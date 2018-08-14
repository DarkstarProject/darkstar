-----------------------------------
-- Area: Selbina
--  NPC: Thunder Hawk
-- Starts and Finishes Quest: The Rescue
-- !pos -58 -10 6 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TheRescue = player:getQuestStatus(OTHER_AREAS_LOG,THE_RESCUE);
    local SelbiFame = math.floor((player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK)) / 2); -- Selbina Fame

    if (TheRescue == QUEST_AVAILABLE and SelbiFame >= 1) then
        player:startEvent(80); -- Start quest "The rescue"
    elseif (TheRescue == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TRADERS_SACK) == false) then
        player:startEvent(83); -- During quest "The rescue"
    elseif (TheRescue == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TRADERS_SACK) == true) then
        player:startEvent(81); -- Finish quest "The rescue"
    elseif (TheRescue == QUEST_COMPLETED) then
        player:startEvent(82); -- New standard dialog
    else
        player:startEvent(84); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 80 and option == 70) then
        player:addQuest(OTHER_AREAS_LOG,THE_RESCUE);
    elseif (csid == 81) then
        player:completeQuest(OTHER_AREAS_LOG,THE_RESCUE);
        player:addTitle(dsp.title.HONORARY_CITIZEN_OF_SELBINA);
        player:delKeyItem(dsp.ki.TRADERS_SACK);
        if (player:hasKeyItem(dsp.ki.MAP_OF_THE_RANGUEMONT_PASS) == false) then
            player:addKeyItem(dsp.ki.MAP_OF_THE_RANGUEMONT_PASS);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MAP_OF_THE_RANGUEMONT_PASS);
        end
        player:addGil(3000);
        player:messageSpecial(GIL_OBTAINED,3000);
        player:addFame(SELBINA,30);
    end
end;

