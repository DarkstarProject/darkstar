-----------------------------------
--	Author: ReaperX
-- 	???
-- 	for RDM AF quest
-----------------------------------
     OldBoots = 198;
 CrawlerBlood = 201;
WarlocksBoots = 14093;

require("scripts/globals/settings");
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:hasKeyItem(CrawlerBlood) == true) and (player:hasKeyItem(OldBoots) == true) then
  player:startEvent(4);
else
  player:messageSpecial(846);
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
if (csid == 4) and (option == 1) then
  player:delKeyItem(CrawlerBlood);
  player:delKeyItem(OldBoots);
	player:messageSpecial(849,OldBoots,CrawlerBlood);
	player:messageSpecial(ITEM_OBTAINED,WarlocksBoots);
  player:addItem(WarlocksBoots);
  player:completeQuest(0,85);    -- quest completed sound should play here
	player:addFame(0,SAN_FAME*AF2_FAME);
end;
end;