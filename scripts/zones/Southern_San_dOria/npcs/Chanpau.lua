-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Chanpau
-- Optional Involvement in Quest: A Squire's Test II
-- @zone 230
-- @pos -152 -2 55
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
	
	if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == QUEST_ACCEPTED) then
		player:startEvent(0x275);
	elseif (player:getQuestStatus(SANDORIA, THE_BRUGAIRE_CONSORTIUM) == QUEST_COMPLETED) then
		Fired = player:getVar("Fired") 
		if Fired == 1 then
			player:startEvent(0x0237) -- i got fired in a day
			else
			player:startEvent(0x01f9) -- theres work ill go check it out
		end	
	else
		player:startEvent(0x0236);
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
	if (csid == 0x01f9) then
		player:setVar("Fired", 1)
	end
end;

-------for future use
--	player:startEvent(0x7fb3) -- starlight celebration 

