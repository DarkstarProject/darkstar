-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Paouala
--  Quest: Sleepless Nights
--  @zone 231
--  @pos 157 -6 18
-------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
Leche = player:getQuestStatus(0,80);
	if (Leche == 1) then
		count = trade:getItemCount();
		Milk = trade:hasItemQty(4527,1);
		gil = trade:getGil();
		if (Milk == true and count == 1 and gil == 0) then
			player:startEvent(0x0054);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
Leche = player:getQuestStatus(0,80);
if (Leche == 0) then
	player:startEvent(0x0055);
	elseif (Leche == 1) then
	player:startEvent(0x0053);
	elseif (Leche == 2) then
	player:startEvent(0x0051);
	else
	player:startEvent(0x0052);
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
if (csid == 0x0055 and option == 1) then
player:addQuest(0,80);
elseif (csid == 0x0054) then
player:completeQuest(0,80);
player:addFame(SANDORIA,SAN_FAME*30);
player:tradeComplete();
player:setTitle(44);
player:addGil(GIL_RATE*5000);
player:messageSpecial(6404,GIL_RATE*5000)
end
end;




