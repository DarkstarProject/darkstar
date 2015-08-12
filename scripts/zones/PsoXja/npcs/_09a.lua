-----------------------------------
-- Area:  Pso'Xja
-- NPC:   _09a (Stone Gate)
-- Notes: Spawns Gargoyle when triggered
-- @pos -330.000 14.074 -261.600 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 

	local X=player:getXPos();
	
	if (npc:getAnimation() == 9) then	
		if (X <= 261) then
			if (GetMobAction(16814091) == 0) then
				local Rand = math.random(1,10);
				if (Rand <=9) then -- Spawn Gargoyle
					player:messageSpecial(TRAP_ACTIVATED); 
					SpawnMob(16814091,120):updateClaim(player); -- Gargoyle
				else
					player:messageSpecial(TRAP_FAILS);
					npc:openDoor(30);
				end	
			else
				player:messageSpecial(DOOR_LOCKED);
			end	
		elseif (X >= 262) then
			player:startEvent(0x001A);
		end
	end

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
	if (csid == 0x001A and option == 1) then
		player:setPos(260,-0.25,-20,254,111);
	end
end;