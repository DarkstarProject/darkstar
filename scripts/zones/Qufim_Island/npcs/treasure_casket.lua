-----------------------------------
--  Area: Qufim Island
--  NPC:  Treasure Casket
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Qufim_Island/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/treasure");
require("scripts/globals/status");
-------------------------------------
  
DespawnTime = os.time(t) + 10; 

if (os.time(t) > DespawnTime) then
	for i=17293312+361, 17293312+366 do
		DespawnMob(i);
	end
    printf("Timer expired.  Despawning Casket.",DespawnTime);
end
-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    Brown = 1002
	Blue = 1003
	
	brown = {17293312+361,
	         17293312+362,
		     17293312+367};
							 
	blue = {17293312+364,
	        17293312+365,
		    17293312+366};
	if (brown) then
        player:startEvent(Brown);
	elseif (blue) then
        player:startEvent(Blue); 
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

    --if(csid == 1002 and option == 1) then
	   --GetNPCByID():setStatus(STATUS_DISAPPEAR);   
	--end


--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;