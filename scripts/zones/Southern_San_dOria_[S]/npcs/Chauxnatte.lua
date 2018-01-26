-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Chauxnatte
-- !pos 85 1 -51 80
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

    if (player:hasKeyItem(CHOCOBO_LICENSE) and level >= 15) then
        local price = getChocoboPrice(player);
        player:setLocalVar("chocoboPriceOffer",price);

        if (level >= 20) then
            level = 0;
        end

        player:startEvent(106,price,gil,level);
    else
        player:startEvent(107);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- print("CSID:",csid);
    -- print("OPTION:",option);
    local price = player:getLocalVar("chocoboPriceOffer");

    if (csid == 106 and option == 0) then
        if (player:delGil(price)) then
            updateChocoboPrice(player, price);

            if (player:getMainLvl() >= 20) then
                local duration = 1800 + (player:getMod(MOD_CHOCOBO_RIDING_TIME) * 60)

                player:addStatusEffectEx(EFFECT_MOUNTED,EFFECT_MOUNTED,0,0,duration,true);
            else
                player:addStatusEffectEx(EFFECT_MOUNTED,EFFECT_MOUNTED,0,0,900,true);
            end

            player:setPos(94,-62,266,40,81);
        end
    end
end;
