-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nareema
-- Type: Assault
-- !pos 518.387 -24.707 -467.297 79
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
local ID = require("scripts/zones/Caedarva_Mire/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local toauMission = player:getCurrentMission(TOAU);
    local beginnings = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.BEGINNINGS);

    -- IMMORTAL SENTRIES
    if (toauMission == dsp.mission.id.toau.IMMORTAL_SENTRIES) then
        if (player:hasKeyItem(dsp.ki.SUPPLIES_PACKAGE)) then
            player:startEvent(5,1);
        elseif (player:getCharVar("AhtUrganStatus") == 1) then
            player:startEvent(6,1);
        end;

    -- BEGINNINGS
    elseif (beginnings == QUEST_ACCEPTED) then
        if (not player:hasKeyItem(dsp.ki.BRAND_OF_THE_STONESERPENT)) then
            player:startEvent(12); -- brands you
        else
            player:startEvent(13); -- blue muddies the purest waters
        end;

    -- ASSAULT
    elseif (toauMission >= dsp.mission.id.toau.PRESIDENT_SALAHEEM) then
        local IPpoint = player:getCurrency("imperial_standing");
        if (player:hasKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS) and player:hasKeyItem(dsp.ki.ASSAULT_ARMBAND) == false) then
            player:startEvent(149,50,IPpoint);
        else
            player:startEvent(7,1);
            -- player:delKeyItem(dsp.ki.ASSAULT_ARMBAND);
        end;

    -- DEFAULT DIALOG
    else
        player:startEvent(4);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- IMMORTAL SENTRIES
    if (csid == 5 and option == 1) then
        player:delKeyItem(dsp.ki.SUPPLIES_PACKAGE);
        player:setCharVar("AhtUrganStatus",1);

    -- BEGINNINGS
    elseif (csid == 12) then
        player:addKeyItem(dsp.ki.BRAND_OF_THE_STONESERPENT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BRAND_OF_THE_STONESERPENT);

    -- ASSAULT
    elseif (csid == 149 and option == 1) then
        player:delCurrency("imperial_standing", 50);
        player:addKeyItem(dsp.ki.ASSAULT_ARMBAND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ASSAULT_ARMBAND);
    end;
end;
