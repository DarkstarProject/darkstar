-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Imperial Whitegate
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
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

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

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("Update CSID: %u",csid);
    printf("Update RESULT: %u",option);

    if(csid == 3140 or csid == 3155) then
        if (option == 1) then
            player:setVar("TOAU_RINGTIME", os.time());
            player:addItem(15807);
        elseif (option == 2) then
            player:setVar("TOAU_RINGTIME", os.time());
            player:addItem(15808);
        elseif (option == 3) then
            player:setVar("TOAU_RINGTIME", os.time());
            player:addItem(15809);
        elseif (option == 4) then
            player:addItem(129);
        elseif (option == 99) then
            player:updateEvent(15807,15808,15809);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("Finish CSID: %u",csid);
    printf("Finish RESULT: %u",option);

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
    elseif (csid == 3140) then
        player:completeMission(TOAU,IMPERIAL_CORONATION);
        player:addMission(TOAU,THE_EMPRESS_CROWNED);
    elseif (csid == 3155 and option == 6) then
        player:addItem(129);
    end
end;

