-----------------------------------
-- Area:  Sacrarium
-- NPC:   qm2 (???)
-- Notes: Used to spawn Old Prof. Mariselle
-- @pos 102.669 -3.111 127.279 28
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Sacrarium/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local OldProfessor = 16891970;

	if (GetServerVariable("Old_Prof_Spawn_Location") == 2) then
		if (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 3 and player:hasKeyItem(RELIQUIARIUM_KEY)==false and GetMobAction(OldProfessor) == 0) then 
			player:messageSpecial(EVIL_PRESENCE);
			SpawnMob(OldProfessor,300):updateClaim(player);
			GetMobByID(OldProfessor):setPos(npc:getXPos()+1, npc:getYPos(), npc:getZPos()+1); -- Set Prof. spawn x and z pos. +1 from NPC
		else
			player:messageSpecial(DRAWER_SHUT);
		end			
	elseif (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 4 and player:hasKeyItem(RELIQUIARIUM_KEY)==false) then
		player:addKeyItem(RELIQUIARIUM_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,RELIQUIARIUM_KEY);	
	else
		player:messageSpecial(DRAWER_OPEN);
		player:messageSpecial(DRAWER_EMPTY);		
	end	
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
