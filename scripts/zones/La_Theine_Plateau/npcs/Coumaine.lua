-----------------------------------
-- Area: La Theine Plateau
-- NPC: Coumaine
-- Chocobo Vendor
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
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
		player:startEvent(0x0078,price,gil);
	else
		player:startEvent(0x0079,price,gil);
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

	if (csid == 0x0078 and option == 0) then
        if (player:delGil(price)) then
            if (level >= 20) then
                player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
            else
                player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
            end
        end
	end

end;