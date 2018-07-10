-----------------------------------
-- Area: Windurst Woods
--  NPC: Orlaine
-- Chocobo Vendor
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

    if (player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and level >= 15) then
        local price = getChocoboPrice(player);
        player:setLocalVar("chocoboPriceOffer",price);

        if (level >= 20) then
            level = 0;
        end

        player:startEvent(10002,price,gil,level);
    else
        player:startEvent(10005);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    local price = player:getLocalVar("chocoboPriceOffer");

    if (csid == 10002 and option == 0) then
        if (player:delGil(price)) then
            updateChocoboPrice(player, price);

            if (player:getMainLvl() >= 20) then
                local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

                player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,0,0,duration,true);
            else
                player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,0,0,900,true);
            end

            player:setPos(-122,-4,-520,0,116);
        end
    end
end;