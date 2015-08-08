-----------------------------------
-- Area: Pso'Xja
-- NPC:  Treasure Chest
-- @zone 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/treasure");
require("scripts/zones/PsoXja/TextIDs");

local TreasureType = "Chest";
local TreasureLvL = 53;
local TreasureMinLvL = 43;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- trade:hasItemQty(1064,1); 		-- Treasure Key
	-- trade:hasItemQty(1115,1);		-- Skeleton Key
	-- trade:hasItemQty(1023,1);		-- Living Key
	-- trade:hasItemQty(1022,1);		-- Thief's Tools
	local questItemNeeded = 0;

	-- Player traded a key.
	if ((trade:hasItemQty(1064,1) or trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1) then 
		local zone = player:getZoneID();
		-- IMPORTANT ITEM: Map -----------
		if (player:hasKeyItem(MAP_OF_PSOXJA) == false) then
			questItemNeeded = 1;
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
				-- Succeded to open the coffer
				player:messageSpecial(CHEST_UNLOCKED);

				if (questItemNeeded == 1) then
					player:addKeyItem(MAP_OF_PSOXJA);
					player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_PSOXJA); -- Map of Pso'Xja
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

				UpdateTreasureSpawnPoint(npc:getID());
			end
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(CHEST_LOCKED,1064);
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