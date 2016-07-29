----------------------------------
--  Area: Meriphataud_Mountains_[S]
--  NPC: Indescript Markings
--  Type: Quest
--  @pos -629.179 -49.002 -429.104 1 83
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs");
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

    local pantsQuestProgress = player:getVar("AF_SCH_PANTS");

    player:delStatusEffect(EFFECT_SNEAK);
    
    -- SCH AF Quest - Legs
    if (pantsQuestProgress > 0 and pantsQuestProgress < 3 and player:hasKeyItem(DJINN_EMBER) == false) then
        player:addKeyItem(DJINN_EMBER);
        player:messageSpecial(KEYITEM_OBTAINED, DJINN_EMBER);
        player:setVar("AF_SCH_PANTS", pantsQuestProgress + 1);
        npc:hideNPC(60);
       
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

