-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Treasure Chest
-- Involved In Quest: Signed In Blood and The Goblin Tailor
-- @zone 193
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/treasure");
require("scripts/zones/Ordelles_Caves/TextIDs");

local TreasureType = "Chest";
local TreasureLvL = 43;
local TreasureMinLvL = 33;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	--trade:hasItemQty(1030,1); 		-- Treasure Key
	--trade:hasItemQty(1115,1);			-- Skeleton Key
	--trade:hasItemQty(1023,1);			-- Living Key
	--trade:hasItemQty(1022,1);			-- Thief's Tools
	local questItemNeeded = 0;
	
	-- Player traded a key.
	if ((trade:hasItemQty(1030,1) or trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1) then 
		local zone = player:getZoneID();

		-- IMPORTANT ITEM: Signed In Blood Quest -----------
		if (player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD) == QUEST_ACCEPTED and player:getVar("SIGNED_IN_BLOOD_Prog") >= 1 and player:hasKeyItem(TORN_OUT_PAGES) == false) then
			questItemNeeded = 1;
		-- IMPORTANT ITEM: The Goblin Tailor Quest -----------
		elseif (player:getQuestStatus(JEUNO,THE_GOBLIN_TAILOR) >= QUEST_ACCEPTED and VanadielRSELocation() == 0 and VanadielRSERace() == player:getRace() and player:hasKeyItem(MAGICAL_PATTERN) == false) then
			questItemNeeded = 2;
		end
		--------------------------------------

		local pack = openChance(player,npc,trade,TreasureType,TreasureLvL,TreasureMinLvL,questItemNeeded);
		local success = 0;
		if (pack[2] ~= nil) then
			player:messageSpecial(pack[2]);
			success = pack[1];
		else
			success = pack[1];
		end
		
		if (success ~= -2) then
			player:tradeComplete();

			if (math.random() <= success) then
				local respawn = false;

				-- Succeded to open the coffer
				player:messageSpecial(CHEST_UNLOCKED);

				if (questItemNeeded == 1) then
					player:addKeyItem(TORN_OUT_PAGES);
					player:messageSpecial(KEYITEM_OBTAINED,TORN_OUT_PAGES);
				elseif (questItemNeeded == 2) then
					respawn = true;
					player:addKeyItem(MAGICAL_PATTERN);
					player:messageSpecial(KEYITEM_OBTAINED,MAGICAL_PATTERN);
				else
					player:setVar("["..zone.."]".."Treasure_"..TreasureType,os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME)); 

					local loot = chestLoot(zone,npc);
					-- print("loot array: "); -- debug
					-- print("[1]", loot[1]); -- debug
					-- print("[2]", loot[2]); -- debug
					if (loot[1]=="gil") then
						player:addGil(loot[2]*GIL_RATE);
						player:messageSpecial(GIL_OBTAINED,loot[2]*GIL_RATE);
					else
						-- Item
						player:addItem(loot[2]);
						player:messageSpecial(ITEM_OBTAINED,loot[2]);
					end
				end

				UpdateTreasureSpawnPoint(npc:getID(),respawn);
			end
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(CHEST_LOCKED,1030);
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