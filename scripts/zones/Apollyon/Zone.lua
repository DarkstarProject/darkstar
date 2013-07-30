-----------------------------------
-- 
-- Zone: Apollyon
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
            SetServerVariable("[NW_Apollyon]UniqueID",0);		
		    SetServerVariable("[NE_Apollyon]UniqueID",0); 		
		    SetServerVariable("[NE_Apollyon]UniqueID",0) ; 	
		    SetServerVariable("[SE_Apollyon]UniqueID",0); 		
		    SetServerVariable("[CS_Apollyon]UniqueID",0); 		
		    SetServerVariable("[CS_Apollyon_II]UniqueID",0); 		
		    SetServerVariable("[Central_Apollyon]UniqueID",0); 		
		    SetServerVariable("[Central_Apollyon_II]UniqueID",0); 


zone:registerRegion(1,  637,-4,-642,642,4,-637);  -- APPOLLYON_SE_NE exit
zone:registerRegion(2, -642,-4,-642,-637,4,-637);  -- APPOLLYON_NW_SW exit

zone:registerRegion(3, 468,-4,-637,  478,4,-622); -- appolyon SE register
zone:registerRegion(4, 421,-4,-98,   455,4,-78); -- appolyon NE register



zone:registerRegion(20,   396,-4,-522,   403,4,-516); -- appolyon SE telporter floor1 to floor2
zone:registerRegion(21,   116,-4,-443,   123,4,-436); -- appolyon SE telporter floor2 to floor3
zone:registerRegion(22,   276,-4,-283,   283,4,-276); -- appolyon SE telporter floor3 to floor4
zone:registerRegion(23,   517,-4,-323,   523,4,-316); -- appolyon SE telporter floor4 to entrance
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;
    if(prevZone~=33)then
	  local playerLimbusID = player:getVar("LimbusID");
	    if(playerLimbusID== 1290 or playerLimbusID== 1291 or playerLimbusID== 1294 or playerLimbusID== 1295 or playerLimbusID== 1296 or playerLimbusID== 1297)then
		player:setPos(-668,0.1,-666);
	    else
		player:setPos(643,0.1,-600);
		end
 
	elseif((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(643,0.1,-600);		
	end	
	
return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
  local regionID = region:GetRegionID();
   switch (regionID): caseof {
        [1] = function (x) 
		     player:startEvent(0x0064); -- APPOLLYON_SE_NE exit
		end,
		[2] = function (x) 
		     player:startEvent(0x0065); -- APPOLLYON_NW_SW exit
			 print("APPOLLYON_NW_SW");
		end,
		[3] = function (x) 
		      if(player:hasStatusEffect(EFFECT_BATTLEFIELD) == false)then 
			      RegisterLimbusInstance(player,1293);
			  end	--create instance appolyon SE	  
		end,
		[4] = function (x) 
		      if(player:hasStatusEffect(EFFECT_BATTLEFIELD) == false)then 
			      RegisterLimbusInstance(player,1292);
			  end	--create instance appolyon NE	  
		end,
		
		
		
		-- ///////////////////////APPOLLYON SE TELEPORTER///////////////////////////////////////////
		[20] = function (x) 
              print("SE_telporter_f1_to_f2");
			 if(GetMobAction(16932992)==0 and player:getAnimation()==0)then player:startEvent(0x00DB);end
		end,
		[21] = function (x) 
              print("SE_telporter_f2_to_f3");
		      if(GetMobAction(16933006)==0 and player:getAnimation()==0)then player:startEvent(0x00DA);end
		end,	
		[22] = function (x) 
              print("SE_telporter_f3_to_f4");
		      if(GetMobAction(16933020)==0 and player:getAnimation()==0)then player:startEvent(0x00D8);end
		 end,		
		[23] = function (x) 
              print("SE_telporter_f3_to_entrance");
		      if(GetMobAction(16933032)==0 and player:getAnimation()==0)then player:startEvent(0x00D9);end
	     end,
         -- ///////////////////////////////////////////////////////////////////////////////////////////		 
		
	}
	
end;
-----------------------------------	
-- onRegionLeave	
-----------------------------------
	
function onRegionLeave(player,region)
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
   if(csid == 0x0064 and option == 1)then
     player:setPos(557,-1,441,128,0x21);  -- APPOLLYON_SE_NE exit
   elseif(csid == 0x0065 and option == 1)then
     player:setPos(-561,0,443,242,0x21); -- APPOLLYON_NW_SW exit
   end
end;



