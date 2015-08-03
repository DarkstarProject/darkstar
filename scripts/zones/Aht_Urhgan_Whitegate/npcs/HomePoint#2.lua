-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  HomePoint#2
-- @pos  -130 0.001 -16 50
-----------------------------------

package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/homepoint");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	homepointMenu( player, 0x21fd, 106);
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

	if (csid == 0x21fd) then

		if (option == 1) then	
			player:setHomePoint();
			player:messageSpecial(HOMEPOINT_SET);
		else
			hpTeleport( player, option);
		end
	end
end;