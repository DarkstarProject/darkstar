-----------------------------------
-- Area: Lower Jeuno
--  NPC: Door: "Neptune's Spire"
-- Starts and Finishes Quest: Beat Around the Bushin
-- !pos 35 0 -15 245
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Lower_Jeuno/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.BEAT_AROUND_THE_BUSHIN) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1526,1) == true and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 2) then
            player:startEvent(156); -- After trade Wyrm Beard
        elseif (trade:hasItemQty(1527,1) == true and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 4) then
            player:startEvent(157); -- After trade Behemoth Tongue
        elseif (trade:hasItemQty(1525,1) == true and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 6) then
            player:startEvent(158); -- After trade Adamantoise Egg
        elseif (trade:hasItemQty(13202,1) == true and trade:getItemCount() == 1 and player:getVar("BeatAroundTheBushin") == 7) then
            player:startEvent(159); -- After trade Brown Belt, Finish Quest "Beat around the Bushin"
        end
    end
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(86); --COP event
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.TENDING_AGED_WOUNDS and player:getVar("PromathiaStatus")==1) then
        player:startEvent(22); --COP event
    elseif (player:getVar("BeatAroundTheBushin") == 1) then
        player:startEvent(155); -- Start Quest "Beat around the Bushin"
    elseif (player:hasKeyItem(dsp.ki.TENSHODO_MEMBERS_CARD) == true) then
        player:startEvent(105); -- Open the door
    else
        player:messageSpecial(ID.text.ITS_LOCKED);
        return 1;
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 86 ) then
        player:setVar("PromathiaStatus",1);
        player:startEvent(9);
    elseif (csid == 22 ) then
        player:completeMission(COP,dsp.mission.id.cop.TENDING_AGED_WOUNDS);
        player:addMission(COP,dsp.mission.id.cop.DARKNESS_NAMED);
        player:setVar("PromathiaStatus",0);
        player:startEvent(10);
    elseif (csid == 155) then
        player:addQuest(JEUNO,dsp.quest.id.jeuno.BEAT_AROUND_THE_BUSHIN);
        player:setVar("BeatAroundTheBushin",2);
    elseif (csid == 156) then
        player:setVar("BeatAroundTheBushin",3);
        player:tradeComplete();
    elseif (csid == 157) then
        player:setVar("BeatAroundTheBushin",5);
        player:tradeComplete();
    elseif (csid == 158) then
        player:setVar("BeatAroundTheBushin",7);
        player:tradeComplete();
    elseif (csid == 159) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,13186);
        else
            player:addTitle(dsp.title.BLACK_BELT);
            player:addItem(13186);
            player:messageSpecial(ID.text.ITEM_OBTAINED,13186);
            player:setVar("BeatAroundTheBushin",0);
            player:addFame(NORG,125);
            player:tradeComplete();
            player:completeQuest(JEUNO,dsp.quest.id.jeuno.BEAT_AROUND_THE_BUSHIN);
        end
    end
end;