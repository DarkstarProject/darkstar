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

item_set = {16084,{14546,14961,15625,15711,MOD_DOUBLE_ATTACK,5}, 	-- 	Ares's set (5% DA)
			16088,{14550,14965,15629,15715,MOD_CRITHITRATE,5}, 		--  Skadi's set (5% critrate is guess) 
			16092,{14554,14969,15633,15719,MOD_HASTE,5},			--	Usukane's set (5% Haste)
			16107,{14569,14984,15648,15734,MOD_ACC,20}, 			--	Denali Jacket Set (Increases Accuracy +20)
			16106,{14568,14983,15647,15733,MOD_HPP,10}, 			--	Askar Korazin Set (Max HP Boost %10)	
			16069,{14530,14940,15609,15695,MOD_SUBTLE_BLOW,8}, 		-- 	Pahluwan Khazagand Set (8% is guess) 
			16100,{14562,14977,15641,15727,MOD_MATT,5}, 			-- 	Morrigan's Robe Set (+5 Magic. Atk Bonus) 			
			16096,{14558,14973,15637,15723,MOD_FASTCAST,5}, 		--	Marduk's Jubbah Set (5% fastcast) 						
			16148,{14590,15011,16317,15757,MOD_COUNTER,4}, 			--	Cobra Unit Harness Set ( +4 counter) 
			16149,{14591,15012,16318,15758,MOD_MACC,4}}; 			--	Cobra Unit Robe Set ( +4 magic accuracy) 


				

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
							-- print("---Gear set found!---\n"); -- these notes can be removed after all gear sets are complete
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
			-- print("---Gear set mod removed!---\n"); -- these notes can be removed after all gear sets are complete
			return;
		end
	end
end;






	--		TODO addStatusEffectEx will be needed for this set
	--		16064,{14527,14935,15606,15690,MOD_HASTE,5}, -- 			Yigit Gomlek Set (1mp per tick) Adds "Refresh" effect		


	--		looks like it needs its own function..
	--		16146,{14588,15009,16315,15755,???,5}, -- 					Iron Ram Haubert Set,  Set: Increases all elemental resistances +30 (each piece +5 after the first one, additional +10 for the whole ) 		

	
	-- 		this one require 2 mods?
	--		16062,{14525,14933,15604,15688,MOD_???,8} -- 				Amir Korazin Set (Reduces magic and breath damage 8%) 
	
	
	--		I think we are missing MOD_MDEFP?	
	--		16108,{14570,14985,15649,15735,MOD_MDEF,10}, -- 			Goliard Saio Set (Magic Def. Bonus %10)	 								
			
			
	--		the list says it all		
	--		16147,{14589,15010,16316,15756,MOD_FASTCAST,5}, -- 			Fourth Division Brune Set 
			-- Set Bonus: Increases Attack
			-- Set increases in multiples of 5 after the 2nd piece.
			-- 2 pieces: Attack+1
			-- 3 pieces: Attack+5
			-- 4 Pieces: Attack+10
			-- Full Set: Attack+15	
