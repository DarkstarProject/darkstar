-----------------------------------
--  Area: Valkurm Dunes
--  NPC: Song Runes
--  Finishes Quest: Path of the Bard
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("PathOfTheBard_Event") == 1) then
		player:startEvent(0x0002);
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

	if (csid == 0x0002) then
		player:completeQuest(JEUNO,PATH_OF_THE_BARD);
		player:addGil(GIL_RATE*3000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
		player:setTitle(WANDERING_MINSTREL);
		player:addFame(BASTOK,BAS_FAME*10);
		player:addFame(SAN_D_ORIA,SAN_FAME*10);
		player:addFame(WINDURST,WIN_FAME*10);
		player:unlockJob(10); -- Bard
		player:messageSpecial(UNLOCK_BARD);  --You can now become a bard!
		player:setVar("PathOfTheBard_Event",0);
	end
end;

