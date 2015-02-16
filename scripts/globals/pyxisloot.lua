-----------------------------------
-- Pyxis loot
-----------------------------------
require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/utils");

-------------------------------------------------
--          Gold Pyxis Loot Tier 1
-------------------------------------------------

function PyxisLootTier1(zone,npc)

---------------------------------------
-- Items
---------------------------------------

     keyitem = {132,{},
				 15,{0.5,1533,1534,1535,1536,1537},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item1Tier1s = {132,{},
				 15,{0.3,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item2Tier1s = {132,{},
				 15,{0.8,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
	 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	for u = 1, table.getn(keyitem), 2 do
		if(keyitem[u] == zone) then
			if(rand <= keyitem[u + 1][1])then
				reward = {"keyitem",math.random(keyitem[u + 1][2],keyitem[u + 1][3])};
			elseif(rand <= (keyitem[u + 1][1] + item1Tier1s[u + 1][1])) then
				local num_item1Tier1s = 0;
				local curr_item1Tier1 = 2;
				while(item1Tier1s[u + 1][curr_item1Tier1] ~= nil) do
					curr_item1Tier1 = curr_item1Tier1 + 1;
					num_item1Tier1s = num_item1Tier1s + 1;
				end
				rand_item1Tier1 = math.random(1,num_item1Tier1s) + 1;
				reward = {"item1Tier1",item1Tier1s[u + 1][rand_item1Tier1]};
			else
				local num_item2Tier1 = 0;
				local curr_item2Tier1 = 2;
				while(item2Tier1s[u + 1][curr_item2Tier1] ~= nil) do
					curr_item2Tier1 = curr_item2Tier1 + 1;
					num_item2Tier1 = num_item2Tier1 + 1;
				end
				rand_item2Tier1 = math.random(1,num_item2Tier1) + 1;
				reward = {"item2Tier1",item2Tier1s[u + 1][rand_item2Tier1]};
			end
			break;
		end
	end
	return reward;
end

-------------------------------------------------
--            Gold Pyxis Loot Tier 2
-------------------------------------------------

function PyxisLootTier2(zone,npc)

---------------------------------------
-- Items
---------------------------------------

     keyitem = {132,{},
				 15,{0.5,1533,1534,1535,1536,1537},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item1Tier2s = {132,{},
				 15,{0.3,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item2Tier2s = {132,{},
				 15,{0.8,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
	 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	for u = 1, table.getn(keyitem), 2 do
		if(keyitem[u] == zone) then
			if(rand <= keyitem[u + 1][1])then
				reward = {"keyitem",math.random(keyitem[u + 1][2],keyitem[u + 1][3])};
			elseif(rand <= (keyitem[u + 1][1] + item1Tier2s[u + 1][1])) then
				local num_item1Tier2s = 0;
				local curr_item1Tier2 = 2;
				while(item1Tier2s[u + 1][curr_item1Tier2] ~= nil) do
					curr_item1Tier2 = curr_item1Tier2 + 1;
					num_item1Tier2s = num_item1Tier2s + 1;
				end
				rand_item1Tier2 = math.random(1,num_item1Tier2s) + 1;
				reward = {"item1Tier2",item1Tier2s[u + 1][rand_item1Tier2]};
			else
				local num_item2Tier2 = 0;
				local curr_item2Tier2 = 2;
				while(item2Tier2s[u + 1][curr_item2Tier2] ~= nil) do
					curr_item2Tier2 = curr_item2Tier2 + 1;
					num_item2Tier2 = num_item2Tier2 + 1;
				end
				rand_item2Tier2 = math.random(1,num_item2Tier2) + 1;
				reward = {"item2Tier2",item2Tier2s[u + 1][rand_item2Tier2]};
			end
			break;
		end
	end
	return reward;
end

-------------------------------------------------
--            Gold Pyxis Loot Tier 3
-------------------------------------------------

function PyxisLootTier3(zone,npc)

---------------------------------------
-- Items
---------------------------------------

     keyitem = {132,{},
				 15,{0.5,1533,1534,1535,1536,1537},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item1Tier3s = {132,{},
				 15,{0.3,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item2Tier3s = {132,{},
				 15,{0.8,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
	 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	for u = 1, table.getn(keyitem), 2 do
		if(keyitem[u] == zone) then
			if(rand <= keyitem[u + 1][1])then
				reward = {"keyitem",math.random(keyitem[u + 1][2],keyitem[u + 1][3])};
			elseif(rand <= (keyitem[u + 1][1] + item1Tier3s[u + 1][1])) then
				local num_item1Tier3s = 0;
				local curr_item1Tier3 = 2;
				while(item1Tier3s[u + 1][curr_item1Tier3] ~= nil) do
					curr_item1Tier3 = curr_item1Tier3 + 1;
					num_item1Tier3s = num_item1Tier3s + 1;
				end
				rand_item1Tier3 = math.random(1,num_item1Tier3s) + 1;
				reward = {"item1Tier3",item1Tier3s[u + 1][rand_item1Tier3]};
			else
				local num_item2Tier3 = 0;
				local curr_item2Tier3 = 2;
				while(item2Tier3s[u + 1][curr_item2Tier3] ~= nil) do
					curr_item2Tier3 = curr_item2Tier3 + 1;
					num_item2Tier3 = num_item2Tier3 + 1;
				end
				rand_item2Tier3 = math.random(1,num_item2Tier3) + 1;
				reward = {"item2Tier3",item2Tier3s[u + 1][rand_item2Tier3]};
			end
			break;
		end
	end
	return reward;
end

-------------------------------------------------
--            Gold Pyxis Loot Tier 4
-------------------------------------------------

function PyxisLootTier4(zone,npc)

---------------------------------------
-- Items
---------------------------------------

     keyitem = {132,{},
				 15,{0.5,1533,1534,1535,1536,1537},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item1Tier4s = {132,{},
				 15,{0.3,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
				
 item2Tier4s = {132,{},
				 15,{0.8,5271,5278,5294,5299,5334,5353},
				 45,{},
				215,{},
				216,{},
				217,{},
				218,{},
				253,{},
				254,{}};
	 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	for u = 1, table.getn(keyitem), 2 do
		if(keyitem[u] == zone) then
			if(rand <= keyitem[u + 1][1])then
				reward = {"keyitem",math.random(keyitem[u + 1][2],keyitem[u + 1][3])};
			elseif(rand <= (keyitem[u + 1][1] + item1Tier4s[u + 1][1])) then
				local num_item1Tier4s = 0;
				local curr_item1Tier4 = 2;
				while(item1Tier4s[u + 1][curr_item1Tier4] ~= nil) do
					curr_item1Tier4 = curr_item1Tier4 + 1;
					num_item1Tier4s = num_item1Tier4s + 1;
				end
				rand_item1Tier4 = math.random(1,num_item1Tier4s) + 1;
				reward = {"item1Tier4",item1Tier4s[u + 1][rand_item1Tier4]};
			else
				local num_item2Tier4 = 0;
				local curr_item2Tier4 = 2;
				while(item2Tier4s[u + 1][curr_item2Tier4] ~= nil) do
					curr_item2Tier4 = curr_item2Tier4 + 1;
					num_item2Tier4 = num_item2Tier4 + 1;
				end
				rand_item2Tier4 = math.random(1,num_item2Tier4) + 1;
				reward = {"item2Tier4",item2Tier4s[u + 1][rand_item2Tier4]};
			end
			break;
		end
	end
	return reward;
end