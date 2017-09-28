-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Chalvatot
-- Finish Mission "The Crystal Spring"
-- Start & Finishes Quests: Her Majesty's Garden
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -105 0.1 72 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local flyersForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
    local herMajestysGarden = player:getQuestStatus(SANDORIA,HER_MAJESTY_S_GARDEN);

    -- FLYERS FOR REGINE (magicmart flyer)
    if (flyersForRegine == QUEST_ACCEPTED and trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
        player:messageSpecial(FLYER_REFUSED);

    -- HER MAJESTY'S GARDEN (derfland humus)
    elseif (herMajestysGarden == QUEST_ACCEPTED and trade:hasItemQty(533,1) and trade:getItemCount() == 1) then
        player:startEvent(0x0053);

    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);
    local circleProgress = player:getVar("circleTime");
    local lureOfTheWildcat = player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
    local WildcatSandy = player:getVar("WildcatSandy");
    local herMajestysGarden = player:getQuestStatus(SANDORIA,HER_MAJESTY_S_GARDEN);

    -- THE CRYSTAL SPRING (San d'Oria 3-2)
    if (currentMission == THE_CRYSTAL_SPRING and MissionStatus == 3) then
        player:startEvent(0x022c);

    -- LEAUTE'S LAST WISHES (San d'Oria 6-1)
    elseif (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 4 and player:hasKeyItem(DREAMROSE)) then
        player:startEvent(0x006f);

    -- CIRCLE OF TIME (Bard AF3)
    elseif (circleOfTime == QUEST_ACCEPTED) then
        if (circleProgress == 5) then
            player:startEvent(0x0063);
        elseif (circleProgress == 6) then
            player:startEvent(0x0062);
        elseif (circleProgress == 7) then
            player:startEvent(0x0061);
        elseif (circleProgress == 9) then
            player:startEvent(0x0060);
        end;

    -- LURE OF THE WILDCAT
    elseif (lureOfTheWildcat == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,19) == false) then
        player:startEvent(0x0231);

    -- HER MAJESTY'S GARDEN
    elseif (herMajestysGarden == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 4) then
        player:startEvent(0x0054);
    elseif (herMajestysGarden == QUEST_ACCEPTED) then
        player:startEvent(0x0052);

    -- DEFAULT DIALOG
    else
        player:startEvent(0x0213);
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- SAN D'ORIA MISSIONS
    if (csid == 0x022c or csid == 0x006f) then
        finishMissionTimeline(player,3,csid,option);

    -- CIRCLE OF TIME
    elseif (csid == 0x0063 and option == 0) then
        player:setVar("circleTime",6);
    elseif ((csid == 0x0062 or csid == 0x0063) and option == 1) then
        player:setVar("circleTime",7);
        player:addKeyItem(MOON_RING);
        player:messageSpecial(KEYITEM_OBTAINED,MOON_RING);
    elseif (csid == 0x0060) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(12647);
            player:messageSpecial(ITEM_OBTAINED,12647)
            player:completeQuest(JEUNO,THE_CIRCLE_OF_TIME);
            player:addTitle(PARAGON_OF_BARD_EXCELLENCE);
            player:setVar("circleTime",0);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED);
        end;

    -- LURE OF THE WILDCAT
    elseif (csid == 0x0231) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",19,true);

    -- HER MAJESTY'S GARDEN
    elseif (csid == 0x0054 and option == 1) then
        player:addQuest(SANDORIA,HER_MAJESTY_S_GARDEN);
    elseif (csid == 0x0053) then
        player:tradeComplete();
        player:addKeyItem(MAP_OF_THE_NORTHLANDS_AREA);
        player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_NORTHLANDS_AREA);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,HER_MAJESTY_S_GARDEN);

    end;
end;
