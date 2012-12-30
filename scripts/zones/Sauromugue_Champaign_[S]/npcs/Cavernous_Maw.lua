-----------------------------------
-- Cavernous Maw
-- Teleports Players to Sauromugue_Champaign
-- @pos 369 8 -227 98
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Sauromugue_Champaign_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(hasMawActivated(player,2) == false) then
		player:startEvent(0x0065);
	else
		player:startEvent(0x0066);
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
--print("CSID:",csid);
--print("RESULT:",option);
	
	if(option == 1) then
		if(csid == 0x0065) then
			player:addNationTeleport(MAW,4);
		end
		
		toMaw(player,6);
	end
	
end;