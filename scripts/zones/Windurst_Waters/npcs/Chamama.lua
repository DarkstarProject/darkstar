-----------------------------------
-- Area: Windurst Waters
-- NPC: Chamama
-- Involved In Quest: Inspector's Gadget
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

FakeMoustache       = player:hasKeyItem(95);
InvisibleManSticker = player:hasKeyItem(271);

	if (FakeMoustache == false) then
		InspectorsGadget = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);

		if (InspectorsGadget == QUEST_ACCEPTED) then
			count = trade:getItemCount();
			SarutaCotton = trade:hasItemQty(834,4);

			if (SarutaCotton == true and count == 4) then
				player:startEvent(0x0228);
			end
		end
	elseif (InvisibleManSticker == false) then
		ThePromise = player:getQuestStatus(WINDURST,THE_PROMISE);
		
		if (ThePromise == QUEST_ACCEPTED) then
			count = trade:getItemCount();
			ShoalWeed = trade:hasItemQty(1148,1);

			if (ShoalWeed == true and count == 1) then
				player:startEvent(0x031f,0,0,271);
			end
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

InspectorsGadget = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);
ThePromise       = player:getQuestStatus(WINDURST,THE_PROMISE);

	if (ThePromise == QUEST_ACCEPTED) then
		InvisibleManSticker = player:hasKeyItem(271);
		
		if (InvisibleManSticker == true) then
			player:startEvent(0x0320);	
		else
			ThePromiseVar = player:getVar("ThePromise");
			
			if (ThePromiseVar == 1) then
				player:startEvent(0x031e,0,1148,271);
			else
				player:startEvent(0x031d,0,1148,271);
			end
		end
	elseif (InspectorsGadget == QUEST_ACCEPTED) then
		FakeMoustache = player:hasKeyItem(95);
		
		if (FakeMoustache == true) then
			player:startEvent(0x0229);
		else
			player:startEvent(0x0227,0,95);
		end
	else
		player:startEvent(0x028b);
	end
   
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0228) then
		player:tradeComplete();
		player:addKeyItem(95);
	elseif (csid == 0x031d) then
		player:setVar("ThePromise",1);
	elseif (csid == 0x031f) then
		player:tradeComplete();
		player:addKeyItem(271);
	end

end;




