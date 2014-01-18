-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Naja Salaheem
--  Type: Standard NPC
--  @pos 22.700 -8.804 -45.591 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

	local TOAUM3_DAY = player:getVar("TOAUM3_STARTDAY");
	local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	local needToZone = player:needToZone();
	
	if(player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES)then
	 	if(player:getVar("TOAUM2") == 1 or player:getVar("TOAUM2") == 2) then
	 		player:startEvent(0x0BBA,0,0,0,0,0,0,0,0,0);
	 	end
	elseif(player:getCurrentMission(TOAU) == PRESIDENT_SALAHEEM and player:getVar("TOAUM3") == 1)then
		player:startEvent(0x0049,0,0,0,0,0,0,0,0,0);
	elseif(player:getCurrentMission(TOAU) == PRESIDENT_SALAHEEM and player:getVar("TOAUM3") == 2 and TOAUM3_DAY ~= realday and needToZone == true) then
		player:startEvent(0x0BCC,0,0,0,0,0,0,0,0,0);	
	else
		player:messageSpecial(0);--  need to find correct normal chat CS..
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
	if(csid == 0x0BBA)then
		player:setVar("TOAUM2",0);
		player:completeMission(TOAU,IMMORTAL_SENTRIES);
		player:addMission(TOAU,PRESIDENT_SALAHEEM);
		player:addImperialStanding(150);
		player:addTitle(PRIVATE_SECOND_CLASS);
		player:addKeyItem(PSC_WILDCAT_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED,PSC_WILDCAT_BADGE);
	elseif(csid == 0x0BCC)then
		player:completeMission(TOAU,PRESIDENT_SALAHEEM);
		player:addMission(TOAU,KNIGHT_OF_GOLD);
		player:setVar("TOAUM3",0);
		player:setVar("TOAUM3_DAY", 0);
	elseif(csid == 0x0049)then
		player:setVar("TOAUM3",2);
		player:setVar("TOAUM3_DAY", os.date("%j")); -- %M for next minute, %j for next day
	end
end;