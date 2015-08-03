-----------------------------------
-- Area: Beaucedine Glacier
-- NPC:  Iron Grate
-- Type: Door
-- @pos 241.000 5.000 -20.000 111     : J-8
-- @pos 60.000 5.000 -359.000 111     : H-10
-- @pos 100.000 -15.000 159.000 111   : I-7
-- @pos -199.000 -35.000 -220.000 111 : G-9
-- @pos -20.000 -55.000 -41.000 111   : H-8
-- @pos -340.000 -95.000 159.000 111  : F-7
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Beaucedine_Glacier/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local X = player:getXPos();
	local Z = player:getZPos();
	
    if (X < 247 and X > 241) then 		-- J-8
		player:startEvent(0x00C8); 
    elseif (Z < -353 and Z > -359) then  -- H-10
		player:startEvent(0x00C9); 		
	elseif ((X > 95 and X < 104) and (Z > 153 and Z < 159)) then	-- I-7
		player:startEvent(0x00CA); 			
    elseif (X < -193 and X > -199) then 	-- G-9
		player:startEvent(0x00CB); 		
    elseif (Z > -47 and Z < -41) then 	-- H-8
		player:startEvent(0x00CC); 		
    elseif ((X > -344 and X < -337) and (Z > 153 and Z < 159)) then	-- F-7
		player:startEvent(0x00CD); 			
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	local LVLcap = 0;
	
	if (option == 1) then
		if (csid == 0x00C8) then 	   -- 50 Cap Area
			LVLcap = 50;
			player:setPos(396,-8,-20,125,9); 
		elseif (csid == 0x00C9) then -- 60 Cap Area
			LVLcap = 60;
			player:setPos(220,-8,-282,66,9); 
		elseif (csid == 0x00CA) then -- No Cap Area
			player:setPos(180,-8,241,190,9); 
		elseif (csid == 0x00CB) then -- No Cap Area
			player:setPos(-242,8,-259,126,9); 
		elseif (csid == 0x00CC) then -- Cap 40 Area
			LVLcap = 40;
			player:setPos(-180,-8,-78,194,9); 
		elseif (csid == 0x00CD) then -- No Cap Area
			player:setPos(-300,-8,203,191,9);
		end

		if (ENABLE_COP_ZONE_CAP == 1 ) then
			player:setVar("PSOXJA_RESTRICTION_LVL",LVLcap);
		end
	end 
end;