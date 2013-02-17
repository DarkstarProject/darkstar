--------------------------
-- Area: Beadeaux
-- NPC: ???
-- Type: Quest NPC
-- @zone 147
-- @pos -79 1 -99
-- PLEASE READ!: You might have to change the pos_x, pos_y,
-- pos_z of NPC ID 17379837 which is located in page 9 of the
-- database in the npc_list table. Change the pos to -79, 1, -99 
-- or the ??? will not appear in the correct place.
--------------------------
require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/weather");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-- TODO: The ??? should only spawn during rainy weather, temporary fix in place to prevent players from getting the keyitem unless the proper weather is present.
if(player:getQuestStatus(BASTOK,BEADEAUX_SMOG) == QUEST_ACCEPTED and player:hasKeyItem(CORRUPTED_DIRT) == false and player:getWeather() == WEATHER_RAIN) then
	player:addKeyItem(CORRUPTED_DIRT);
	player:messageSpecial(KEYITEM_OBTAINED,CORRUPTED_DIRT);
end
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
end;