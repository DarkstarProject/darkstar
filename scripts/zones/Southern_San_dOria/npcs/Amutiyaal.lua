-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Amutiyaal
--  Warp NPC (Aht Urhgan)
--	@zone 230 
--	@pos 116 0 84
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	 player:startEvent(0x032d) -- people are starting to join
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
end;

-------- more events for aht urghan
	-- player:startEvent(0x032c) -- get pinned with red sentinel badge  
	-- player:startEvent(0x032e) -- red badge explain 
	-- player:startEvent(0x032f) -- red badge taken and given something else 
	-- player:startEvent(0x0330) -- your a fine officer
	-- player:startEvent(0x0370) -- senitnel testimony and free tele to aht urghan
	-- player:startEvent(0x0371) -- teleport needs more just gives a black screen
