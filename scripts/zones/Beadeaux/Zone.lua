-----------------------------------
--
-- Zone: Beadeaux
--
-----------------------------------
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
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
	if (prevZone == 109 and player:getQuestStatus(BASTOK,BLADE_OF_DARKNESS)== 1 and player:getVar("Blade_Of_Darkness_SwordKills")==100) then
		cs = 0x0079;
	elseif (player:getCurrentMission(1) == 10 and player:getVar("MissionStatus") == 2) then
		cs = 0x0078;
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

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
	if (csid==0x0079) then
		player:messageSpecial(7294);
		player:unlockJob(8);
		player:completeQuest(BASTOK,BLADE_OF_DARKNESS);
		player:setVar("BLADE_OF_DARKNESS_SWORDKILLS",0);
		player:setTitle(DARK_SIDER);
	elseif (csid == 0x0078) then
		player:setVar("MissionStatus",2);
		player:setPos(-297, 1, 96, 1);
	end
end;




