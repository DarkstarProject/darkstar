-----------------------------------
--  Area: Abyssea Emperial Paradox
--  NPC:  Prishe
--  Note:
-----------------------------------
package.loaded["scripts/zones/Abyssea-Empyreal_Paradox/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Abyssea-Empyreal_Paradox/TextIDs");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:SpoofChatPlayer("Ok Time to fight Shinryu, all you need is a Scholar Stone and trade it to that Transcendental Radiance over there and it will take you to the beast.", MESSAGE_SAY, npc:getID() );
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("onUpdate CSID: %u",csid);
	-- printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("onFinish CSID: %u",csid);
	-- printf("onFinish RESULT: %u",option);
end;