-----------------------------------
-- Area: Port San d'Oria
-- NPC: Vounebariont
-- Standard Info NPC
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Thick_Shells"
	if (player:getQuestStatus(SANDORIA,THICK_SHELLS) >= 1) then
		count = trade:getItemCount();
		gil = trade:getGil();

		if (trade:hasItemQty(BEETLE_SHELL, 5) and count == 5 and gil == 0) then
			player:startEvent(0x0202);
    	end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	sanFame = player:getFameLevel(SANDORIA);

	if (sanFame >= 2) then
		player:startEvent(0x0204);
	else
		player:startEvent(0x0238);
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

	if (csid == 0x0204) then
		if (player:getQuestStatus(SANDORIA,THICK_SHELLS) == 0) then
			player:addQuest(SANDORIA,THICK_SHELLS);
		end
	elseif (csid == 0x0202) then
		if (player:getQuestStatus(SANDORIA,THICK_SHELLS) == 1) then
			player:completeQuest(SANDORIA,THICK_SHELLS);
			player:addFame(SANDORIA,SAN_FAME*30);
		else
			player:addFame(SANDORIA,SAN_FAME*5);
		end

		player:tradeComplete();
		player:setTitle(BUG_CATCHER);
		player:addGil(GIL_RATE*750);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*750)
	end
end;
