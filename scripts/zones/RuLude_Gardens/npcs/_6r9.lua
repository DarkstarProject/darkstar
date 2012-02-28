-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Anoop
-- Involved in Mission: Magicite
-- @zone 243
-- @pos 0 -5 66
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	CurrentMission = player:getCurrentMission(player:getNation());
	
	if(player:hasKeyItem(ARCHDUCAL_AUDIENCE_PERMIT) and CurrentMission == 255 and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x0080);
	elseif(player:hasKeyItem(MAGICITE_OPTISTONE) and player:hasKeyItem(MAGICITE_AURASTONE) and player:hasKeyItem(MAGICITE_ORASTONE)) then
		if(player:hasKeyItem(AIRSHIP_PASS)) then 
			player:startEvent(0x003c,1);
		else
			player:startEvent(0x003c);
		end
	elseif(player:hasKeyItem(ARCHDUCAL_AUDIENCE_PERMIT)) then
		player:messageSpecial(SOVEREIGN_WITHOUT_AN_APPOINTMENT);
	else
		player:startEvent(0x008a); -- you don't have a permit
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
	
	if(csid == 0x0080) then
		player:setVar("MissionStatus",2);
		player:addMission(player:getNation(),13);
		player:addKeyItem(LETTERS_TO_ALDO);
		player:messageSpecial(KEYITEM_OBTAINED,LETTERS_TO_ALDO); 
	elseif(csid == 0x003c) then
		player:delKeyItem(MAGICITE_OPTISTONE);
		player:delKeyItem(MAGICITE_AURASTONE);
		player:delKeyItem(MAGICITE_ORASTONE);
		if(player:hasKeyItem(AIRSHIP_PASS)) then
			player:addGil(GIL_RATE*20000);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*20000); 
			player:setTitle(CONQUEROR_OF_FATE);
		else
			player:addKeyItem(AIRSHIP_PASS);
			player:messageSpecial(KEYITEM_OBTAINED,AIRSHIP_PASS);
			player:addGil(GIL_RATE*10000);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); 
			player:setTitle(HAVE_WINGS_WILL_FLY);
		end
		player:setVar("MissionStatus",4); -- all that's left is to go back to the embassy
	end
	
end;