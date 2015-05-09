-----------------------------------
-- Area: Tahrongi_Canyon
-- NPC:  Shattered Telepoint
-- @pos 179 35 255 117
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Tahrongi_Canyon/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
		player:startEvent(0x0391,0,0,1); -- first time in promy -> have you made your preparations cs
	elseif (player:getCurrentMission(COP) == BELOW_THE_ARKS and (player:hasKeyItem(LIGHT_OF_HOLLA) or player:hasKeyItem(LIGHT_OF_DEM))) then
		player:startEvent(0x0390);  -- cs you get nearing second promyvion
	elseif (player:getCurrentMission(COP) > BELOW_THE_ARKS or player:hasCompletedMission(COP,THE_LAST_VERSE) or (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") > 1)) then
		player:startEvent(0x0391); -- normal cs (third promyvion and each entrance after having that promyvion visited or mission completed)
	else
		player:messageSpecial(TELEPOINT_HAS_BEEN_SHATTERED);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	if (csid == 0x0390) then
		player:setVar("PromathiaStatus",2);
		player:setPos(280.066, -80.635, -67.096, 191, 14); -- To Hall of Transference {R}
	elseif (csid == 0x0391 and option == 0) then
		player:setPos(280.066, -80.635, -67.096, 191, 14); -- To Hall of Transference {R}
	end

end;