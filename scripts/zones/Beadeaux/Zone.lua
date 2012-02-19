-----------------------------------
--
-- Zone: Beadeaux
--
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;
	if (prevZone == 109) then
		if (player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS) == QUEST_ACCEPTED and player:getVar("Blade_of_Darkness_SwordKills") >= 100) then
			cs = 0x0079;
		elseif (player:getCurrentMission(1) == 10 and player:getVar("MissionStatus") == 2) then
			cs = 0x0078;
		end
	end
return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

	if (csid == 0x0079) then
		player:unlockJob(8);
		player:setTitle(DARK_SIDER);
		player:setVar("ZeruhnMines_Zeid_CS", 0);
		player:setVar("Blade_of_Darkness_SwordKills", 0);
		player:completeQuest(BASTOK, BLADE_OF_DARKNESS);
		player:messageSpecial(YOU_CAN_NOW_BECOME_A_DARK_KNIGHT);
	elseif (csid == 0x0078) then
		player:setVar("MissionStatus",2);
		player:setPos(-297, 1, 96, 1);
	end
end;




