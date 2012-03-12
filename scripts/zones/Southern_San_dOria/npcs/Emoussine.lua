-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Emoussine
-- Chocobo Vendor
-- zone 230
-- @pos -11 1 -100
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
end;


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

price = 100;
gil = player:getGil();
hasLicense = player:hasKeyItem(CHOCOBO_LICENSE);
level = player:getMainLvl();

	if (hasLicense and level >= 15) then
		player:startEvent(0x0258,price,gil);
	else
		player:startEvent(0x025b,price,gil);
	end

end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

price = 100;
level = player:getMainLvl();

	if (csid == 0x0258 and option == 0) then
		if (level >= 20) then
			player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
		else
			player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
		end
		player:delGil(price);
		player:setPos(-126,-62,274,0x65,0x64);
	end

end;