-----------------------------------
--	Area: Sauromougue Champaign
--	NPC: Tiger Bones
--  Involed in Quest: The Fanged One.
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(WINDURST,THE_FANGED_ONE) == 1) then
		deadTiger = player:getVar("TheFangedOne_Died");

		if (deadTiger == 1 and player:hasKeyItem(OLD_TIGERS_FANG) == false) then
			player:addKeyItem(OLD_TIGERS_FANG);
			player:messageSpecial(KEYITEM_OBTAINED, OLD_TIGERS_FANG);
		elseif (deadTiger == 0) then
			if (GetMobAction(OLD_SABERTOOTH) == 0) then
				SpawnMob(OLD_SABERTOOTH);
				player:messageSpecial(OLD_SABERTOOTH_DIALOG_I);
			end
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

end;
