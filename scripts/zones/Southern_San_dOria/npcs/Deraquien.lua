-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Deraquien
--  A timely Visit
-- 	@zone 230
--	@pos -98 -2 31
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
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	player:startEvent(0x012);
--	player:startEvent(0x028e) -- nothing to report 
--	player:startEvent(0x0021)-- theif of royl sceptre  
--	player:startEvent(0x002f)-- as again about the theif  
--	player:startEvent(0x0022) -- reminder of theif in la thein 
--	player:startEvent(0x0050)  -- thief caught but phillone was there
--	player:startEvent(0x0014)  -- go get reward for thief
--	player:startEvent(0x0057) -- vijrtall shows up and derq tells you go talk tho phillone 
--	player:startEvent(0x001e) --reminder go talk to phillone 
--	player:startEvent(0x0026) -- go help  retrieve royal sceptre 
--	player:startEvent(0x001b) -- the lady wanst involved in the theft :( 

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

----- used for future expansion
--	player:startEvent(0x032b) -- red badge

