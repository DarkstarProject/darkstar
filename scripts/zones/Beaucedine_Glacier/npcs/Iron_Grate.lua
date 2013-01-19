-----------------------------------
-- Area: beaucedine glacier
-- NPC:  Door: "Iron_Grate"

-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Beaucedine_Glacier/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    DoorID=npc:getID();
  --printf("DoorID: %u",DoorID);
 
    if (DoorID == 17232257)then --beaucedine F-7 tower
       player:startEvent(0x00CD);
    elseif(DoorID == 17232256)then --beaucedine H-8 tower 
       player:startEvent(0x00CC);      
    elseif(DoorID == 17232255)then --beaucedine G-9 tower
       player:startEvent(0x00CB);
    elseif(DoorID == 17232254)then --beaucedine I-7 tower
       player:startEvent(0x00CA);
    elseif(DoorID == 17232253)then --beaucedine H-10 tower
       player:startEvent(0x00C9);
    elseif(DoorID == 17232252)then --beaucedine J-8 tower 
       player:startEvent(0x00C8); 
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
local LVLcap = 0;
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
 if (option == 1)then
   if(csid == 0x00C8)then     --beaucedine J-8 tower                lvl cap 50
      LVLcap = 50;
   player:setPos(396,-8,-20,125,9); --tp to Pso'Xja
   elseif(csid == 0x00C9)then --beaucedine H-10 tower               lvl cap 60
     LVLcap = 60;
   player:setPos(220,-8,-282,66,9); --tp to Pso'Xja
   elseif(csid == 0x00CA)then --beaucedine I-7 tower       F-9
   player:setPos(180,-8,241,190,9); --tp to Pso'Xja
   elseif(csid == 0x00CB)then --beaucedine G-9 tower
   player:setPos(-242,8,-259,126,9); --tp to Pso'Xja
   elseif(csid == 0x00CC)then --beaucedine H-8 tower                 lvl cap 40
     LVLcap = 40;
   player:setPos(-180,-8,-78,194,9); --tp to Pso'Xja      G-10
   elseif(csid == 0x00CD)then --beaucedine F-7 tower
   player:setPos(-300,-8,203,191,9); --tp to Pso'Xja     
   end
   if(ENABLE_COP_ZONE_CAP == 1 )then
     player:setVar("PSOXJA_RESTRICTION_LVL",LVLcap);
   end
  end 
end;