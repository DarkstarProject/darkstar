-----------------------------------
--  Area: Northern San d'Oria
--   NPC: Vamorcote
--	Starts and Finishes Quest: The Setting Sun
-- @zone: 231
--  @pos -137.070 10.999 161.855
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- "The Setting Sun" conditional script
	if (player:getQuestStatus(SANDORIA,THE_SETTING_SUN) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(535,1) and trade:getItemCount() == 1) then
			player:startEvent (0x0292)
		end;
	end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Look at the "The Setting Sun" quest status and San d'Oria player's fame
	theSettingSun = player:getQuestStatus(SANDORIA,THE_SETTING_SUN);
	
	if (theSettingSun == QUEST_AVAILABLE  and 
		player:getFameLevel(SANDORIA) >= 5 and 
		player:getQuestStatus(SANDORIA, BLACKMAIL) ~= QUEST_COMPLETED) 
	then	
		player:startEvent(0x028e,0,535,535); --The quest is offered to the player.
	elseif (theSettingSun == QUEST_ACCEPTED) then
		player:startEvent(0x028f,0,0,535); --The NPC asks if the player got the key.'
	elseif (theSettingSun == QUEST_COMPLETED and player:needToZone()) then
		player:startEvent(0x0293); --The quest is already done by the player and the NPC does small talks.
	else
		player:startEvent(0x028b);
	end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	
	if (csid == 0x028e and option == 1) then --Player accepts the quest
		player:addQuest(SANDORIA,THE_SETTING_SUN);
	elseif (csid == 0x0292) then --The player trades the Engraved Key to the NPC. Here come the rewards!
		player:tradeComplete();
		player:addGil(GIL_RATE*10000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(SANDORIA,THE_SETTING_SUN);
	end;
end;

