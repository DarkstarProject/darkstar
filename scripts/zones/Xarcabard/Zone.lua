-----------------------------------
--
-- Zone: Xarcabard (112)
--
-----------------------------------

package.loaded[ "scripts/zones/Xarcabard/TextIDs"] = nil;

require( "scripts/zones/Xarcabard/TextIDs");
require( "scripts/globals/icanheararainbow");
require( "scripts/globals/keyitems");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize( zone)		
end;		

-----------------------------------		
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)		
	
	local cs = -1;

	local UnbridledPassionCS = player:getVar("unbridledPassion");	

	
	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -136.287, -23.268, 137.302, 91);
	end
	
	if( player:hasKeyItem( VIAL_OF_SHROUDED_SAND) == false and player:getRank() >= 6 and player:getMainLvl() >= 65 and player:getVar( "Dynamis_Status") == 0) then
		player:setVar( "Dynamis_Status", 1);
		cs = 0x000D; 
	elseif( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0009;
	elseif(UnbridledPassionCS == 3) then	
		cs = 0x0004;
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
	
	if( csid == 0x0009) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow	
	end
	
end;		

-----------------------------------		
-- onEventFinish		
-----------------------------------		

function onEventFinish( player, csid, option)		
--printf("CSID: %u",csid);	
--printf("RESULT: %u",option);	
	
	if( csid == 0x0009) then	
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	elseif(csid == 0x0004) then
		player:setVar("unbridledPassion",4);
	end
	
end;		
