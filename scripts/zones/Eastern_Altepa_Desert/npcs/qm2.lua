-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  ???
-- Involved In Quest: 20 in Pirate Years
-- @zone 114
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Eastern_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	twentyInPirateYearsCS = player:getVar("twentyInPirateYearsCS");
	TsuchigumoKilled = player:getVar("TsuchigumoKilled");
	
	if(twentyInPirateYearsCS == 3 and TsuchigumoKilled <= 1) then
		player:messageSpecial(SENSE_OF_FOREBODING);
		SpawnMob(17244524,300):updateEnmity(player);
		SpawnMob(17244525,300):updateEnmity(player);
	elseif(twentyInPirateYearsCS == 3 and TsuchigumoKilled >= 2) then
		player:addKeyItem(TRICK_BOX);
		player:messageSpecial(KEYITEM_OBTAINED,TRICK_BOX);
		player:setVar("twentyInPirateYearsCS",4);
		player:setVar("TsuchigumoKilled",0);
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
end;