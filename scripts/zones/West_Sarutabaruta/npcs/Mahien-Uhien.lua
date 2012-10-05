-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Mahien-Uhien
-- @zone 115
-- @pos -13 -12 311
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquestguards");
require("scripts/zones/West_Sarutabaruta/TextIDs");

region 	= SARUTABARUTA;
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
	
	owner = GetRegionOwner(region);
	arg1 = getArg1(owner,player);
	
	if(owner == player:getNation()) then
		nation = 1;
	elseif(arg1 < 1792) then
		nation = 2;
	else
		nation = 0;
	end
	
	player:startEvent(csid,nation,OP_TeleFee(player,region),player:getCP(),OP_TeleFee(player,region),0,0,0,0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
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
		if (player:delGil(OP_TeleFee(player,region))) then
            toHomeNation(player);
        end
	end
	
end;