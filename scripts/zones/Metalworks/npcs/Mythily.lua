-----------------------------------
-- Area: Metalworks
-- NPC:  Mythily
-- Type: Immigration NPC
-- @pos 94 -20 -8 237
-----------------------------------

require("scripts/globals/conquest");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local new_nation = BASTOK;
	local old_nation = player:getNation();
	local rank = getNationRank(new_nation);
	
	if (old_nation == new_nation) then
		player:startEvent(0x016a,0,0,0,old_nation);
	elseif (player:getCurrentMission(old_nation) ~= 255 or player:getVar("MissionStatus") ~= 0) then
		player:startEvent(0x0169,0,0,0,new_nation);
	elseif (old_nation ~= new_nation) then
		local has_gil = 0;
		local cost = 0;
		
		if (rank == 1) then
			cost = 40000;
		elseif (rank == 2) then
			cost = 12000; 
		elseif (rank == 3) then
			cost = 4000;
		end
		
		if (player:getGil() >= cost) then
			has_gil = 1
		end
		
		player:startEvent(0x0168,0,1,player:getRank(),new_nation,has_gil,cost);
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
	
	if (csid == 0x0168 and option == 1) then
		local new_nation = BASTOK;
		local rank = getNationRank(new_nation);
		local cost = 0;
		
		if (rank == 1) then
			cost = 40000;
		elseif (rank == 2) then
			cost = 12000; 
		elseif (rank == 3) then
			cost = 4000;
		end
		
		player:setNation(new_nation)
		player:setGil(player:getGil() - cost);
		player:setRankPoints(0);
	end
	
end;