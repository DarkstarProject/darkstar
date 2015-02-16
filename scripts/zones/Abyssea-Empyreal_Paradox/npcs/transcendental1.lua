-----------------------------------
-- Area: Abyssea Empyreal Paradox
-- NPC: Transcendental Radiance
-- @zone 255
-- Note: Used to spawn Shinryu
-----------------------------------
package.loaded["scripts/zones/Abyssea-Empyreal_Paradox/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Abyssea-Empyreal_Paradox/TextIDs");

	-- events:
	-- 7D00 : BC menu

	-- 1/1: The Wyrm God
	-- 2/3: The Wyrm God
	-- 3/5: The Wyrm God

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(TradeBCNM(player,player:getZoneID(),trade,npc))then
		return;
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- if(EventTriggerBCNM(player,npc))then
		-- return;
	-- end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("onUpdate CSID: %u",csid);
	-- printf("onUpdate RESULT: %u",option);

	if(EventUpdateBCNM(player,csid,option))then
		return;
	end

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("onFinish CSID: %u",csid);
	-- printf("onFinish RESULT: %u",option);

	if(EventFinishBCNM(player,csid,option))then
		return;
	end

end;