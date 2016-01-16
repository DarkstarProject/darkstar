-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Thadiene
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
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

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc,ASH_THADI_ENE_SHOP_DIALOG);

    local stock = {0x4380,1575,1,     --Boomerang
             0x430a,19630,1, --Great Bow
             --0x43a9,16,1,     --Silver Arrow
             0x4302,7128,1,     --Wrapped Bow

             0x43b8,5,2,     --Crossbow Bolt
             0x43aa,126,2,     --Fire Arrow
             0x43a8,7,2,     --Iron Arrow
             0x4301,482,2,     --Self Bow

             0x4308,442,3,     --Longbow
             0x4300,38,3,     --Shortbow
             0x43a6,3,3,     --Wooden Arrow
             0x13a5,4320,3}     --Scroll of Battlefield Elegy

    showNationShop(player, SANDORIA, stock);

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




