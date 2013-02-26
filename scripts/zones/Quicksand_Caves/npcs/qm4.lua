-----------------------------------
--	Author: ReaperX (Convert to DSP by Hypnotoad)
-- 	H-8 ??? for Bastok Mission 8.1 "The Chains That Bind Us"
-- 	2nd CS 
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	local missionStatus = player:getVar("MissionStatus");
	if (player:getCurrentMission(player:getNation()) == THE_CHAINS_THAT_BIND_US) and (missionStatus == 2) then
		player:startEvent(0x0A)  
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY); -- There is nothing out of the ordinary here.
	end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
	if (csid == 0x0A) then
		player:setVar("MissionStatus", 3);
	end
end;