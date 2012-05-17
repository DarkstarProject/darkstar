-----------------------------------
-- Area: FeiYin
-- NPC:  Underground Pool
-- Involved In Quest: Scattered into Shadow
-- @pos 7 0 32 204 (H-8)
-- @pos 7 0 247 204 (H-5)
-- @pos -168 0 247 204 (F-5)
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(JEUNO,SCATTERED_INTO_SHADOW) == QUEST_ACCEPTED) then
		npcID = npc:getID();
		aquaKI1 = player:hasKeyItem(AQUAFLORA1);
		aquaKI2 = player:hasKeyItem(AQUAFLORA2);
		aquaKI3 = player:hasKeyItem(AQUAFLORA3);
		
		if(npcID == 17613226 and aquaKI1) then
			player:startEvent(0x0015);
		elseif(npcID == 17613224 and aquaKI2) then
			player:startEvent(0x0014);
		elseif(npcID == 17613225 and aquaKI3) then
			if(player:getVar("DabotzKilled") == 1) then
				player:startEvent(0x0012);
			else
				SpawnMob(17613129,300):updateEnmity(player);
			end
		else
			player:messageSpecial(THERE_IS_NOTHING_ORDINARY);
		end
	else
		player:messageSpecial(THERE_IS_NOTHING_ORDINARY);
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

	if(csid == 0x0015) then
		player:delKeyItem(AQUAFLORA1);
	elseif(csid == 0x0014) then
		player:delKeyItem(AQUAFLORA2);
	elseif(csid == 0x0012) then
		player:delKeyItem(AQUAFLORA3);
		player:setVar("DabotzKilled",0);
	end

end;