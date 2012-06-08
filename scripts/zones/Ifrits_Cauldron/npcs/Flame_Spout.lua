----------------------------------
-- Area: Ifrit's Cauldron
-- NPC: Altar of Ashes
-- @pos: I-9 (X:16, Y:0, Z:-58)
-- Involved in Quest: Greetings to the Guardian
-----------------------------------


require("scripts/zones/Ifrits_Cauldron/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	printf("%u",npc:getID())
	npcid = npc:getID();
	
	if(npcid == 17617198) then
		player:startEvent(0x000b);
	elseif(npcid == 17617199) then
		player:startEvent(0x000c);
	elseif(npcid == 17617200) then
		player:startEvent(0x000d);
	elseif(npcid == 17617201) then
		player:startEvent(0x000e);
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
printf("RESULT: %u",option);
	
	if(csid == 0x000b and option == 0) then
		if(player:getXPos() > 195) then
			player:setPos(190,0,19,124);
		else
			player:setPos(198,0,19,252);
		end
	elseif(csid == 0x000c and option == 0) then
		if(player:getXPos() < -205) then
			player:setPos(-201,0,-60,245);
		else
			player:setPos(-210,0,-60,127);
		end
	elseif(csid == 0x000d and option == 0) then
		if(player:getXPos() < -171) then
			player:setPos(-168,39,60,256);
		else
			player:setPos(-176,38,60,124);
		end
	elseif(csid == 0x000e and option == 0) then
		if(player:getZPos() < 187) then
			player:setPos(-340,39,184,63);
		else
			player:setPos(-341,39,192,179);
		end
	end
	
end;