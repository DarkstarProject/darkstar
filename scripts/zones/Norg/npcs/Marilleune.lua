-----------------------------------
-- Area: Norg
-- NPC: Marilleune
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
		player:startEvent(0x0083,price,gil);
	else
		player:startEvent(0x0084,price,gil);
	end

end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

    local price = 100;

	if (csid == 0x0083 and option == 0) then
        if (player:delGil(price)) then
            if (player:getMainLvl() >= 20) then
                player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
            else
                player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
            end
            player:setPos(-456,17,-348,0,0x7b);
        end
	end

end;