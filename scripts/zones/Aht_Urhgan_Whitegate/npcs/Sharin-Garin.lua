-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Sharin-Garin
-- Type: Adventurer's Assistant
-- @pos 122.658 -1.315 33.001 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local runicpass = 0;
    if (player:hasKeyItem(RUNIC_PORTAL_USE_PERMIT)) then
        runicpass = 1;
    end
    
	local cost = 200 -- 200 IS to get a permit
	
	if (getMercenaryRank(player) == 11) then
		captain = 1;
	else
		captain = 0;
	end;
	
	local merc = 2 -- Probably could be done, but not really important atm
	
	player:startEvent(0x008C,0,merc,runicpass,player:getCurrency("imperial_standing"),getAstralCandescence(),cost,captain);
	
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
	
	if (csid == 0x008C and option == 1) then
		player:addKeyItem(RUNIC_PORTAL_USE_PERMIT);
		player:messageSpecial(KEYITEM_OBTAINED,RUNIC_PORTAL_USE_PERMIT);
		player:delCurrency("imperial_standing", 200);
	elseif (csid == 0x008C and option == 2) then
		player:addKeyItem(RUNIC_PORTAL_USE_PERMIT);
		player:messageSpecial(KEYITEM_OBTAINED,RUNIC_PORTAL_USE_PERMIT);
	end
	
end;