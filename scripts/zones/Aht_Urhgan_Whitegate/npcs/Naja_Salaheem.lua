-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Naja Salaheem
-- Type: Standard NPC
-- @pos 22.700 -8.804 -45.591 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

    local TOAUM3_DAY = player:getVar("TOAUM3_STARTDAY");
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    local needToZone = player:needToZone();

    if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(3002,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == PRESIDENT_SALAHEEM and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(73,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == PRESIDENT_SALAHEEM and player:getVar("AhtUrganStatus") == 2 and TOAUM3_DAY ~= realday and needToZone == true) then
        player:startEvent(3020,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == KNIGHT_OF_GOLD and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(3021,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == WESTERLY_WINDS and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(3028,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == UNDERSEA_SCOUTING) then
        player:startEvent(3051,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == ASTRAL_WAVES) then
        player:startEvent(3052,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == IMPERIAL_SCHEMES) then
        player:startEvent(3070,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER) then
        player:startEvent(3071,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == THE_DOLPHIN_CREST) then
        player:startEvent(3072,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN) then
        player:startEvent(3073,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == GHOSTS_OF_THE_PAST) then
        player:startEvent(3074,0,0,0,0,0,0,0,0,0);
    else
        player:startEvent(3003,1,0,0,0,0,0,0,1,0) -- go back to work
        -- player:messageSpecial(0);--  need to find correct normal chat CS..
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
    if (csid == 73) then
        player:setVar("AhtUrganStatus",2);
        player:setVar("TOAUM3_DAY", os.date("%j")); -- %M for next minute, %j for next day
    elseif (csid == 3002) then
        player:setVar("AhtUrganStatus",0);
        player:completeMission(TOAU,IMMORTAL_SENTRIES);
        player:addMission(TOAU,PRESIDENT_SALAHEEM);
        player:addCurrency("imperial_standing", 150);
        player:addTitle(PRIVATE_SECOND_CLASS);
        player:addKeyItem(PSC_WILDCAT_BADGE);
        player:messageSpecial(KEYITEM_OBTAINED,PSC_WILDCAT_BADGE);
    elseif (csid == 3020) then
        player:setVar("AhtUrganStatus",0);
        player:completeMission(TOAU,PRESIDENT_SALAHEEM);
        player:addMission(TOAU,KNIGHT_OF_GOLD);
        player:setVar("TOAUM3_DAY", 0);
    elseif (csid == 3028) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
        else
            player:addItem(2185,2);
            player:setVar("AhtUrganStatus",0);
            player:completeMission(TOAU,WESTERLY_WINDS);
            player:addMission(TOAU,A_MERCENARY_LIFE);
            player:messageSpecial(ITEM_OBTAINED,2185);
        end
    elseif (csid == 3052) then
        player:completeMission(TOAU,ASTRAL_WAVES);
        player:addMission(TOAU,IMPERIAL_SCHEMES);
    elseif (csid == 3070) then
        player:completeMission(TOAU,IMPERIAL_SCHEMES);
        player:addMission(TOAU,ROYAL_PUPPETEER);
    elseif (csid == 3072) then
        player:completeMission(TOAU,THE_DOLPHIN_CREST);
        player:addMission(TOAU,THE_BLACK_COFFIN);
    elseif (csid == 3074) then
        player:completeMission(TOAU,GHOSTS_OF_THE_PAST);
        player:addMission(TOAU,GUESTS_OF_THE_EMPIRE);
    end
end;