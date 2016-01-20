-----------------------------------
-- Area: Bhaflau Thickets
-- NPC:  Runic Portal
-- Mamook Ja Teleporter Back to Aht Urgan Whitegate
-- @pos -211 -11 -818 52
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/zones/Bhaflau_Thickets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(TOAU)== IMMORTAL_SENTRIES) then
        if (player:getVar("TOAUM2") == 1) then
            player:startEvent(0x006F);
        else
            player:startEvent(0x006D);
        end
    elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
        if (hasRunicPortal(player,3) == 1) then
            player:startEvent(0x006D);
        else
            player:startEvent(0x006F);
        end
    else
        player:messageSpecial(RESPONSE);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x006F and option == 1) then
        if (player:getVar("TOAUM2") == 1) then
            player:setVar("TOAUM2",2);
        end
        player:addNationTeleport(AHTURHGAN,8);
        toChamberOfPassage(player);
    elseif (csid == 0x006D and option == 1) then
        toChamberOfPassage(player);
    end
    
end;