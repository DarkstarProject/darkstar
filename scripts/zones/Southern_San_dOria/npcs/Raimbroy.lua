-----------------------------------
--  Area: Southern San d'Oria
--  NPC: Raimbroy
--  Starts Quest: The Sweetest Things
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
	-- "The Sweetest Things" quest status var
	theSweetestThings = player:getQuestStatus(SANDORIA, THE_SWEETEST_THINGS);
   
	if (theSweetestThings == QUEST_ACCEPTED or theSweetestThings == QUEST_COMPLETED) then
		count = trade:getItemCount();
		honey = trade:hasItemQty(4370, 5);
		if (count == 5 and honey == true) then
			if (theSweetestThings == QUEST_ACCEPTED) then
				player:addFame(SANDORIA, SAN_FAME*40);
				player:completeQuest(SANDORIA, THE_SWEETEST_THINGS);
			else
				player:addFame(SANDORIA, SAN_FAME*5);
			end;
			player:startEvent(0x0217,GIL_RATE*400);
		else 
			player:startEvent(0x020a);
		end;
	end;
   
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
   
	-- "The Sweetest Things" quest status var
	theSweetestThings = player:getQuestStatus(SANDORIA, THE_SWEETEST_THINGS);
   
	-- "The Sweetest Things" Quest Dialogs
	if (theSweetestThings == QUEST_COMPLETED) then
		player:startEvent(0x0219);
	elseif (theSweetestThings == QUEST_ACCEPTED) then
		player:startEvent(0x0218);
	elseif (player:getFameLevel(SANDORIA) >= 2) then
		if (theSweetestThings == QUEST_AVAILABLE) then
			theSweetestThingsVar = player:getVar("theSweetestThings");
			if (theSweetestThingsVar == 1) then
				player:startEvent(0x0215);
			elseif (theSweetestThingsVar == 2) then
				player:startEvent(0x0216);
			else
				player:startEvent(0x0214);
			end
		end
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

	-- "The Sweetest Things" ACCEPTED
	if (csid == 0x0215) then
		if (option == 0) then
			player:addQuest(SANDORIA, THE_SWEETEST_THINGS);
		else
			player:setVar("theSweetestThings", 2);
		end
	elseif (csid == 0x0214) then
		player:setVar("theSweetestThings", 1);
	elseif (csid == 0x0216 and option == 0) then
		player:setVar("theSweetestThings", 0);
		player:addQuest(SANDORIA, THE_SWEETEST_THINGS);
	-- "The Sweetest Things" REWARD
	elseif (csid == 0x0217) then
		player:tradeComplete();
		player:setTitle(APIARIST);
		player:addGil(GIL_RATE*400);
	end
end;




