-----------------------------------
-- Area: West Ronfaure
-- NPC:  Harvetour
-- @zone 100
-- @pos -448 -19 -214
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/conquestguards");
require("scripts/zones/West_Ronfaure/TextIDs");

region 	= RONFAURE;
csid	= 0x7ff4;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	owner = getRegionOwner(region);
	arg1 = getArg1(owner,player);
	
	if(owner == player:getNation()) then
		nation = 1;
	elseif(arg1 < 1792) then
		nation = 2;
	else
		nation = 0;
	end
	
	player:startEvent(csid,nation,OP_TeleFee(player,region),getCP(player),OP_TeleFee(player,region),0,0,0,0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
	
	player:updateEvent(player:getGil(),OP_TeleFee(player,region),getCP(player),OP_TeleFee(player,region));
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
	
	if(option == 1) then
		ShowOPVendorShop(player);
	elseif(option == 2) then
		player:delGil(OP_TeleFee(player,region));
		toHomeNation(player);
	end
	
end;