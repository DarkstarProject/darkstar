-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  _0rw (Oil Lamp)
-- Notes: Opens south door at J-9 from inside.
-- @pos 103.703 -26.180 83.000 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

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

    local DoorOffset = npc:getID() - 1;
   
    if (GetNPCByID(DoorOffset):getAnimation() == 9) then
        if (player:getZPos() < 85) then
            npc:openDoor(7); -- torch animation
            GetNPCByID(DoorOffset):openDoor(7); -- _0rh
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