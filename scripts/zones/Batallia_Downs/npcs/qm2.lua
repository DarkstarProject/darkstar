-----------------------------------
--  Area: Batallia Downs
--  NPC: qm2 (???)
--  Pop for the quest "Chasing Quotas"
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	local Sturmtiger = player:getVar("SturmtigerKilled");
	
	if (player:getVar("ChasingQuotas_Progress") == 5 and Sturmtiger == 0) then
		SpawnMob(17207696,300):updateClaim(player);
	elseif (Sturmtiger == 1) then
		player:addKeyItem(RANCHURIOMES_LEGACY);
		player:messageSpecial(KEYITEM_OBTAINED,RANCHURIOMES_LEGACY);
		player:setVar("ChasingQuotas_Progress",6);
		player:setVar("SturmtigerKilled",0);
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
end;