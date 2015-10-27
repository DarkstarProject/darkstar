-----------------------------------
-- Area: Qulun Dome
-- NPC:  The Mute
-- @zone 148
-- @pos <many>
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local duration = math.random(600,900);

	if (player:hasStatusEffect(EFFECT_SILENCE) == false) then
		player:addStatusEffect(EFFECT_SILENCE,0,0,duration);
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