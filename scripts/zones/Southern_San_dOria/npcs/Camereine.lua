-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Camereine
-- Type: Chocobo Renter
-- @pos -8 1 -100
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/chocobo");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
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
    local level = player:getMainLvl();
    local gil = player:getGil();

    if (player:hasKeyItem(CHOCOBO_LICENSE) and level >= 15) then
        local price = getChocoboPrice(player);
        player:setLocalVar("chocoboPriceOffer",price);

        if (level >= 20) then
            level = 0;
        end

        player:startEvent(0x0257,price,gil,level);
    else
        player:startEvent(0x025A);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    local price = player:getLocalVar("chocoboPriceOffer");

    if (csid == 0x0257 and option == 0) then
        if (player:delGil(price)) then
            updateChocoboPrice(player, price);

            if (player:getMainLvl() >= 20) then
                local duration = 1800 + (player:getMod(MOD_CHOCOBO_RIDING_TIME) * 60)

                player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,1,0,duration,true);
            else
                player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,1,0,900,true);
            end

            player:setPos(-126,-62,274,0x65,0x64);
        end
    end
end;