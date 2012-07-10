-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Beriphaule
--  Type: Allegiance Changer NPC
--  @zone: 231
--  @pos: -247.422 7.000 28.992
--
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
	new_nation = SANDORIA
	rank = getNationRank(new_nation)
	if(rank == 1) then
		cost = 40000
	elseif(rank == 2) then
		cost = 12000 
	elseif(rank == 3) then
		cost = 4000
	end
	has_gil = 0
	if(player:getGil() >= cost) then
		has_gil = 1
	end
	player:startEvent(0x025e,0,1,player:getRank(),new_nation,has_gil,cost);
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
	if(csid == 0x025e and option == 1) then
		player:setNation(new_nation)
		player:setGil(player:getGil() - cost);
	end
end;

