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
	local npcid = npc:getID();

	if(npcid == 17310038) then  -- Genbu to Byakko
		local portal = GetNPCByID(17310059);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310038):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310040) then -- Byakko to Genbu
		local portal = GetNPCByID(17310060);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310040):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310042) then -- Byakko to Suzaku
		local portal = GetNPCByID(17310062);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310042):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310044) then -- Suzaku to Byakko
		local portal = GetNPCByID(17310063);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310044):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310046) then -- Suzaku to Main
		local portal = GetNPCByID(17310065);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310046):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310036) then -- Genbu to Seriyu
		local portal = GetNPCByID(17310057);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310036):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310034) then -- Seriyu To Genbu 
		local portal = GetNPCByID(17310056);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310034):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310048) then -- Main to Suzaku
		local portal = GetNPCByID(17310066);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310048):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310030) then -- Main to Seriyu
		local portal = GetNPCByID(17310053);  
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310030):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310032) then -- Seriyu to Main
		local portal = GetNPCByID(17310054);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310032):openDoor(120);
			portal:openDoor(120);
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