-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Authere
--  General Info NPC
-- 	@zone 230 
--	@pos 33 1 -31
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

	if (player:getVar("BrothersCS") == 1) then
		player:startEvent(0x0255)  -- brothers cs
	else
		player:startEvent(0x025d)  -- when i grow up im gonna fight like trion
	end;
end 

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

	if (csid == 0x0255) then
		player:setVar("BrothersCS", 0)
	end
end;

------- for later use

-- player:startEvent(0x0256)  -- did nothing no cs or speech
-- player:startEvent(0x0329)  -- red badge talk

