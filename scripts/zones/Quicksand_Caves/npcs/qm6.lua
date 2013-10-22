-----------------------------------
--	Author: ReaperX (Convert to DSP by Hypnotoad)
-- 	??? for Bastok Mission 8.1 "The Chains That Bind Us"
-- 	spawns the NMs
--      * Triarius IV-XIV (Black Mage)
--      * Princeps IV-XLV (Paladin)
--			* Centurio IV-VII (Warrior) 
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

	local missionStatus = player:getVar("MissionStatus");
	local timesincelastclear = os.time()-GetServerVariable("Bastok8-1LastClear"); -- how long ago they were last killed.

	local currentMission = player:getCurrentMission(player:getNation())
	if (currentMission == THE_CHAINS_THAT_BIND_US) and (missionStatus == 1) then
		if (timesincelastclear < QM_RESET_TIME) then
			player:startEvent(0x0B);
		elseif (GetMobAction(CENTURIO_BASTOK) == 0) and (GetMobAction(TRIARIUS_BASTOK) == 0) and (GetMobAction(PRINCEPS_BASTOK) == 0) then
			SpawnMob(CENTURIO_BASTOK, 0):updateEnmity(player); -- Centurio IV-VII
			SpawnMob(TRIARIUS_BASTOK, 0):updateEnmity(player); -- Triarius IV-XIV
			SpawnMob(PRINCEPS_BASTOK, 0):updateEnmity(player); -- Princeps IV-XLV
			player:messageSpecial(SENSE_OF_FOREBODING); -- sense of foreboding
			npc:setStatus(2); -- Disappear
			SetServerVariable("BastokFight8_1", 3);
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY); -- there is nothing out of the ordinary here.
	end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	-- print("CSID:",csid);
	-- print("RESULT:",option);		
	if (csid == 0x0B) then
		player:setVar("MissionStatus", 2);
	end
end;