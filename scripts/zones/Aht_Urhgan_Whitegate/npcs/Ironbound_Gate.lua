-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Ironbound Gate
-- 
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
	
	if(npc:getID() == 16982050) then
		player:startEvent(0x0083);
	else
		player:startEvent(0x0082);
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

	if(csid == 0x0083 and option == 1) then
		player:setPos(690,-18.5,220,128,0x33);		--> Wajaom Woodlands, at northeastern tower
	elseif(csid == 0x0082 and option == 1) then
		 player:setPos(570.5,-10.5,140,128,0x34);	--> Bhaflau Thickets, at southeastern tower
	end
	
end;