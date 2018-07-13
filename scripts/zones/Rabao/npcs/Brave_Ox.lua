-----------------------------------
-- Area: Rabao
--  NPC: Brave Ox
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,BRAVEOX_SHOP_DIALOG);

stock =
{
    4654,77350,    --Protect IV
    4736,73710,    --Protectra IV
    4868,63700,    --Dispel
    4860,31850,    --Stun
    4720,31850,    --Flash
    4750,546000,    --Reraise III
    4638,78260,    --Banish III
    4701,20092,    --Cura
    4702,62192,    --Sacrifice
    4703,64584,    --Esuna
    4704,30967,    --Auspice
    4614,141137,    --Cure VI    (Not Implemented yet)
    4655,103882,    --Protect V    (Not Implemented yet)
    4660,125069    --Shell V    (Not Implemented yet)
}
    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
