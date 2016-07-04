-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47f (Handle)
-- Notes: Opens door _471
-- @pos -182 -15 -19 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
-- To be implemented (This is temporary)    
    
    local DoorID = npc:getID() - 2;        
    local DoorA = GetNPCByID(DoorID):getAnimation();
    
    if (DoorA == 9 and npc:getAnimation() == 9) then
        npc:openDoor(8);
        -- Should be a 1 second delay here before the door opens
        GetNPCByID(DoorID):openDoor(6); 
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;