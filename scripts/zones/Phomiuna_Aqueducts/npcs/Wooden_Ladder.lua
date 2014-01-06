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

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local npcID = npc:getID();
	local Ladder_Offset = 16888090;
	local Xpos = player:getXPos();
	
	if(npcID == Ladder_Offset and Xpos >= 102) then
		player:startEvent(0x0015);
	elseif(npcID == Ladder_Offset+1 and Xpos >= 102) then
		player:startEvent(0x0016);
	elseif(npcID == Ladder_Offset+2 and Xpos <= -62) then
		player:startEvent(0x0017);
	elseif(npcID == Ladder_Offset+3 and Xpos > -218) then
		player:startEvent(0x0018);
	elseif(npcID == Ladder_Offset+4 and Xpos <= -62) then
		player:startEvent(0x0019);
	elseif(npcID == Ladder_Offset+5 and Xpos >= 22) then
		player:startEvent(0x001a);
	elseif(npcID == Ladder_Offset+6 and Xpos >= 102) then
		player:startEvent(0x001b);
	elseif(npcID == Ladder_Offset+7 or npcID == Ladder_Offset+11) then
	    if(player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 1)then
			player:setVar("PromathiaStatus",2);
			player:startEvent(0x0023);
		else
			player:startEvent(0x001c);
		end
	elseif(npcID == Ladder_Offset+8) then
		player:startEvent(0x001d);
	elseif(npcID == Ladder_Offset+9) then
		player:startEvent(0x001e);
	elseif(npcID == Ladder_Offset+10) then
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