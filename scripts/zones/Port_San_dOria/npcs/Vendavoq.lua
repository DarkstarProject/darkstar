-----------------------------------
-- Area: Port San d'Oria
--  NPC: Vendavoq
-- Only sells when San d'Oria controls Movalpolos
-- Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/globals/quests");
local text = require("scripts/zones/Port_San_dOria/TextIDs");

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
            player:messageSpecial(text.FLYER_REFUSED);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = GetRegionOwner(MOVALPOLOS);

if (RegionOwner ~= SANDORIA) then 
    player:showText(npc, text.VENDAVOQ_CLOSED_DIALOG);
else
    player:showText(npc, text.VENDAVOQ_OPEN_DIALOG);
    
    local stock =
    {
    0x0280,11,   --Copper Ore
             0x1162,694,  --Coral Fungus
             0x1117,4032, --Danceshroom
             0x0672,6500, --Kopparnickel Ore
             0x142d,736}  --Movalpolos Water

    showShop(player,SANDORIA,stock);
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

