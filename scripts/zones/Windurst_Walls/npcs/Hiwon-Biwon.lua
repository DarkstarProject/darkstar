-----------------------------------
--	Area: Windurst Walls
--	NPC:  Hiwon-Biwon
--  Involved In Quest: Making Headlines
--	Working 100%
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
	if (MakingHeadlines == 1) then
		prog = player:getVar("QuestMakingHeadlines_var");
		-- 	Variable to track if player has talked to 4 NPCs and a door
		-- 	1 = Kyume
		--	2 = Yujuju
		--	4 = Hiwom
		--	8 = Umumu
		--	16 = Mahogany Door
		if (testflag(tonumber(prog),4) == false) then
			if (player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1) == 1) then
				rand = math.random(1,2);
				if (rand == 1) then
					player:startEvent(0x011b); -- Give scoop while sick
				else
					player:startEvent(0x011c); -- Give scoop while sick
				end	
			else
				player:startEvent(0x0119); -- Give scoop
			end
		else
			player:startEvent(0x011a); -- "Getting back to the maater at hand-wand..."
		end
	else
		rand = math.random(1,5);
		if (rand == 1) then
			print (rand);
			player:startEvent(0x0131); -- Standard Conversation
		elseif (rand == 2) then
			print (rand);
			player:startEvent(0x0132); -- Standard Conversation
		elseif (rand == 3) then
			print (rand);
			player:startEvent(0x00a8); -- Standard Conversation
		elseif (rand == 4) then
			print (rand);
			player:startEvent(0x00aa); -- Standard Conversation
		elseif (rand == 5) then
			print (rand);
			player:startEvent(0x00a9); -- Standard Conversation
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
	if (csid == 0x0119 or csid == 0x011b or csid == 0x011c) then
		prog = player:getVar("QuestMakingHeadlines_var");
		player:addKeyItem(WINDURST_WALLS_SCOOP);
		player:messageSpecial(KEYITEM_OBTAINED,WINDURST_WALLS_SCOOP);
		player:setVar("QuestMakingHeadlines_var",prog+4);
	end
end;



