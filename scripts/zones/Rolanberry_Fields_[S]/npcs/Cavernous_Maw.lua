-----------------------------------
-- Cavernous Maw
-- Teleports Players to Rolanberry Fields
-- @pos -198 8 360 91
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Rolanberry_Fields_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(hasMawActivated(player,1) == false) then
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
	
	if(option == 1) then
		if(csid == 0x0065) then
			player:addNationTeleport(MAW,2);
		end
		
		toMaw(player,4);
	end
	
end;