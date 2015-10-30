-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Ambrotien
-- @pos 93.419 -0.001 -57.347 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	CurrentMission = player:getCurrentMission(SANDORIA);
	OrcishScoutCompleted = player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS);
	BatHuntCompleted = player:hasCompletedMission(SANDORIA,BAT_HUNT);
	TheCSpringCompleted = player:hasCompletedMission(SANDORIA,THE_CRYSTAL_SPRING);
	MissionStatus = player:getVar("MissionStatus");
	Count = trade:getItemCount();
	
	if (CurrentMission ~= 255) then
		if (CurrentMission == SMASH_THE_ORCISH_SCOUTS and trade:hasItemQty(16656,1) and Count == 1 and OrcishScoutCompleted == false) then -- Trade Orcish Axe
			player:startEvent(0x07e4); -- Finish Mission "Smash the Orcish scouts" (First Time)
		elseif (CurrentMission == SMASH_THE_ORCISH_SCOUTS and trade:hasItemQty(16656,1) and Count == 1) then -- Trade Orcish Axe
			player:startEvent(0x07d2); -- Finish Mission "Smash the Orcish scouts" (Repeat)
		elseif (CurrentMission == BAT_HUNT and trade:hasItemQty(1112,1) and Count == 1 and BatHuntCompleted == false and MissionStatus == 2) then -- Trade Orcish Mail Scales
			player:startEvent(0x07e7); -- Finish Mission "Bat Hunt"
		elseif (CurrentMission == BAT_HUNT and trade:hasItemQty(891,1) and Count == 1 and BatHuntCompleted and MissionStatus == 2) then -- Trade Bat Fang
			player:startEvent(0x07d3); -- Finish Mission "Bat Hunt" (repeat)
		elseif (CurrentMission == THE_CRYSTAL_SPRING and trade:hasItemQty(4528,1) and Count == 1 and TheCSpringCompleted == false) then -- Trade Crystal Bass
			player:startEvent(0x07ee); -- Dialog During Mission "The Crystal Spring"
		elseif (CurrentMission == THE_CRYSTAL_SPRING and trade:hasItemQty(4528,1) and Count == 1 and TheCSpringCompleted) then -- Trade Crystal Bass
			player:startEvent(0x07dd); -- Finish Mission "The Crystal Spring" (repeat)
		else
			player:startEvent(0x07d8); -- Wrong Item
		end
	else
		player:startEvent(0x07da); -- Mission not activated
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local PresOfPapsqueCompleted = player:hasCompletedMission(SANDORIA,PRESTIGE_OF_THE_PAPSQUE);
	
	if (player:getNation() ~= SANDORIA) then
		player:startEvent(0x07db); -- for Non-San d'Orians
	else
		CurrentMission = player:getCurrentMission(SANDORIA);
		MissionStatus = player:getVar("MissionStatus");
		pRank = player:getRank();
		cs, p, offset = getMissionOffset(player,2,CurrentMission,MissionStatus);
		
		if (CurrentMission <= 15 and (cs ~= 0 or offset ~= 0 or (CurrentMission == 0 and offset == 0))) then
			if (cs == 0) then
				player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
			else
				player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
			end
      elseif (pRank == 1 and player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS) == false) then
			player:startEvent(0x07d0); -- Start First Mission "Smash the Orcish scouts"
		elseif (player:hasKeyItem(ANCIENT_SANDORIAN_BOOK)) then
	        player:startEvent(0x040c);
	    elseif (CurrentMission == RANPERRE_S_FINAL_REST and player:getVar("MissionStatus",4) and tonumber(os.date("%j")) == player:getVar("Wait1DayForRanperre_date")) then -- Not ready yet
	        player:startEvent(0x040e);
		elseif (CurrentMission == RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 4 and tonumber(os.date("%j")) ~= player:getVar("Wait1DayForRanperre_date")) then -- Ready now.
		    player:startEvent(0x0410);		
		elseif (CurrentMission == RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 6) then
		    player:startEvent(0x0410);
		elseif (CurrentMission == RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 9) then
		    player:startEvent(0x040a);
		elseif (CurrentMission ~= THE_SECRET_WEAPON and pRank == 7 and PresOfPapsqueCompleted == true and getMissionRankPoints(player,19) == 1 and player:getVar("SecretWeaponStatus") == 0) then
			player:startEvent(0x003e);
		elseif (CurrentMission == THE_SECRET_WEAPON and player:getVar("SecretWeaponStatus") == 3) then
			player:startEvent(0x0414);
		elseif (CurrentMission ~= 255) then
			player:startEvent(0x07d1); -- Have mission already activated
		else
			mission_mask, repeat_mask = getMissionMask(player);
			player:startEvent(0x07d9,mission_mask, 0, 0 ,0 ,0 ,repeat_mask); -- Mission List	
		end	    
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdateCSID: %u",csid);
--printf("onUpdateOPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinishCSID: %u",csid);
--printf("onFinishOPTION: %u",option);
	
	finishMissionTimeline(player,2,csid,option);
	if (csid == 0x040c) then
	   player:setVar("MissionStatus",4);
	   player:delKeyItem(ANCIENT_SANDORIAN_BOOK);
	   player:setVar("Wait1DayForRanperre_date", os.date("%j"));
	elseif (csid == 0x040e) then
	   player:setVar("MissionStatus",6);
	elseif (csid == 0x0410) then
	   player:setVar("MissionStatus",7);
	   player:setVar("Wait1DayForRanperre_date",0);
	elseif (csid == 0x040a) then
	   finishMissionTimeline(player,1,csid,option);
	elseif (csid == 0x003e) then
		player:setVar("SecretWeaponStatus",1);
	elseif (csid == 0x0414) then
		finishMissionTimeline(player,1,csid,option);
	end

end;
