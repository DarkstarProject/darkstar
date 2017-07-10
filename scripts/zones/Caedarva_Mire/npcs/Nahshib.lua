-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nahshib
-- Type: Assault
-- @pos -274.334 -9.287 -64.255 79
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
            player:startEvent(5);
        elseif (player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(6);
        end;

    -- SHADES OF VENGEANCE
    elseif (toauMission == SHADES_OF_VENGEANCE and player:hasKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT) == false and vanaDay() > player:getVar("TOAUM31_PERMITDAY")) then
        player:startEvent(22);

    -- BEGINNINGS
    elseif (beginnings == QUEST_ACCEPTED) then
        if (not player:hasKeyItem(BRAND_OF_THE_GALESERPENT)) then
            player:startEvent(10); -- brands you
        else
            player:startEvent(11); -- so now i am the teacher?
        end;

    -- ASSAULT
    elseif (toauMission >= PRESIDENT_SALAHEEM) then
        local IPpoint = player:getCurrency("imperial_standing");
        if (player:hasKeyItem(PERIQIA_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND) == false) then
            player:startEvent(148,50,IPpoint);
        else
            player:startEvent(7);
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

    -- SHADES OF VENGEANCE
    elseif (csid == 22) then
        player:setVar("TOAUM31_PERMITDAY",vanaDay());
        player:addKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:messageSpecial(KEYITEM_OBTAINED,PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);

    -- BEGINNINGS
    elseif (csid == 10) then
        player:addKeyItem(BRAND_OF_THE_GALESERPENT);
        player:messageSpecial(KEYITEM_OBTAINED,BRAND_OF_THE_GALESERPENT);

    -- ASSAULT
    elseif (csid == 148 and option == 1) then
        player:delCurrency("imperial_standing", 50);
        player:addKeyItem(ASSAULT_ARMBAND);
        player:messageSpecial(KEYITEM_OBTAINED,ASSAULT_ARMBAND);
    end;
end;
