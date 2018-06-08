-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Plaiaude
-- Type: Chocobo Renter
-- !pos 244.705 24.034 296.973 108
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/chocobo");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local level = player:getMainLvl();
    local gil = player:getGil();

    if (player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and level >= 20) then
        local price = getChocoboPrice(player);
        player:setLocalVar("chocoboPriceOffer",price);

        player:startEvent(910,price,gil,1)
    else
        player:startEvent(911);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    local price = player:getLocalVar("chocoboPriceOffer");

    if (csid == 910 and option == 0) then
        if (player:delGil(price)) then
            updateChocoboPrice(player, price);

            local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

            player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,0,0,duration,true);
        end
    end
end;