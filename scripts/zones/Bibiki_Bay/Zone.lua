-----------------------------------
--
-- Zone: Bibiki_Bay (4)
--
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
  zone:registerRegion(1,481,-7,602,503,5,701);
  zone:registerRegion(2,-410,-7,-385,-383,5,-354);
  zone:registerRegion(3,487,-6,708,491,-1,717);
  zone:registerRegion(4,-394,-7,-396,-391,-1,-385);
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)	
local bibiki = player:getVar("bibiki");	
	cs = -1;
  if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0))then
	if((prevZone == 3) and (bibiki == 3))then
	cs = 0x000B;
	elseif((prevZone ==3) and (bibiki == 4))then
	cs = 0x000A;
	else
	player:setPos(669.917,-23.138,911.655,111);
    end
  end
 return cs;
end;		


-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	

	switch (region:GetRegionID()): caseof
	{
			[1] = function (x)  
		
			player:setVar("bibiki",1);
		end,
		
			[2] = function (x)  
		
			player:setVar("bibiki",2);
		end,
			[3] = function (x)  
		
			player:setVar("bibiki",0);
		end,
		
			[4] = function (x)  
		
			player:setVar("bibiki",0);
		end,

}
end;	

-----------------------------------	
-- onRegionLeave	
-----------------------------------	

function onRegionLeave(player,region)
	switch (region:GetRegionID()): caseof
	{
			[1] = function (x)  
			player:setVar("bibiki",3);
		end,
		
			[2] = function (x)  
		
			player:setVar("bibiki",4);
		end,
}
end;	

-----------------------------------		
-- onTransportEvent		
-----------------------------------		
function onTransportEvent(player,transport)
 local bibiki=player:getVar("bibiki");
  if(bibiki == 1) then
      if(player:hasKeyItem(MANACLIPPER_TICKET))then
       player:delKeyItem(MANACLIPPER_TICKET);
       player:startEvent(0x000E);
	  elseif(player:hasKeyItem(MANACLIPPER_MULTITICKET))then
         local remainingticket=player:getVar("Manaclipper_Ticket");
      player:setVar("Manaclipper_Ticket",(remainingticket - 1));
			      if( (remainingticket - 1) > 0)then
			      player:messageSpecial(LEFT_BILLET,0,MANACLIPPER_MULTITICKET,(remainingticket - 1));
				  else
				  player:messageSpecial(END_BILLET,0,MANACLIPPER_MULTITICKET);
				  player:delKeyItem(MANACLIPPER_MULTITICKET);
				  end
      player:startEvent(0x000E);
	  else
	     player:messageSpecial(NO_BILLET,MANACLIPPER_TICKET);
	  player:setVar("bibiki",0);
	  player:setPos(489,-3,713,200);
	  end
  elseif(bibiki == 2) then
    player:startEvent(0x0010);
  end
end;

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
  if(csid == 0x000E) then
  player:setPos(0,0,0,0,3)
  elseif(csid == 0x000b) then
  player:startEvent(0x000d)
  elseif(csid == 0x0010) then
  player:setPos(0,0,0,0,3)
  elseif (csid == 0x000A) then
  player:startEvent(0x000c)
  end
end;	
