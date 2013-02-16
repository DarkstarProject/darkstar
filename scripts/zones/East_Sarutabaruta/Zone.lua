-----------------------------------
--
-- Zone: East_Sarutabaruta (116)
--
-----------------------------------

package.loaded[ "scripts/zones/East_Sarutabaruta/TextIDs"] = nil;

require( "scripts/globals/keyitems");
require( "scripts/globals/missions");
require( "scripts/globals/icanheararainbow");
require( "scripts/zones/East_Sarutabaruta/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize( zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)

	cs = -1;

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(305.377,-36.092,660.435,71);
	end

	-- Check if we are on Windurst Mission 1-2
	if( player:getCurrentMission( WINDURST) == THE_HEART_OF_THE_MATTER and player:getVar( "MissionStatus") == 5 and prevZone == 194) then
		cs = 0x0030;
	elseif( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0032;
	end
	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0032) then
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if( csid == 0x0030) then	
		player:setVar( "MissionStatus",6);

		-- Remove the glowing orb key items
		player:delKeyItem( FIRST_GLOWING_MANA_ORB);
		player:delKeyItem( SECOND_GLOWING_MANA_ORB);
		player:delKeyItem( THIRD_GLOWING_MANA_ORB);
		player:delKeyItem( FOURTH_GLOWING_MANA_ORB);
		player:delKeyItem( FIFTH_GLOWING_MANA_ORB);
		player:delKeyItem( SIXTH_GLOWING_MANA_ORB);

	elseif( csid == 0x0032) then
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end
end;
