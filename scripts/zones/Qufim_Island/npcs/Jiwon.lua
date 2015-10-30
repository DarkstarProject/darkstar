-----------------------------------
-- Area: Qufim Island
-- NPC:  Jiwon
-- Type: Outpost Vendor
-- @pos -249 -19 300 126
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Qufim_Island/TextIDs");

local region 	= QUFIMISLAND;
local csid	= 0x7ff4;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local owner = GetRegionOwner(region);
	local arg1 = getArg1(owner,player);
	
	if (owner == player:getNation()) then
		nation = 1;
	elseif (arg1 < 1792) then
		nation = 2;
	else
		nation = 0;
	end
	
	player:startEvent(csid,nation,OP_TeleFee(player,region),0,OP_TeleFee(player,region),player:getCP(),0,0,0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
	
	player:updateEvent(player:getGil(),OP_TeleFee(player,region),0,OP_TeleFee(player,region),player:getCP());
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
	
	if (option == 1) then
		ShowOPVendorShop(player);
	elseif (option == 2) then
		if (player:delGil(OP_TeleFee(player,region))) then
            toHomeNation(player);
        end
	elseif (option == 6) then
		player:delCP(OP_TeleFee(player,region));
        toHomeNation(player);
	end
	
end;