-----------------------------------
--    Area: Port San d'Oria
--    NPC:  Fiva
--     Only sells when San d'Oria controls Kolshushu
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

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

RegionOwner = GetRegionOwner(KOLSHUSHU);

if (RegionOwner ~= SANDORIA) then 
    player:showText(npc,FIVA_CLOSED_DIALOG);
else
    player:showText(npc,FIVA_OPEN_DIALOG);
    
    stock = {0x1197,184,  --Buburimu Grape
             0x0460,1620, --Casablanca
             0x1107,220,  --Dhalmel Meat
             0x0266,72,   --Mhaura Garlic
             0x115d,40}   --Yagudo Cherry

showShop(player,SANDORIA,stock);
end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




