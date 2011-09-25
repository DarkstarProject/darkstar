-----------------------------------
-- 
-- Zone: Zeruhn_Mines
-- 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/settings");
require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

Blades = player:getQuestStatus(BASTOK,BLADE_OF_DARKNESS); 
if (prevZone == 143 and Blades > 0) then
   if (Blades == 2) then 
      if (player:getFreeSlotsCount(0) >= 1) then
         player:messageSpecial(6537, 16607);
         player:additem(16607,1);
      else
	player:messageSpecial(6534,16607);
      end
    else
       cs = 0x82;  
    end
end
return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,regionID)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);

   if (csid==0x82) then 
      if (player:getFreeSlotsCount(0) >= 1) then
	 player:messageSpecial(6537, 16607);
         player:addItem(16607);
      else
	player:messageSpecial(6534,16607);
      end
      
   end
end;
