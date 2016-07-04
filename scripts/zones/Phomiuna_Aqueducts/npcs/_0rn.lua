-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:   _0rn (Oil lamp)
-- @pos -60 -23 60 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local DoorOffset = npc:getID();

    player:messageSpecial(LAMP_OFFSET+2); -- water lamp
    npc:openDoor(7); -- lamp animation

    local element = VanadielDayElement();
    --printf("element: %u",element);

    if (element == 2) then -- waterday
        if (GetNPCByID(DoorOffset+7):getAnimation() == 8) then -- lamp fire open?
            GetNPCByID(DoorOffset-2):openDoor(15); -- Open Door _0rk
        end
    elseif (element == 5) then -- lighningday
        if (GetNPCByID(DoorOffset+2):getAnimation() == 8) then -- lamp lightning open?
            GetNPCByID(DoorOffset-2):openDoor(15); -- Open Door _0rk
        end
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
end;