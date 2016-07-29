-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47b (Handle)
-- Notes: Opens Trap Door (_47a) or Brass Door (_470)
-- @pos 22.310 -1.087 -14.320 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local X = player:getXPos();
    local Z = player:getZPos();    
    local BrassDoor = npc:getID() - 2;
    local TrapDoor = npc:getID() - 1;    
    local BrassA = GetNPCByID(BrassDoor):getAnimation();
    local TrapA = GetNPCByID(TrapDoor):getAnimation();    

    if (X < 21.6 and X > 18 and Z > -15.6 and Z < -12.4) then
        
        if (VanadielDayOfTheYear() % 2 == 0) then 
            if (TrapA == 9 and npc:getAnimation() == 9) then
                npc:openDoor(8);
                -- wait 1 second delay goes here
                GetNPCByID(TrapDoor):openDoor(6);
            end    
            if (player:getCurrentMission(WINDURST) == TO_EACH_HIS_OWN_RIGHT and player:getVar("MissionStatus") == 3) then
                player:startEvent(0x002B);
            end            
        else
            if (BrassA == 9 and npc:getAnimation() == 9) then
                npc:openDoor(8); 
                -- wait 1 second delay goes here
                GetNPCByID(BrassDoor):openDoor(6);
            end    
        end
    else
        player:messageSpecial(0);
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
    
    if (csid == 0x002B) then
        player:setVar("MissionStatus",4);
    end
    
end;