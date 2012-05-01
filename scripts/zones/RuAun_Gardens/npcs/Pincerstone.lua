-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Pincerstone
-- NPCs which activates the blue teleports in sky
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	npcid = npc:getID();
	printf("id: %u", npcid);
	if(npcid == 17310038) then
		if(os.time() <= GetServerVariable("Main-to-Seiryu-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Main-to-Seiryu-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310040) then
		if(os.time() <= GetServerVariable("Seiryu-to-Main-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Seiryu-to-Main-BlueTeleport",os.time() + 120);
		end	
	elseif(npcid == 17310042) then
		if(os.time() <= GetServerVariable("Seiryu-to-Genbu-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Seiryu-to-Genbu-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310044) then
		if(os.time() <= GetServerVariable("Genbu-to-Seiryu-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Genbu-to-Seiryu-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310046) then
		if(os.time() <= GetServerVariable("Genbu-to-Byakko-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Genbu-to-Byakko-BlueTeleport",os.time() + 120);
		end	
	elseif(npcid == 17310036) then
		if(os.time() <= GetServerVariable("Byakko-to-Genbu-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Byakko-to-Genbu-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310034) then
		if(os.time() <= GetServerVariable("Byakko-to-Suzaku-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Byakko-to-Suzaku-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310028) then
		if(os.time() <= GetServerVariable("Suzaku-to-Byakko-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Suzaku-to-Byakko-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310030) then
		if(os.time() <= GetServerVariable("Suzaku-to-Main-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Suzaku-to-Main-BlueTeleport",os.time() + 120);
		end
	elseif(npcid == 17310032) then
		if(os.time() <= GetServerVariable("Main-to-Suzaku-BlueTeleport")) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			SetServerVariable("Main-to-Suzaku-BlueTeleport",os.time() + 120);
		end
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