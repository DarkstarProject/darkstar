-----------------------------------
-- Area: Phomiuna Aqueducts
-- NPC:  Wooden Ladder
-- @pos 101.9 -1.5 -101.9
-- @pos 101.948 -1.5 -18.016
-- @pos -61.888 -1.5 -18.079
-- @pos -218.109 -1.499 18.081
-- @pos -61.903 -1.5 138.099
-- @pos 21.901 -1.5 138.096
-- @pos 101.902 -1.5 181.902
-- @pos  -159.32 -2.5 60
-- @pos -159.38 -22.559 60
-- @pos 199.317 -2.5 60
-- @pos 199.38 -22.559 60
-- @pos -200.679 -8.57 60
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	LadderID = npc:getID();
	Xpos = player:getXPos();
	
	if(LadderID == 16888090 and Xpos >= 102) then
		player:startEvent(0x0015);
	elseif(LadderID == 16888091 and Xpos >= 102) then
		player:startEvent(0x0016);
	elseif(LadderID == 16888092 and Xpos <= -62) then
		player:startEvent(0x0017);
	elseif(LadderID == 16888093 and Xpos > -218) then
		player:startEvent(0x0018);
	elseif(LadderID == 16888094 and Xpos <= -62) then
		player:startEvent(0x0019);
	elseif(LadderID == 16888095 and Xpos >= 22) then
		player:startEvent(0x001a);
	elseif(LadderID == 16888096 and Xpos >= 102) then
		player:startEvent(0x001b);
	elseif(LadderID == 16888097 or LadderID == 16888101) then
		player:startEvent(0x001c);
	elseif(LadderID == 16888098) then
		player:startEvent(0x001d);
	elseif(LadderID == 16888099) then
		player:startEvent(0x001e);
	elseif(LadderID == 16888100) then
		player:startEvent(0x001f);
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
end;