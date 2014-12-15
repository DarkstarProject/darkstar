-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Aw_aern PH
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("/scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	--[[
	local VanadielHour = VanadielHour();
	local posi = GetServerVariable("[POSI]Ix_aern_drk")
		--print(posi);
	i = GetServerVariable("[PH]Ix_aern_drk")
		--print(i);
		--Check if Aw_aern are in the room with the ???
		mob = mob:getID();
		if (posi == 1) then 
			if (mob ~= Ix_aern_drk_PH_pos1[mob]) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		elseif (posi == 2) then 
			if (mob ~= Ix_aern_drk_PH_pos2[mob]) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		elseif (posi == 3) then 
			if (mob ~= Ix_aern_drk_PH_pos3[mob]) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		elseif (posi == 4) then 
			if (mob ~= Ix_aern_drk_PH_pos4[mob]) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		
		end
		]]--
end;