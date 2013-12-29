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

	if(npcid == 17310039) then
		local portal = GetNPCByID(17310052);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310038):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310041) then
		local portal = GetNPCByID(17310053);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310040):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310043) then
		local portal = GetNPCByID(17310055);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310042):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310045) then
		local portal = GetNPCByID(17310056);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310044):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310047) then
		local portal = GetNPCByID(17310058);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310046):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310037) then
		local portal = GetNPCByID(17310059);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310036):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310035) then
		local portal = GetNPCByID(17310061);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310034):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310029) then
		local portal = GetNPCByID(17310062);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310028):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310031) then
		local portal = GetNPCByID(17310064);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310030):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310033) then
		local portal = GetNPCByID(17310065);
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