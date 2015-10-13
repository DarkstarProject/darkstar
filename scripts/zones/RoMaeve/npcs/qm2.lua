-----------------------------------
-- Area: Ro'Maeve
-- NPC:  qm2 (???)
-- Involved in Mission: Bastok 7-1
-- @pos 102 -4 -114 122 and <many pos>
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/RoMaeve/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 1) then
		if (GetMobAction(17276929) == 0 and GetMobAction(17276930) == 0) then
			if (player:getVar("Mission7-1MobKilled") >= 1) then
				player:addKeyItem(REINFORCED_CERMET);
				player:messageSpecial(KEYITEM_OBTAINED,REINFORCED_CERMET);
				player:setVar("Mission7-1MobKilled",0);
				player:setVar("MissionStatus",2);
			else
				-- Position of npc can change
				local x = npc:getXPos();
				local y = npc:getYPos();
				local z = npc:getZPos();
				
				SpawnMob(17276929):setPos(x+1,y,z+1);
				GetMobByID(17276929):updateClaim(player);
				SpawnMob(17276930):setPos(x-1,y,z-1);
				GetMobByID(17276930):updateClaim(player);
			end
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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