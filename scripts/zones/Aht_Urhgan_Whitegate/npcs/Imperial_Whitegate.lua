-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Imperial Whitegate
-- pos: 152, -2, 0, 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/besieged");
require("scripts/zones/Aht_Urhgan_Whitegate/Shared");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getEquipID(SLOT_MAIN) == 0 and player:getEquipID(SLOT_SUB) == 0 and
            player:getEquipID(SLOT_RANGE) == 0 and player:getEquipID(SLOT_AMMO) == 0) then
        if (player:getCurrentMission(TOAU) == GUESTS_OF_THE_EMPIRE and player:getVar("AhtUrganStatus") == 1 and
                doRoyalPalaceArmorCheck(player) == true) then
            player:startEvent(3078,0,1,0,0,0,0,0,1,0);
        elseif (player:getCurrentMission(TOAU) == SEAL_OF_THE_SERPENT) then
            player:startEvent(3111);
        elseif (player:getCurrentMission(TOAU) == IMPERIAL_CORONATION and
                doRoyalPalaceArmorCheck(player) == true) then
            player:startEvent(3140,getMercenaryRank(player),player:getTitle(),0,0,0,0,0,0,0);
        elseif (player:getCurrentMission(TOAU) >= IMPERIAL_CORONATION and
                doRoyalPalaceArmorCheck(player) == true) then
            local ring = player:getVar("TOAU_RINGTIME");
            local standard = player:hasItem(129);

            local ringParam = 0;

            if (ring == 0) then
                ringParam = 1;
            end

            local standardParam = 0;

            if (standard == false) then
                standardParam = 1;
            end

            if (ringParam > 0 or standardParam > 0) then
                player:startEvent(3155,standardParam,ringParam,0,0,0,0,0,0,0);
            end
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("Update CSID: %u",csid);
    -- printf("Update RESULT: %u",option);

    if(csid == 3140 or csid == 3155) then
        if (option == 1) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15807);
            else
                player:setVar("TOAU_RINGTIME", os.time());
                player:setVar("TOAU_RINGRECV", 1);
                player:addItem(15807);
                player:messageSpecial(ITEM_OBTAINED,15807);
            end
        elseif (option == 2) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15808);
            else
                player:setVar("TOAU_RINGTIME", os.time());
                player:setVar("TOAU_RINGRECV", 1);
                player:addItem(15808);
                player:messageSpecial(ITEM_OBTAINED,15808);
            end
        elseif (option == 3) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15809);
            else
                player:setVar("TOAU_RINGTIME", os.time());
                player:setVar("TOAU_RINGRECV", 1);
                player:addItem(15809);
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15809);
            end
        elseif (option == 4) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,129);
            else
                player:addItem(129);
                player:messageSpecial(ITEM_OBTAINED,129);
            end
        elseif (option == 99) then
            player:updateEvent(15807,15808,15809);
        end
    end
end;

function onEventFinish(player,csid,option)
    -- printf("Finish CSID: %u",csid);
    -- printf("Finish RESULT: %u",option);

    if (csid == 3078) then
        player:completeMission(TOAU,GUESTS_OF_THE_EMPIRE);
        player:setVar("AhtUrganStatus",0);
        player:addTitle(OVJANGS_ERRAND_RUNNER);
        player:addItem(2186) -- Imperial Mythril Piece Reward
        player:needToZone(true);
        player:setVar("TOAUM18_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,PASSING_GLORY);
    elseif (csid == 3111) then
        player:completeMission(TOAU,SEAL_OF_THE_SERPENT);
        player:addMission(TOAU,MISPLACED_NOBILITY);
    elseif (csid == 3140 and player:getVar("TOAU_RINGRECV") == 1) then
        player:completeMission(TOAU,IMPERIAL_CORONATION);
        player:addMission(TOAU,THE_EMPRESS_CROWNED);
        player:setVar("TOAU_RINGRECV", 0);
    elseif (csid == 3155 and option == 6) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,129);
        else
            player:addItem(129);
            player:messageSpecial(ITEM_OBTAINED,129);
        end
    end
end;

