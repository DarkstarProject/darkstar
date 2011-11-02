-----------------------------------
--
-- Zone: Northern_San_dOria
--
-----------------------------------

require("scripts/globals/server");
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1, -7,-3,110, 7,-1,155);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

	-- FIRST LOGIN (START CS)
	if (prevZone == 0) then
		if (OPENING_CUTSCENE_ENABLE == 1) then
			cs = 0x217;
		end
		CharCreate(player);
		player:setPos(0,0,-11,191);
		player:setHomePoint();
	end

	-- MOG HOUSE EXIT
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(130,-0.2,-3,160);
		if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
			cs = 0x7534;
		end
		player:setVar("PlayerMainJob",0);
	end

return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,regionID)
switch (regionID): caseof
{
	---------------------------------
	[1] = function (x)  -- Chateau d'Oraguille access
	---------------------------------
		pNation = player:getNation();
		currentMission = player:getCurrentMission(pNation)
		if ((pNation == 0 and player:getRank() >= 2) or (pNation > 0 and player:hasCompletedMission(pNation,5) == 1 or (currentMission >= 5 and currentMission <= 9))) then
			player:startEvent(0x0239);
		else
			player:startEvent(0x0238);
		end
	end,
	---------------------------------
}
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
	if(csid == 0x217) then
		player:messageSpecial(ITEM_OBTAINED,0x218);
	elseif (csid == 0x7534 and option == 0) then
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	elseif (csid == 0x0239) then
		player:setPos(0,0,-13,192,0xe9);
	end
end;



