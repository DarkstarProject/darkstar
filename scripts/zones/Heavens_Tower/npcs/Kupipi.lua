-----------------------------------
-- Area: Heaven's Tower
-- NPC:  Kupipi
-- Involved in Mission 2-3
-- @zone 242
-- @pos 2 0 30
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- 0x00ee parle de l'offrande de guiddeus donne litem
-- 0x00f0 suite de l'offrande
-- 0x00f1 fin de l'offrande
-- 0x00f2 parle du monstre est donne la key
-- 0x00f3 suite du monstre
-- 0x00f4 fin du monstre bastok
-- 0x00f5 apres fin du monstre bastok
-- 0x00f6 fin du monstre sandy
-- 0x00f7 apres fin du monstre sandy

	pNation = player:getNation();
	
	if(pNation == SANDORIA) then
		-- San d'Oria Mission 2-3 Part I - Windurst > Bastok
		if(player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST) then
			MissionStatus = player:getVar("MissionStatus");
			if(MissionStatus == 4) then
				player:startEvent(0x00ee);
			elseif(MissionStatus == 5) then
				player:startEvent(0x00f0);
			elseif(MissionStatus == 6) then
				player:startEvent(0x00f1);
			end
		-- San d'Oria Mission 2-3 Part II - Bastok > Windurst
		elseif(player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST2) then
			MissionStatus = player:getVar("MissionStatus");
			if(MissionStatus == 7) then
				player:startEvent(0x00f2,1,1,1,1,0);
			elseif(MissionStatus == 8) then
				player:startEvent(0x00f3);
			elseif(MissionStatus == 9) then
				player:startEvent(0x00f6);
			elseif(MissionStatus == 10) then
				player:startEvent(0x00f7);
			end
		else
			player:startEvent(0x00fb);
		end
	elseif(pNation == BASTOK) then
		if(currentMission == 9) then
			if(missionStatus == 7) then
				player:startEvent(0x00f2,1,1,1,1,pNation);
			elseif(missionStatus == 8) then
				player:startEvent(0x00f3);
			end
		elseif(currentMission == 7) then
			if(missionStatus == 10) then
				player:startEvent(0x00ee,1,1,1,1,pNation);
			elseif(missionStatus == 11) then
				player:startEvent(0x00f1);
			elseif(missionStatus == 14) then
				player:startEvent(0x00f4);
			elseif(missionStatus == 14.5) then
				player:startEvent(0x00f5);
			else
				player:startEvent(0x00fb);
			end
		else
			player:startEvent(0x00fb);
		end
	else
		player:startEvent(0x00fb);
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
	
	pNation = player:getNation();
	
	if(csid == 0x00ee) then
		if(player:getNation() == BASTOK) then
			player:setVar("MissionStatus",11);
			player:addKeyItem(SWORD_OFFERING);
			player:messageSpecial(KEYITEM_OBTAINED,SWORD_OFFERING);
		else
			player:setVar("MissionStatus",5);
			player:addKeyItem(SHIELD_OFFERING);
			player:messageSpecial(KEYITEM_OBTAINED,SHIELD_OFFERING);
		end
	elseif(csid == 0x00f4) then
		player:setVar("MissionStatus",14.5);
	elseif(csid == 0x00f2) then
		player:addKeyItem(DARK_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,DARK_KEY);
		player:setVar("MissionStatus",8);
	elseif(csid == 0x00f6) then
		if(player:getNation() == SANDORIA) then
			player:setVar("MissionStatus",10);
		else
			player:setVar("MissionStatus",13);
		end
	end
	
end;