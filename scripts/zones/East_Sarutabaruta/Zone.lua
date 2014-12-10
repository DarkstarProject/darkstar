-----------------------------------
--
-- Zone: East_Sarutabaruta (116)
--
-----------------------------------
package.loaded[ "scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require( "scripts/globals/keyitems");
require( "scripts/globals/missions");
require( "scripts/globals/icanheararainbow");
require( "scripts/zones/East_Sarutabaruta/TextIDs");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17253061,17253062,17253063};
    
    SetFieldManual(manuals);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)

	local cs = -1;

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(305.377,-36.092,660.435,71);
	end

	-- Check if we are on Windurst Mission 1-2
	if( player:getCurrentMission( WINDURST) == THE_HEART_OF_THE_MATTER and player:getVar( "MissionStatus") == 5 and prevZone == 194) then
		cs = 0x0030;
	elseif( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0032;
	elseif( player:getCurrentMission(ASA) == BURGEONING_DREAD and prevZone == 241 and 
		player:hasStatusEffect(EFFECT_CHOCOBO) == false ) then
		cs = 0x0047;
	end
	
	return cs;
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
	elseif (csid == 0x0047) then
		player:setVar("ASA_Status",option);
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
	elseif (csid == 0x0047) then
		player:completeMission(ASA,BURGEONING_DREAD);
		player:addMission(ASA,THAT_WHICH_CURDLES_BLOOD);
	end
end;
