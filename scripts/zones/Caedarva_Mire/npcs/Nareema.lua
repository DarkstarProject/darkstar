-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nareema
-- Type: Assault
-- @pos 518.387 -24.707 -467.297 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Caedarva_Mire/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local toauMission = player:getCurrentMission(TOAU);
    local beginnings = player:getQuestStatus(AHT_URHGAN,BEGINNINGS);

    -- IMMORTAL SENTRIES
    if (toauMission == IMMORTAL_SENTRIES) then
        if (player:hasKeyItem(SUPPLIES_PACKAGE)) then
            player:startEvent(5,1);
        elseif (player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(6,1);
        end;

    -- BEGINNINGS
    elseif (beginnings == QUEST_ACCEPTED) then
        if (not player:hasKeyItem(BRAND_OF_THE_STONESERPENT)) then
            player:startEvent(12); -- brands you
        else
            player:startEvent(13); -- blue muddies the purest waters
        end;

    -- ASSAULT
    elseif (toauMission >= PRESIDENT_SALAHEEM) then
        local IPpoint = player:getCurrency("imperial_standing");
        if (player:hasKeyItem(LEUJAOAM_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND) == false) then
            player:startEvent(149,50,IPpoint);
        else
            player:startEvent(7,1);
            -- player:delKeyItem(ASSAULT_ARMBAND);
        end;

    -- DEFAULT DIALOG
    else
        player:startEvent(4);
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
    -- IMMORTAL SENTRIES
    if (csid == 5 and option == 1) then
        player:delKeyItem(SUPPLIES_PACKAGE);
        player:setVar("AhtUrganStatus",1);

    -- BEGINNINGS
    elseif (csid == 12) then
        player:addKeyItem(BRAND_OF_THE_STONESERPENT);
        player:messageSpecial(KEYITEM_OBTAINED,BRAND_OF_THE_STONESERPENT);

    -- ASSAULT
    elseif (csid == 149 and option == 1) then
        player:delCurrency("imperial_standing", 50);
        player:addKeyItem(ASSAULT_ARMBAND);
        player:messageSpecial(KEYITEM_OBTAINED,ASSAULT_ARMBAND);
    end;
end;
