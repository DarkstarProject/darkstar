-----------------------------------
-- large keyhole
-- Area: Sacrarium
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sacrarium/TextIDs");	


-----------------------------------
-- onTrigger Action	
-----------------------------------

function onTrigger(player,npc)
   player:messageSpecial(LARGE_KEYHOLE);
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--1658   sealion key
local Timemax=GetServerVariable("SACRARIUM_Coral_Key_trade")+10;
local CurentTime=os.time();
  if (trade:hasItemQty(1658,1) and trade:getItemCount() == 1) then
      if (CurentTime < Timemax)then
	    GetNPCByID(16892136):openDoor(15);
		SetServerVariable("SACRARIUM_Coral_Key_trade",0);
	  end
  end
end;

-----------------------------------
-- onEventFinish Action	
-----------------------------------

function onEventFinish(player,csid,option)
end;
