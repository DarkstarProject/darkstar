-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Cletae
-- Guild Merchant NPC: Leathercrafting Guild 
-- @zone 230
-- @pos -189 -8 14
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:sendGuild(524,3,18,4)) then
		player:showText(npc,CLETAE_DIALOG);
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




