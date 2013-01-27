-----------------------------------
-- Area: Spire_of_vahlz
-- NPC:  Radian Aureole
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
	player:startEvent(0x000F)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if(csid == 0x000F and option == 1)then
		player:setPos(-379 ,48 ,333 ,180 ,9); -- back to pso xja
     elseif(csid == 0x000F and option == 2)then
	 player:setPos(1 ,-1 ,255 ,188 ,23); 
	end
	
end;