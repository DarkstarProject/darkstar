-----------------------------------
--  Area: Windurst Walls
--   NPC: Yoran-Oran
--  Type: Standard NPC
-- @zone: 239
--  @pos: -109.987 -14 203.338
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local MandragoraMad = player:getQuestStatus(WINDURST,MANDRAGORA_MAD);
	if(MandragoraMad ~= QUEST_AVAILABLE) then
		if(trade:getItemCount() == 1) then
			-- Cornette
			if(trade:hasItemQty(17344,1)) then
				player:tradeComplete();
				player:addFame(WINDURST,WIN_FAME*10);
				player:addGil(GIL_RATE*200);
				player:startEvent(0x00fb,GIL_RATE*200);
				player:completeQuest(WINDURST,MANDRAGORA_MAD);
			-- Sulfur
			elseif(trade:hasItemQty(934,1)) then
				player:tradeComplete();
				player:addFame(WINDURST,WIN_FAME*25);
				player:addGil(GIL_RATE*250);
				player:startEvent(0x00fc,GIL_RATE*250);
				player:completeQuest(WINDURST,MANDRAGORA_MAD);
			-- ThreeLeafBud
			elseif(trade:hasItemQty(1154,1)) then
				player:tradeComplete();
				player:addFame(WINDURST,WIN_FAME*50);
				player:addGil(GIL_RATE*1200);
				player:startEvent(0x00fd,GIL_RATE*1200);
				player:completeQuest(WINDURST,MANDRAGORA_MAD);
			-- FourLeafBud
			elseiftrade:hasItemQty(4369,1) then
				player:tradeComplete();
				player:addFame(WINDURST,WIN_FAME*10);
				player:addGil(GIL_RATE*120);
				player:startEvent(0x00fe,GIL_RATE*120);
				player:completeQuest(WINDURST,MANDRAGORA_MAD);
			-- Letter
			elseif(trade:hasItemQty(1150,1)) then
				player:tradeComplete();
				player:addFame(WINDURST,WIN_FAME*100);
				player:addGil(GIL_RATE*5500);
				player:startEvent(0x00ff,GIL_RATE*5500);
				player:completeQuest(WINDURST,MANDRAGORA_MAD);
			else
				player:startEvent(0x00fa);
			end
		else
			player:startEvent(0x00fa);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local MandragoraMad = player:getQuestStatus(WINDURST,MANDRAGORA_MAD);
	if(MandragoraMad == QUEST_AVAILABLE) then
		player:startEvent(0x00f9);
	elseif(MandragoraMad == QUEST_ACCEPTED) then
		player:startEvent(0x0100);
	else
		player:startEvent(0x00f5);
	end
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
	if(csid == 0x00f9) then
		player:addQuest(WINDURST,MANDRAGORA_MAD);
	end
end;