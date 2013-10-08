-----------------------------------
--  Area: Batallia Downs
--  NPC: qm2 (???)
--  Pop for the quest "Chasing Quotas"
--	Involved in Mission 9-1 (San dOria)
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	local Sturmtiger = player:getVar("SturmtigerKilled");
	
	if(player:getVar("ChasingQuotas_Progress") == 5 and Sturmtiger == 0) then
		SpawnMob(17207696,300):updateEnmity(player);
	elseif(Sturmtiger == 1) then
		player:addKeyItem(RANCHURIOMES_LEGACY);
		player:messageSpecial(KEYITEM_OBTAINED,RANCHURIOMES_LEGACY);
		player:setVar("ChasingQuotas_Progress",6);
		player:setVar("SturmtigerKilled",0);
	elseif(player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 3 and player:getVar("Mission9-1Kills") < 2) then
		SpawnMob(17207697,600):updateEnmity(player); -- 10 min despawn so others can pop
		SpawnMob(17207698,600):updateEnmity(player); -- 10 min despawn so others can pop
	elseif(player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("Mission9-1Kills") == 2) then
		player:startEvent(0x0388);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
end;

-----------------------------------
-- onTrade
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if(csid == 0x0388) then
		player:addKeyItem(FIGURE_OF_LEVIATHAN);
		player:messageSpecial(KEYITEM_OBTAINED,FIGURE_OF_LEVIATHAN);
		player:setVar("MissionStatus",4);
		player:setVar("Mission9-1Kills",0);
	end
end;