-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nahshib
-- Type: Assault
-- @pos -274.334 -9.287 -64.255 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local IPpoint = player:getCurrency("imperial_standing");

    if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES) then
        if (player:hasKeyItem(SUPPLIES_PACKAGE)) then
            player:startEvent(5);
        elseif (player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(6);
        end
    elseif (player:getCurrentMission(TOAU) >= PRESIDENT_SALAHEEM) then
        if (player:hasKeyItem(PERIQIA_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND) == false) then
            player:startEvent(148,50,IPpoint);
        else
            player:startEvent(7);
            -- player:delKeyItem(ASSAULT_ARMBAND);
        end
    else
        player:startEvent(4);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 5 and option == 1) then
        player:delKeyItem(SUPPLIES_PACKAGE);
        player:setVar("AhtUrganStatus",1);
    elseif (csid == 148 and option == 1) then
        player:delCurrency("imperial_standing", 50);
        player:addKeyItem(ASSAULT_ARMBAND);
        player:messageSpecial(KEYITEM_OBTAINED,ASSAULT_ARMBAND);
    end
end;
