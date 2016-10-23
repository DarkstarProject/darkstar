-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Naja Salaheem
-- Type: Standard NPC
-- @pos 22.700 -8.804 -45.591 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;

-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/Shared");
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
    elseif (player:getCurrentMission(TOAU) == PRESIDENT_SALAHEEM and player:getVar("AhtUrganStatus") == 2 and TOAUM3_DAY ~= realday and needToZone == false) then
        player:startEvent(3020,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == KNIGHT_OF_GOLD and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(3021,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == WESTERLY_WINDS and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(3028,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == UNDERSEA_SCOUTING) then
        player:startEvent(3051,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == ASTRAL_WAVES) then
        player:startEvent(3052,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == IMPERIAL_SCHEMES and player:getVar("TOAUM11_STARTDAY") ~= VanadielDayOfTheYear() and needToZone == false) then
        player:startEvent(3070,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER) then
        player:startEvent(3071,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == THE_DOLPHIN_CREST) then
        player:startEvent(3072,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN) then
        player:startEvent(3073,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == GHOSTS_OF_THE_PAST_TOAU) then
        if (doRoyalPalaceArmorCheck(player) == true) then
            player:startEvent(3074,1,0,0,0,0,0,0,1,0);
        else
            player:startEvent(3074,0,0,0,0,0,0,0,0,0);
        end
    elseif (player:getCurrentMission(TOAU) == GUESTS_OF_THE_EMPIRE) then
        if (doRoyalPalaceArmorCheck(player) == true) then
            if (player:getVar("AhtUrganStatus") == 0) then
                player:startEvent(3076,1,0,0,0,0,0,0,1,0);
            else
                player:startEvent(3077,1,0,0,0,0,0,0,1,0);
            end
        else
            if (player:getVar("AhtUrganStatus") == 0) then
                player:startEvent(3076,0,0,0,0,0,0,0,0,0);
            else
                player:startEvent(3077,0,0,0,0,0,0,0,0,0);
            end
        end
    elseif (player:getCurrentMission(TOAU) == PASSING_GLORY and player:getVar("TOAUM18_STARTDAY") ~= VanadielDayOfTheYear() and needToZone == false) then
        player:startEvent(3090,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == IN_THE_BLOOD) then
        player:startEvent(3113,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == SENTINELS_HONOR) then
        if(player:getVar("TOAUM18_STARTDAY") ~= VanadielDayOfTheYear() and needToZone == false) then
            player:startEvent(3130,0,0,0,0,0,0,0,0,0);
        else
            player:startEvent(3120,0,0,0,0,0,0,0,0,0);
        end
    elseif (player:getCurrentMission(TOAU) == FANGS_OF_THE_LION) then
        player:startEvent(3138,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == NASHMEIRAS_PLEA and player:hasKeyItem(MYTHRIL_MIRROR) == false) then
        player:startEvent(3149,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == RAGNAROK) then
        player:startEvent(3139,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == IMPERIAL_CORONATION) then
        player:startEvent(3150,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == THE_EMPRESS_CROWNED) then
        player:startEvent(3144,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == ETERNAL_MERCENARY) then
        player:startEvent(3154,0,0,0,0,0,0,0,0,0);
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
            player:needToZone(true);
        end
    elseif (csid == 3052) then
        player:completeMission(TOAU,ASTRAL_WAVES);
        player:needToZone(true);
        player:setVar("TOAUM11_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,IMPERIAL_SCHEMES);
    elseif (csid == 3070) then
        player:completeMission(TOAU,IMPERIAL_SCHEMES);
        player:setVar("TOAUM11_STARTDAY", 0);
        player:addMission(TOAU,ROYAL_PUPPETEER);
    elseif (csid == 3072) then
        player:completeMission(TOAU,THE_DOLPHIN_CREST);
        player:addMission(TOAU,THE_BLACK_COFFIN);
    elseif (csid == 3074) then
        player:completeMission(TOAU,GHOSTS_OF_THE_PAST_TOAU);
        player:addMission(TOAU,GUESTS_OF_THE_EMPIRE);

        if(option == 2) then
            player:setVar("AhtUrganStatus", 1);
        end
    elseif (csid == 3090) then
        player:completeMission(TOAU,PASSING_GLORY);
        player:setVar("TOAUM18_STARTDAY", 0);
        player:addMission(TOAU,SWEETS_FOR_THE_SOUL);
    elseif (csid == 3113) then
        player:completeMission(TOAU,IN_THE_BLOOD);
        player:setVar("TOAUM33_STARTDAY", VanadielDayOfTheYear());
        player:needToZone(true);
        player:addItem(2187);
        player:messageSpecial(ITEM_OBTAINED,2187);
        player:addMission(TOAU,SENTINELS_HONOR);
    elseif (csid == 3130) then
        player:completeMission(TOAU,SENTINELS_HONOR);
        player:setVar("TOAUM33_STARTDAY", 0);
        player:addMission(TOAU,TESTING_THE_WATERS);
    elseif (csid == 3138) then
        player:completeMission(TOAU,FANGS_OF_THE_LION);
        player:addKeyItem(MYTHRIL_MIRROR);
        player:messageSpecial(KEYITEM_OBTAINED,MYTHRIL_MIRROR);
        player:setTitle(NASHMEIRAS_LOYALIST);
        player:addMission(TOAU,NASHMEIRAS_PLEA);
    elseif (csid == 3139) then
        player:completeMission(TOAU,RAGNAROK);
        player:addMission(TOAU,IMPERIAL_CORONATION);
    elseif (csid == 3144) then
        player:completeMission(TOAU,THE_EMPRESS_CROWNED);
        player:addItem(16070);
        player:messageSpecial(ITEM_OBTAINED,16070);
        player:addMission(TOAU,ETERNAL_MERCENARY);
    elseif (csid == 3149) then
        player:messageSpecial(KEYITEM_OBTAINED,MYTHRIL_MIRROR);
        player:addKeyItem(MYTHRIL_MIRROR);
    elseif (csid == 3076 and option == 0) then
        player:setVar("AhtUrganStatus", 1);
    end
end;
