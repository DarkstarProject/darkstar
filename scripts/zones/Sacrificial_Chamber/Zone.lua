-----------------------------------
--
-- Zone: Sacrificial_Chamber (163)
--
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Sacrificial_Chamber/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(316.848,-2.182,340.03,125);
	end
	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
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

	if(csid == 0x0007) then
		player:startEvent(0x0008);
	elseif(csid == 0x0008) then
		if(player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH) then
			player:delKeyItem(SACRIFICIAL_CHAMBER_KEY);
			player:addKeyItem(DARK_FRAGMENT);
			player:messageSpecial(KEYITEM_OBTAINED,DARK_FRAGMENT);
			player:completeMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
			player:addMission(ZILART,HEADSTONE_PILGRIMAGE);
		end
	end
end;
