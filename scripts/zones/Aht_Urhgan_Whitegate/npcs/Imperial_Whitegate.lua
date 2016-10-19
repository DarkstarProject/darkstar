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
    if (player:getCurrentMission(TOAU) == GUESTS_OF_THE_EMPIRE and player:getVar("AhtUrganStatus") == 1 and
            doRoyalPalaceArmorCheck(player) == true and player:getEquipID(SLOT_MAIN) == 0 and 
            player:getEquipID(SLOT_SUB) == 0 and player:getEquipID(SLOT_RANGE) == 0 and
            player:getEquipID(SLOT_AMMO) == 0) then
        player:startEvent(3078,0,1,0,0,0,0,0,1,0);
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

    if(csid == 3078) then
        player:completeMission(TOAU,GUESTS_OF_THE_EMPIRE);
        player:setVar("AhtUrganStatus",0);
        player:addTitle(OVJANGS_ERRAND_RUNNER);
        player:addItem(2186) -- Imperial Mythril Piece Reward
        player:needToZone(true);
        player:setVar("TOAUM18_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,PASSING_GLORY);
    end
end;

