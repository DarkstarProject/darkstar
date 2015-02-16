----------------------------------------------------------------
-- Darcia
-- Lower Jeuno
-- Seekers Of Adoulin Start npc.
-- @pos -36 -1 -14 245
----------------------------------------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:hasKeyItem(2156)) and (player:hasKeyItem(2158)) then
		player:showText(npc,10210);	--It will let you teleport to Adoulin...
	else
	if(player:hasKeyItem(2156))  then	--Adoulin Charter Permit
		player:showText( npc,10209);	--There is one more thing. Take this with you.
		player:addKeyItem(2158);		--Temporary Geomagnet
		player:messageSpecial(KEYITEM_OBTAINED,2158);
		player:showText(npc,10210);	--It will let you teleport to Adoulin...
	else
		player:showText(npc,10208); --Let me see ...dot the I's here, cross the T's there...
		player:addKeyItem(2156);   	--Adoulin Charter Permit
		player:messageSpecial(KEYITEM_OBTAINED,2156); --Adoulin Charter Permit
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
