-----------------------------------
--
-- Zone: La_Theine_Plateau (102)
--
-----------------------------------

package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/La_Theine_Plateau/TextIDs");
require( "scripts/globals/icanheararainbow");

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

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -272.118, 21.715, 98.859, 243);
	end
	
	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x007b;
	elseif( prevZone == 193 and player:getVar( "darkPuppetCS") == 5 and player:getFreeSlotsCount() >= 1) then		
		cs = 0x007a;	
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

	if( csid == 0x007b) then	
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x007b) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	elseif( csid == 0x007a) then	
		player:addItem( 14096);
		player:messageSpecial( ITEM_OBTAINED, 14096); -- Chaos Sollerets
		player:setVar( "darkPuppetCS", 0);
		player:addFame( BASTOK, AF2_FAME);
		player:completeQuest( BASTOK,DARK_PUPPET);
	end	
end;		
