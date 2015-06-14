-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Sulbahn
-- Type: Alchemy Adv. Image Support
-- @pos -10.470 -6.25 -141.700 241
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,1);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(EFFECT_ALCHEMY_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(0x027D,17160,1,19405,21215,30030,0,7,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,1);
    local SkillLevel = player:getSkillLevel(SKILL_ALCHEMY);

    if (guildMember == 1) then
        player:startEvent(0x027C,2,SkillLevel,0,511,0,0,7,2184);
    else
        player:startEvent(0x027C,0,0,0,0,0,0,7,0); -- Standard Dialogue
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
    if (csid == 0x027D) then
        player:messageSpecial(IMAGE_SUPPORT,0,7,0);
        player:addStatusEffect(EFFECT_ALCHEMY_IMAGERY,3,0,480);
    end
end;