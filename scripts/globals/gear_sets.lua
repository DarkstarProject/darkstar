-----------------------------------
-- Author: Linkandentity
-- Gear sets
-- Allows the use of gear sets with modifiers
-----------------------------------

require("scripts/globals/status");

-----------------------------------

-- This table represents the items needed for a mod:

-- When testing, set a value to 50, if you see a massive increase to that mod then you
-- know you have the right item id's.

-- The order of id's must be as follows:

-- Head, Body, Hands, Legs, Feet, Mod, Value 

item_set = {16084,{14546,14961,15625,15711,MOD_DOUBLE_ATTACK,5}, -- Ares's set (5% DA)
			16088,{14550,14965,15629,15715,MOD_CRITHITRATE,5}, -- Skadi's set (5% critrate is guess) 
			16092,{14554,14969,15633,15719,MOD_HASTE,5}}; -- Usukane's set (5% Haste)			
				

				

function checkForGearSet(player)

	local head = player:getEquipID(SLOT_HEAD);
	local body = player:getEquipID(SLOT_BODY);
	local hands = player:getEquipID(SLOT_HANDS);
	local legs = player:getEquipID(SLOT_LEGS);	
	local feet = player:getEquipID(SLOT_FEET);	
	
	playerGetMod = player:getVar("GearSetMod");
	
	if (playerGetMod > 0) then
		removeGearSetMod(player,playerGetMod);
	end
	
	for setIndex = 1, table.getn(item_set), 2 do
		if (head == item_set[setIndex]) then
			if (body == item_set[setIndex+1][1]) then
				if (hands == item_set[setIndex+1][2]) then
					if (legs == item_set[setIndex+1][3]) then
						if (feet == item_set[setIndex+1][4]) then
							player:setVar("GearSetMod",head);
							player:addMod(item_set[setIndex+1][5],item_set[setIndex+1][6]);
							print("---Gear set found!---\n"); -- these notes can be removed after all gear sets are complete
							return;
						end					
					end				
				end
			end
		end
	end
end;





function removeGearSetMod(player, itemid)
	
	for setIndex = 1, table.getn(item_set), 2 do
		if (itemid == item_set[setIndex]) then
			player:setVar("GearSetMod",0);
			player:delMod(item_set[setIndex+1][5],item_set[setIndex+1][6]);
			print("---Gear set mod removed!---\n"); -- these notes can be removed after all gear sets are complete
			return;
		end
	end
end;