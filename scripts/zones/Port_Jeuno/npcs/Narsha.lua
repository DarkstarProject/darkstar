-----------------------------------
-- Area: Port Jeuno
-- NPC: Narsha
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
		player:startEvent(0x2713,price,gil);
	else
		player:startEvent(0x2716,price,gil);
	end

end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

    local price = 100;

	if (csid == 0x2713 and option == 0) then
        if (player:delGil(price)) then
            if (player:getMainLvl() >= 20) then
                player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
            else
                player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
            end
            player:setPos(-574,2,400,0,0x78);
        end
	end

end;