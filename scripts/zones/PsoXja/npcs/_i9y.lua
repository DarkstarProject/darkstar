-----------------------------------
-- Area: Pso'Xja
-- NPC:  _i9y (Crystal Receptor)
-- @pos -389.980 -3.198 -203.595 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/PsoXja/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 
    if (npc:getAnimation() == 9) then
        player:startEvent(0x003a);
    else
        player:messageSpecial(DEVICE_IN_OPERATION);
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

function onEventFinish(player,csid,option,npc)
    if (csid == 0x003a) then
        local CrystalOperator = npc:getID();
        npc:openDoor(118); -- this sets the trigger animation to glowing. The time is retail confirmed. 
        GetNPCByID(CrystalOperator+1):closeDoor(118); -- tiles will reset at the same time. 
    end    
end;