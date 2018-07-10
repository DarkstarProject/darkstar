-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- Standard Merchant NPC
-- @zone 230
-- !pos 70 0 61
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    player:showText(npc,ASH_THADI_ENE_SHOP_DIALOG);

    local stock = {16455,4309,1,        --Baselard
             16532,16934,1,    --Gladius
             16545,21067,1,    --Broadsword
             16576,35769,1,    --Hunting Sword
             16524,13406,1,    --Fleuret

             16385,129,2,        --Cesti
             16450,1827,2,        --Dagger
             16536,7128,2,        --Iron Sword
             16566,8294,2,        --Longsword

             16448,140,3,        --Bronze Dagger
             16449,837,3,        --Brass Dagger
             16531,3523,3,        --Brass Xiphos
             16535,241,3,        --Bronze Sword
             16565,1674,3}        --Spatha

    dsp.shop.nation(player, stock, dsp.nation.SANDORIA);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
