-----------------------------------
-- Cavernous Maw
-- Teleports Players to Batallia Downs
-- @pos -48 0 435 84
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Batallia_Downs_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(hasMawActivated(player,0) == false) then
		player:startEvent(0x0064);
	else
		player:startEvent(0x0065);
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

	if(option == 1) then
		if(csid == 0x0064) then
			player:addNationTeleport(MAW,1);
		end
		
		toMaw(player,2);
	end
	
end;