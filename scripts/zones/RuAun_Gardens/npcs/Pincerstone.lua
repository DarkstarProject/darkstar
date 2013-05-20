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

	if(npcid == 17310038) then
		local portal = GetNPCByID(17310051);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310037):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310040) then
		local portal = GetNPCByID(17310052);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310039):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310042) then
		local portal = GetNPCByID(17310054);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310041):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310044) then
		local portal = GetNPCByID(17310055);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310043):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310046) then
		local portal = GetNPCByID(17310057);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310045):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310036) then
		local portal = GetNPCByID(17310058);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310035):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310034) then
		local portal = GetNPCByID(17310060);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310033):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310028) then
		local portal = GetNPCByID(17310061);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310027):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310030) then
		local portal = GetNPCByID(17310063);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310029):openDoor(120);
			portal:openDoor(120);
		end
	elseif(npcid == 17310032) then
		local portal = GetNPCByID(17310064);
		if(portal:getAnimation() == 8) then
			player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
		else
			GetNPCByID(17310031):openDoor(120);
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