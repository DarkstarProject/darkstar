-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Valderotaux
--  General Info NPC
-- @pos 97 0.1 113 230
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

	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	local lakesideMin = player:getQuestStatus(JEUNO,LAKESIDE_MINUET);
	local lakeProg = player:getVar("Lakeside_Minuet_Progress");
	if (lakeProg == 1) then
		player:startEvent(0x0378); -- Dance for the drunks!
		player:setVar("Lakeside_Minuet_Progress",2);
	elseif (lakeProg >= 2) then
		player:startEvent(0x0379); -- Immediate regret of failure!
	else
		player:startEvent(0x03A);
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
end;




