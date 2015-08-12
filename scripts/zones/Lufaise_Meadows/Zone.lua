-----------------------------------
--
-- Zone: Lufaise_Meadows (24)
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

	local Colorful_Leshy = 16875762;
	GetMobByID(Colorful_Leshy):setLocalVar("1",os.time() + math.random((43200), (86400)));
	
	zone:registerRegion(1,179,-26,327,219,-18,347);
    
    -- Padfoot
    SetRespawnTime(16875578, 900, 10800);

    SetRegionalConquestOverseers(zone:getRegionID())
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
	
	if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then	
		player:setPos(-475.825,-20.461,281.149,11);
	end
	
	if (player:getCurrentMission(COP) == AN_INVITATION_WEST) then
		if (player:getVar("PromathiaStatus") == 0) then
		    cs = 0x006E;
		end
	elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus") == 0) then
        cs = 0x006F;	
	end
	
	return cs;	
end;

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)
local regionID =region:GetRegionID();
  if (regionID==1 and player:getCurrentMission(COP) == DAWN 	and player:getVar("PromathiaStatus") == 6) then
      player:startEvent(0x0074);
  end
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
	if (csid == 0x006E) then
		player:messageSpecial(KI_STOLEN,0,MYSTERIOUS_AMULET);
		player:delKeyItem(MYSTERIOUS_AMULET);
		player:setVar("PromathiaStatus",1);
    elseif (csid == 0x006F) then
		player:addItem(14657);
		player:setVar("PromathiaStatus",1);
	 elseif (csid == 0x0074) then
	 player:setVar("PromathiaStatus",7);
	 player:addTitle(BANISHER_OF_EMPTINESS);
	end
end;